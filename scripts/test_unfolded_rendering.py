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
