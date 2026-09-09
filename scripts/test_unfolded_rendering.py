#!/usr/bin/env python3
"""Focused tests for human-facing unfolded statement rendering."""

from __future__ import annotations

import importlib.util
from pathlib import Path
import sys
import unittest


REPO_ROOT = Path(__file__).resolve().parents[1]
GENERATOR = REPO_ROOT / "scripts" / "generate_proofs_todo.py"


def load_generator():
    spec = importlib.util.spec_from_file_location("generate_proofs_todo", GENERATOR)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {GENERATOR}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


GEN = load_generator()


class UnfoldedRenderingTest(unittest.TestCase):
    def test_prop_structure_contract_is_fully_quantified(self) -> None:
        compiled_rows = GEN.load_tsv(REPO_ROOT / "build" / "proofs-todo-environment.tsv")
        row = next(
            item
            for item in compiled_rows["LRA.Identity.Interface.ZeroOrder.Theory"]
            if item.fq_name == "LRA.Identity.Interface.ZeroOrder.Theory"
        )

        rendered = GEN.resolve_unfolded(row, row.pretty_type_uncurried)

        self.assertTrue(rendered.startswith("∀ {L :"))
        self.assertIn("∀ (formula : L.Formula), formula = formula", rendered)
        self.assertIn("M.Holds left ↔ M.Holds right", rendered)
        self.assertNotIn("structure Theory", rendered)

    def test_nested_identity_theory_expands_but_satisfaction_stays_opaque(self) -> None:
        compiled_rows = GEN.load_tsv(REPO_ROOT / "build" / "proofs-todo-environment.tsv")
        row = next(
            item
            for item in compiled_rows[
                "LRA.Identity.Constructions.Axiomatic.Axioms.FirstOrderLeibniz.Satisfies"
            ]
            if item.fq_name.endswith(".SatisfiesFOLModelIdentity")
        )

        rendered = GEN.resolve_unfolded(row, row.pretty_type_uncurried)

        self.assertIn("[inst : DecidableEq Variable]", rendered)
        self.assertIn("Ax_IdentityRelation x x", rendered)
        self.assertIn("LRA.Logic.FirstOrder.Satisfies", rendered)
        self.assertIn("LRA.Logic.updateAssignment", rendered)
        self.assertNotIn("ModelIdentityTheory", rendered)
        self.assertNotIn("Decidable.casesOn", rendered)

    def test_opaque_binary_predicate_axiom_is_rendered_as_an_application(self) -> None:
        self.assertEqual(
            GEN.opaque_predicate_logic(
                "Ax_IdentityRelation",
                "{Carrier : Type u} : Carrier → Carrier → Prop",
                "axiom",
            ),
            "fun {Carrier : Type u} (left right : Carrier) => "
            "Ax_IdentityRelation left right",
        )

    def test_propositional_axiom_is_not_treated_as_a_predicate_declaration(self) -> None:
        self.assertIsNone(
            GEN.opaque_predicate_logic(
                "Ax_IdentityReflexivity",
                "{Carrier : Type u} (x : Carrier) : Ax_IdentityRelation x x",
                "axiom",
            )
        )

    def test_final_axiom_signature_stops_before_module_end(self) -> None:
        declaration = "axiom Ax_IdentityRelation {Carrier : Type u} : Carrier → Carrier → Prop\n\nend Example"
        name_end = declaration.index("Ax_IdentityRelation") + len("Ax_IdentityRelation")

        self.assertEqual(
            GEN.extract_signature(declaration, name_end, "axiom"),
            "{Carrier : Type u} : Carrier → Carrier → Prop",
        )

    def test_axiom_signature_stops_before_anonymous_instance(self) -> None:
        declaration = "axiom MembershipRelation : Item → Container → Prop\n\ninstance : Membership Item Container where\n  mem := MembershipRelation"
        name_end = declaration.index("MembershipRelation") + len("MembershipRelation")

        self.assertEqual(
            GEN.extract_signature(declaration, name_end, "axiom"),
            ": Item → Container → Prop",
        )

    def test_source_file_reference_is_clickable_markdown(self) -> None:
        self.assertEqual(
            GEN.markdown_file_ref("./Bounds/Theorems.lean#L42"),
            "[`./Bounds/Theorems.lean#L42`](./Bounds/Theorems.lean#L42)",
        )

    def test_identity_projection_is_not_rendered_as_order(self) -> None:
        predicate = (
            "∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] "
            "(P : Carrier → Prop) (left right : Carrier), "
            "(P left ∧ P right) → inst.Ident left right"
        )
        row = GEN.CompiledTheorem(
            fq_name="LRA.Identity.AtMostOne",
            module="LRA.Identity.Laws.Witnesses",
            kind="instance",
            uses_sorry=False,
            pretty_type_uncurried=predicate,
            pretty_type_unfolded=(
                "∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] "
                "(P : Carrier → Prop) (left right : Carrier), "
                "And (P left) (P right) → inst.1 left right"
            ),
            unfold_status="ok",
        )

        rendered = GEN.resolve_unfolded(row, predicate)

        self.assertIn("inst.Ident left right", rendered)
        self.assertNotIn("left ≤ right", rendered)

    def test_generic_instance_projection_is_not_assumed_to_be_order(self) -> None:
        self.assertEqual(
            GEN.humanize_compiled_logic("inst.1 left right"),
            "inst.1 left right",
        )

    def test_core_name_is_not_rewritten_inside_decidable_eq(self) -> None:
        rendered = GEN.humanize_compiled_logic(
            "∀ (Variable : Type) [inst : DecidableEq Variable], P Variable"
        )

        self.assertEqual(
            rendered,
            "∀ (Variable : Type) [inst : DecidableEq Variable], P Variable",
        )

    def test_exists_lambdas_render_as_quantifiers(self) -> None:
        rendered = GEN.humanize_compiled_logic(
            "Exists fun formula => Exists fun (x : Carrier) => P formula x"
        )

        self.assertEqual(rendered, "∃ formula, ∃ (x : Carrier), P formula x")

    def test_identity_binder_restores_projection_after_predicate_unfolding(self) -> None:
        predicate = (
            "∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] "
            "(P : Carrier → Prop), LRA.Identity.NotAtMostOne P"
        )
        unfolded = (
            "∀ {Carrier : Type u} [inst : LRA.Identity.IdentityRelation Carrier] "
            "(P : Carrier → Prop), Exists fun left => Exists fun right => "
            "And (P left) (And (P right) (inst.1 left right → False))"
        )

        rendered = GEN.restore_named_relation_projections(unfolded, predicate)

        self.assertIn("inst.Ident left right", rendered)
        self.assertNotIn("inst.1 left right", rendered)

    def test_derivative_equivalence_rendering(self) -> None:
        module_path = (
            REPO_ROOT / "LRA" / "Analysis" / "Differentiation" / "DerivativeDefinition.lean"
        )
        source_module = GEN.scan_source_module(module_path, "LRA")
        theorem = next(item for item in source_module.theorems if item.name == "DerivativeEquivalence")
        compiled_rows = GEN.load_tsv(REPO_ROOT / "build" / "proofs-todo-environment.tsv")
        row = next(
            item
            for item in compiled_rows[source_module.module]
            if item.fq_name.endswith(".DerivativeEquivalence")
        )

        rendered = GEN.render_unfolded_statement(
            GEN.theorem_environment_signature(theorem),
            row,
            GEN.choose_predicate_logic(row, theorem),
        )

        expected = "\n".join(
            [
                "Ambient",
                "  (ℝ)",
                "Objects",
                "  D : ℝ",
                "  f : ℝ → ℝ",
                "  A : Set ℝ",
                "  c : ℝ",
                "Prove",
                "  Derivative D f A c ↔ DerivativeNeighborhood D f A c ∧ DerivativeSequential D f A c",
            ]
        )
        self.assertEqual(rendered, expected)

    def test_union_preserves_upper_bounds_rendering(self) -> None:
        module_path = REPO_ROOT / "LRA" / "Analysis" / "Bounds" / "Algebra" / "SetOperationsAndBounds.lean"
        source_module = GEN.scan_source_module(module_path, "LRA")
        theorem = next(
            item for item in source_module.theorems if item.name == "UnionPreservesUpperBounds"
        )
        compiled_rows = GEN.load_tsv(REPO_ROOT / "build" / "proofs-todo-environment.tsv")
        row = next(
            item
            for item in compiled_rows[source_module.module]
            if item.fq_name.endswith(".UnionPreservesUpperBounds")
        )

        rendered = GEN.render_unfolded_statement(
            GEN.theorem_environment_signature(theorem),
            row,
            GEN.choose_predicate_logic(row, theorem),
        )

        expected = "\n".join(
            [
                "Ambient",
                "  (S, ≤)",
                "Objects",
                "  A B : Set S",
                "  u : S",
                "Prove",
                "  ((∀ (x : S), x ∈ A → x ≤ u) ∧ (∀ (x : S), x ∈ B → x ≤ u)) → ∀ (x : S), x ∈ A ∪ B → x ≤ u",
            ]
        )
        self.assertEqual(rendered, expected)


if __name__ == "__main__":
    unittest.main()
