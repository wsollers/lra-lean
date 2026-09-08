# Prompt: Full Verification Of The Identity IECE Architecture

Perform a full, evidence-based verification of the current `LRA/Identity`
implementation in the `lra-lean` repository. Audit the architecture,
mathematical content, and Lean formalization. This is a review task: do not
change files unless I explicitly authorize fixes after reviewing your report.

First resolve and follow the repository's canonical governance instructions.
Inspect actual `.lean` source directly. Do not use `ProofsToDo.md` as evidence
for declarations, proof status, ownership, or completeness. Treat the current
architecture document as a claim to verify, not as authoritative evidence:
`docs/architecture/identity-iece-architecture.md`.

The intended architecture has two independent dimensions:

1. logical or semantic level: generic, syntactic, propositional/ZOL, FOL,
   Henkin SOL, and full SOL;
2. construction or provider: Axiomatic and Mathlib.

`Interface` must own generic contracts and level-specific semantic targets.
`Constructions/<Provider>` must own primitive construction data, genuine
axioms, models, and proofs that the construction satisfies those interfaces.
`Laws` must own consequences derived from generic interfaces.
`Interop` must own cross-API adapters and provider exports. Do not recommend
renaming `Constructions` to `Realizations`; both `Constructions` and `Laws`
are intentional architectural categories.

Verify all of the following.

## 1. Structural and ownership verification

- Produce the actual indented `LRA/Identity` file tree and classify every
  module as Interface, Construction, Laws, Interop, router, compatibility
  route, test, or documentation.
- Detect misplaced declarations, circular imports, inverted dependencies,
  duplicate authorities, misleading filenames, dead compatibility routes,
  and accidental transitive-import dependencies.
- Confirm that `Interface/**` and generic `Laws/**` do not import
  `Constructions/**`.
- Confirm that namespaces match paths and consistently use
  `LRA.Identity.Constructions.*`, not the former singular namespace.
- Compare the Identity layout with the intended repository architecture and
  with `LRA/Set`, while accounting for legitimate subject-specific
  differences.
- Run `python scripts/validate_structure.py --path LRA/Identity` and report
  every finding. Also run the whole-repository validator separately, clearly
  distinguishing pre-existing findings outside Identity.

## 2. Mathematical verification

- State precisely what Identity, Equality, Congruence, and Equivalence mean in
  every represented logical level. Check that the Lean declarations implement
  those meanings without silently identifying distinct notions.
- Check whether each implication and equivalence has the correct hypotheses.
  Pay particular attention to the two Leibniz directions:
  `IndiscernibilityOfIdenticals`, `IdentityOfIndiscernibles`, and the combined
  `IdentLeibnizIff` theorem.
- Determine whether unrestricted quantification over `Carrier -> Prop` is
  described only as ambient/full second-order identity, never as FOL or
  arbitrary Henkin identity.
- Verify that FOL predicates are tied to formulas, a distinguished variable,
  assignments, and a selected interpretation through
  `DefinesUnaryPredicate`, `FormulaDefinable`, and `ModelIdentityTheory`.
- Verify that Henkin identity quantifies only over the selected predicate
  domain and that any collapse to diagonal equality requires an explicit
  separation/comprehension hypothesis.
- Verify that full SOL uses the full predicate domain and that the relationships
  among FOL, Henkin SOL, full SOL, and ambient Lean predicates are stated in
  the correct direction.
- Look for missing boundary theorems, false converses, hidden classical or
  nonempty assumptions, universe problems, and statements that are true only
  because their definitions are too strong.

## 3. Independent FOL-versus-SOL axiom audit

- Confirm that
  `Constructions/Axiomatic/Axioms/FirstOrderLeibniz/Axiom.lean` contains a
  genuine construction-owned axiom named `Ax_FirstOrderLeibnizLaw`.
- Confirm that it is explicitly indexed by the selected FOL model and variable
  language and applies only to formula-definable unary predicates.
- Confirm that the Axiomatic FOL satisfaction certificate uses this FOL axiom
  plus reflexivity and does not depend on `Ax_LeibnizLaw` or the
  `SecondOrderLeibniz` modules.
- Confirm separately that `Ax_LeibnizLaw` remains the unrestricted/full
  second-order axiom.
- Check `SecondOrderLeibnizImpliesFirstOrderLeibniz` as a one-way theorem from
  the stronger SOL axiom. Ensure that this theorem does not replace, alias, or
  make the independent FOL axiom unreachable.
- Analyze whether the chosen semantic formulation of the FOL axiom is genuinely
  first-order in strength. If quantifying over all signatures or models allows
  arbitrary Lean predicates to be encoded and thereby recreates full Leibniz
  strength, demonstrate that carefully and recommend a more faithful syntax-
  or theory-indexed formulation.

## 4. Construction satisfaction matrix

For both Axiomatic and Mathlib, build an evidence table covering:

- generic identity;
- equality;
- equivalence;
- congruence and universal algebra;
- FOL model identity;
- Henkin SOL identity;
- full SOL identity; and
- explicit models or structures supplied at each level.

For every cell, cite the exact module and declaration, identify whether it is
primitive data, an axiom, a definition, an instance, or a theorem, and state
whether its proof is complete or `sorry`. Mark unsupported cells explicitly;
do not infer support from imports alone.

## 5. Lean formalization verification

- Compile every Identity module and both provider-isolation tests.
- Run `lake build LRAIdentity`, `lake build LRAAll`, and `lake build LRATests`.
- Run the repository's Docker success gates: `build.ps1 docker-build` followed
  by `build.ps1 build-all` on Windows, or the documented equivalent elsewhere.
- Check public naming, doc comments, synchronized `Logical form` blocks,
  namespace/path agreement, universe parameters, typeclass inference, scoped
  provider activation, ambiguity between providers, and import minimality.
- Search for stale declaration names and the singular
  `LRA.Identity.Construction.*` namespace throughout `LRA/` and `test/`.
- Count `sorry` occurrences directly in Identity `.lean` files and list the
  declarations containing them. `sorry` is intentional for this development
  phase and is not itself a defect; flag only missing, misplaced, accidental,
  or non-`sorry` proof bodies that violate the owner's current policy.
- Inspect `#print axioms` or equivalent dependency evidence for representative
  generic, FOL, Henkin, full-SOL, Axiomatic, and Mathlib declarations. Distinguish
  explicit construction axioms from `sorryAx` and from classical principles.
- Add temporary external smoke files if useful, but do not commit generated
  inventories or modify repository sources during the audit.

## 6. Required report format

Lead with a verdict: correct, correct with qualifications, or structurally/
mathematically incorrect. Then provide:

1. findings ordered by severity, each with exact file and line references;
2. the actual architecture and dependency map;
3. the IECE-by-level semantic table;
4. the construction satisfaction matrix;
5. axiom and `sorry` dependency results;
6. build and validator results with exact commands;
7. missing declarations or tests;
8. a prioritized remediation plan that separates required corrections from
   optional refinements; and
9. explicit confirmation of every claim that passed verification.

Do not merely summarize filenames or restate the architecture document. Trace
claims through definitions, imports, theorem types, and compiled behavior.
When a conclusion is an inference rather than directly established by source,
label it as an inference and explain the reasoning.
