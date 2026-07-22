# Handoff Prompt

We are working in `F:/repos/lra-lean`.

Start by reading:

```text
docs/restart/foundation-restart-plan.md
docs/restart/foundation-restart-plan/04a-first-order-logic-first-pass.md
```

Then inspect the current working tree before editing:

```text
git status --short
git log -1 --oneline
```

The latest committed checkpoint is:

```text
9e969f2 Add first-order substitution semantics bridge
```

## Current Restart State

The old Lean tree is archived and must be preserved for salvage:

```text
LRA-OLD/
```

The restart has moved beyond the old "begin first-order logic" prompt. Volume I
now has first-order syntax infrastructure under `LRA/VolumeI/Logic/Syntax/`
and a first ZFC-on-first-order layer under `LRA/VolumeI/Set/ZFC/`. The ZFC
schema variable infrastructure and first semantic bridge checkpoints have been
committed.

Do not build relation algebra, functions, quotients, orders, cardinality, or
number systems yet.

## Design Decisions To Preserve

- Bourbaki is inspiration for ordering, rigor, and proof-theoretic orientation,
  not notation law.
- Use modern mathematical logic, proof theory, model theory, and set theory
  terminology.
- Lean `Prop` remains the proof engine for ordinary mathematical proofs.
- Object logics are Volume I learning artifacts unless a later design decision
  says otherwise.
- Shared object-logic vocabulary lives in `LRA/VolumeI/Logic/Core.lean`.
- The top-level `Logic` interface has `Formula`, `Theory`, `Structure`,
  `satisfies`, and `models`.
- Logic mixins include truth values, Boolean evaluation, connectives,
  quantifiers, theoremhood, and semantic entailment.
- `LogicalLanguage`, `LogicalFormula`, `LogicalStructure`, and
  `LogicalTheory` remain as a concrete helper layer for simple
  connective-based object logics.
- Propositional logic implements the shared interface as `propositionalLogic`.
- First-order logic has its own syntax: signatures/languages, terms, formulas,
  variables, structures/models, assignments, term evaluation, satisfaction,
  substitution, free variables, all variables, and subformulas.
- Treat `Logic` as an outer mixin/interface target. Do not force first-order
  syntax into `LogicalFormula` if its own syntax is cleaner.
- Shared connective notation lives in `LRA.VolumeI.Logic.Notation` and is
  opt-in through connective classes.
- Definitions must be real. Theorem statements must be honest. Proof bodies may
  use `sorry`.

## Current Lean Layout Of Interest

First-order syntax:

```text
LRA/VolumeI/Logic/Syntax/FirstOrder.lean
LRA/VolumeI/Logic/Syntax/FirstOrder/
  AllVariables.lean
  Formula.lean
  FreeVariables.lean
  FreeVariablesInTerm.lean
  IsSubstitutable.lean
  Substitute.lean
  SubstituteInTerm.lean
  SubstitutionFreeVariables.lean
  Subformula.lean
```

First-order semantics:

```text
LRA/VolumeI/Logic/Semantics.lean
LRA/VolumeI/Logic/Semantics/
  Assignment.lean
  TermEvaluation.lean
  Satisfaction.lean
  Substitution.lean
  Examples.lean
```

ZFC layer:

```text
LRA/VolumeI/Set/ZFC.lean
LRA/VolumeI/Set/ZFC/
  Language.lean
  Language/Signature.lean
  Syntax.lean
  Syntax/Formula.lean
  Syntax/FreeVariables.lean
  Syntax/FreshVariable.lean
  Syntax/Vocabulary.lean
  Syntax/Examples.lean
  Theory.lean
  Theory/Axioms.lean
  Theory/Schemas.lean
  Theory/ClosedAxioms.lean
  Theory/SchemaFacts.lean
  Theory/SchemaFreeVariables.lean
  Theory/Examples.lean
  Model.lean
  Model/Model.lean
  Model/ZFSetModel.lean
  Semantics.lean
  Semantics/Satisfaction.lean
  Semantics/SchemaCorrectness.lean
  Semantics/Examples.lean
```

## Current Checkpoints

Recent committed checkpoints:

```text
c437b46 Prove ZFC schema variable infrastructure facts
81c0391 Add ZFC schema semantic correctness readings
bd66811 Update foundation restart handoff
9e969f2 Add first-order substitution semantics bridge
```

Those changes add:

- free-variable bounds for first-order substitution;
- closedness checks for named ZFC axioms;
- named schema helper variables and freshness facts;
- free-variable subset theorems for Separation and Replacement schemas;
- a Replacement capture-regression example showing the output-prime variable
- semantic readings and satisfaction-correctness lemmas for Separation and
  Replacement schema constructors;
- generic first-order term-substitution semantics;
- proof-pending formula-level substitution semantics;
- a ZFC-facing lemma reading Replacement's renamed predicate as the original
  predicate with the output variable updated to the output-prime value.

The working tree should be clean after this handoff is committed.

Known proof-pending declarations:

```text
LRA.VolumeI.Logic.FirstOrder.satisfies_iff_of_agrees_on_freeVariables
LRA.VolumeI.Logic.FirstOrder.satisfies_substitute_iff_update
```

Both are honest theorem statements in
`LRA/VolumeI/Logic/Semantics/Substitution.lean` and currently use `sorry`.
There should be no `admit`.

## Most Recent Validation

These commands passed:

```text
lake build LRA.VolumeI.Logic.Semantics.Substitution
lake build LRA.VolumeI.Set.ZFC.Semantics.SchemaCorrectness
lake build LRAVolumeI
git diff --check
```

Expected warnings:

```text
LRA/VolumeI/Logic/Semantics/Substitution.lean: declaration uses 'sorry'
mathlib: repository '.lake/packages/mathlib' has local changes
batteries: repository '.lake/packages/batteries' has local changes
```

The package warnings existed before this work and are not caused by the current
Volume I changes.

## Immediate Next Task

First, inspect the current working tree and latest commit. If the tree is
clean, continue with the first-order substitution proof obligations in
`LRA/VolumeI/Logic/Semantics/Substitution.lean`:

1. complete `satisfies_iff_of_agrees_on_freeVariables`;
2. complete `satisfies_substitute_iff_update`;
3. rerun the validation above;
4. if the warnings disappear except for pre-existing package warnings, commit
   the proof completion.

After that, use the completed substitution theorem to strengthen the ZFC
Replacement semantic bridge: prove the output-prime substitution side condition
from the freshness facts, and expose a Replacement reading that does not require
callers to pass a separate capture-avoidance hypothesis.

Do not move to relation algebra, general functions, quotients, orders,
cardinality, or number systems.

## Fresh Conversation Request

To continue in a new Codex conversation, paste this:

```text
We are working in F:\repos\lra-lean.

Read docs/restart/handoff-prompt.md, then inspect git status and the latest
commit. Continue from the current handoff exactly: complete the proof-pending
first-order substitution semantics lemmas, rerun the stated validation, and if
it passes, commit the proof completion. Do not move to relation algebra,
functions, quotients, orders, cardinality, or number systems.
```
