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
b4cedb7 Reorganize ZFC syntax and schema infrastructure
```

## Current Restart State

The old Lean tree is archived and must be preserved for salvage:

```text
LRA-OLD/
```

The restart has moved beyond the old "begin first-order logic" prompt. Volume I
now has first-order syntax infrastructure under `LRA/VolumeI/Logic/Syntax/`
and a first ZFC-on-first-order layer under `LRA/VolumeI/Set/ZFC/`.

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
  Semantics/Examples.lean
```

## Current Uncommitted Work

At the time this handoff was updated, the following files were modified or
untracked and validated locally:

```text
M  LRA/VolumeI/Logic/Syntax/FirstOrder.lean
M  LRA/VolumeI/Set/ZFC/Theory.lean
M  LRA/VolumeI/Set/ZFC/Theory/Examples.lean
?? LRA/VolumeI/Logic/Syntax/FirstOrder/SubstitutionFreeVariables.lean
?? LRA/VolumeI/Set/ZFC/Theory/ClosedAxioms.lean
?? LRA/VolumeI/Set/ZFC/Theory/SchemaFacts.lean
?? LRA/VolumeI/Set/ZFC/Theory/SchemaFreeVariables.lean
```

Those changes add:

- free-variable bounds for first-order substitution;
- closedness checks for named ZFC axioms;
- named schema helper variables and freshness facts;
- free-variable subset theorems for Separation and Replacement schemas;
- a Replacement capture-regression example showing the output-prime variable
  avoids bound variables, not just free variables.

The new files should not contain `sorry` or `admit`.

## Most Recent Validation

These commands passed:

```text
lake build LRA.VolumeI.Set.ZFC.Theory.SchemaFreeVariables
lake build LRAVolumeI
git diff --check
```

Expected warnings:

```text
mathlib: repository '.lake/packages/mathlib' has local changes
batteries: repository '.lake/packages/batteries' has local changes
```

Those package warnings existed before this handoff and are not caused by the
current Volume I changes.

## Immediate Next Task

First, review the uncommitted changes and decide whether to commit them as the
next checkpoint. Do not start a new architecture layer before doing that review.

Useful review commands:

```text
git diff -- LRA/VolumeI/Logic/Syntax/FirstOrder.lean
git diff -- LRA/VolumeI/Set/ZFC/Theory.lean
git diff -- LRA/VolumeI/Set/ZFC/Theory/Examples.lean
git diff --stat
rg -n "\b(sorry|admit)\b" LRA/VolumeI/Logic/Syntax/FirstOrder/SubstitutionFreeVariables.lean LRA/VolumeI/Set/ZFC/Theory/ClosedAxioms.lean LRA/VolumeI/Set/ZFC/Theory/SchemaFacts.lean LRA/VolumeI/Set/ZFC/Theory/SchemaFreeVariables.lean
```

If the review looks good, commit the validated infrastructure. A reasonable
commit message is:

```text
Prove ZFC schema variable infrastructure facts
```

After that, the next implementation target is the semantic bridge for the ZFC
schemas: prove or state honest satisfaction/correctness lemmas connecting the
syntactic Separation and Replacement schema constructors to their intended
model-theoretic readings. Keep this in the ZFC theory/semantics layer. Do not
move to relation algebra, general functions, quotients, orders, cardinality, or
number systems.

## Fresh Conversation Request

To continue in a new Codex conversation, paste this:

```text
We are working in F:\repos\lra-lean.

Read docs/restart/handoff-prompt.md, then inspect git status and the latest
commit. Continue from the current handoff exactly: review the validated
uncommitted Volume I/ZFC schema infrastructure, rerun the stated validation,
and if it still passes, commit it with a clear message. Do not move to relation
algebra, functions, quotients, orders, cardinality, or number systems.
```
