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
29db04f Prove ZFC basic axiom readings
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
  Sentence.lean
```

First-order semantics:

```text
LRA/VolumeI/Logic/Semantics.lean
LRA/VolumeI/Logic/Semantics/
  Assignment.lean
  TermEvaluation.lean
  Satisfaction.lean
  Substitution.lean
  Sentence.lean
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
  Syntax/Sentence.lean
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
  Semantics/ClosedAxioms.lean
  Semantics/SchemaCorrectness.lean
  Semantics/AxiomReadings.lean
  Semantics/Examples.lean
```

## Current Checkpoints

Recent committed checkpoints:

```text
c437b46 Prove ZFC schema variable infrastructure facts
81c0391 Add ZFC schema semantic correctness readings
bd66811 Update foundation restart handoff
9e969f2 Add first-order substitution semantics bridge
8327ebe Refresh foundation restart handoff
a5f49e2 Prove first-order substitution semantics
d9eed0e Discharge Replacement rename capture condition
30fd98f Add cleaned Replacement schema reading
8914e21 Refresh handoff after cleaned Replacement reading
2dd08ea Refine Replacement schema semantics API
a96d329 Refresh handoff after Replacement API refinement
a39dc9d Clarify Replacement schema semantics API
f24e7a3 Refresh handoff before Separation schema API
5054233 Add clean Separation schema semantics API
91012e0 Refresh handoff before sentence infrastructure
b4ca411 Add first-order sentence infrastructure
e4d8e2e Refresh handoff after sentence infrastructure
d9de1c3 Add closed ZFC axiom satisfaction facts
32b0c40 Refresh handoff after closed ZFC axiom facts
1820131 Add one-assignment ZFC basic axiom API
061a935 Refresh handoff after basic axiom API
0039962 Add ZFC sentence satisfaction API
aff6a0c Refresh handoff after ZFC sentence API
21cca9a Package basic ZFC axioms as sentences
285de34 Refresh handoff after basic axiom sentence packaging
117dd5f Add clean aggregate ZFC predicates
1db13a7 Refresh handoff after clean aggregate ZFC predicates
bda4019 Add clean ZFC aggregate projection lemmas
153e596 Refresh handoff at pre-operations stop line
c028c3c Add ZFC basic axiom readings API
29db04f Prove ZFC basic axiom readings
```

Those changes add:

- free-variable bounds for first-order substitution;
- closedness checks for named ZFC axioms;
- named schema helper variables and freshness facts;
- free-variable subset theorems for Separation and Replacement schemas;
- a Replacement capture-regression example showing the output-prime variable
  avoids bound variables, not just free variables;
- semantic readings and satisfaction-correctness lemmas for Separation and
  Replacement schema constructors;
- generic first-order term-substitution semantics;
- proved formula-level substitution semantics;
- a ZFC-facing lemma reading Replacement's renamed predicate as the original
  predicate with the output variable updated to the output-prime value;
- an automatic proof that Replacement's output-prime rename is capture-avoiding;
- a cleaned Replacement schema semantic reading that uses the output-updated
  original predicate instead of the syntactic renamed predicate;
- a clean model-level Replacement schema predicate
  (`SatisfiesReplacementSchemaCleanly`) and examples showing the preferred API;
- clarified documentation separating the formula-satisfaction Replacement
  predicate from the preferred clean model-facing bridge.
- a clean model-level Separation schema predicate
  (`SatisfiesSeparationSchemaCleanly`) and examples showing the preferred API.
- generic first-order closed-formula and sentence syntax;
- assignment-independence for closed first-order formulas;
- ZFC-facing sentence aliases and syntax checkpoints.
- named ZFC axiom formulas packaged as closed `ZFCSentence`s;
- assignment-independence facts for satisfaction of the named closed ZFC
  axioms.
- a one-assignment predicate for the named basic ZFC axioms
  (`SatisfiesZFCBasicAxiomsAt`);
- equivalences showing the one-assignment basic-axiom view matches the existing
  all-assignments predicate.
- a ZFC-facing sentence satisfaction wrapper (`satisfiesZFCSentence`);
- a bridge showing sentence satisfaction agrees with satisfaction of the
  underlying formula under any chosen assignment;
- named checkpoints for the closed ZFC axiom sentence wrappers.
- a sentence-level predicate for the named basic ZFC axioms
  (`SatisfiesZFCBasicAxiomSentences`);
- equivalences from that sentence-level predicate to
  `SatisfiesZFCBasicAxiomsAt` and `SatisfiesZFCBasicAxioms`.
- preferred clean aggregate ZFC predicates without Replacement and without
  Choice;
- equivalences between those clean aggregates and the existing
  formula-satisfaction aggregate predicates.
- projection lemmas for the clean aggregate predicates;
- a monotonicity lemma showing clean ZFC without Choice implies clean ZFC
  without Replacement.
- an element-level ZFC model membership relation named `zfcSetMembership`;
- proved element-level readings for Extensionality, Pairing, and Union in
  `Semantics/AxiomReadings.lean`.

The working tree should be clean after this handoff is committed.

There are no known proof-pending declarations in
`LRA/VolumeI/Logic/Semantics/Substitution.lean`,
`LRA/VolumeI/Set/ZFC/Semantics/SchemaCorrectness.lean`, or
`LRA/VolumeI/Set/ZFC/Semantics/AxiomReadings.lean`.

## Most Recent Validation

These commands passed:

```text
lake build LRA.VolumeI.Logic.Semantics.Substitution
lake build LRA.VolumeI.Logic.Semantics.Sentence
lake build LRA.VolumeI.Set.ZFC.Theory.ClosedAxioms
lake build LRA.VolumeI.Set.ZFC.Semantics.Satisfaction
lake build LRA.VolumeI.Set.ZFC.Semantics.ClosedAxioms
lake build LRA.VolumeI.Set.ZFC.Semantics.SchemaCorrectness
lake build LRA.VolumeI.Set.ZFC.Semantics.AxiomReadings
lake build LRA.VolumeI.Set.ZFC.Semantics.Examples
lake build LRA.VolumeI.Set.ZFC.Syntax.Sentence
lake build LRAVolumeI
git diff --check
```

Expected warnings:

```text
mathlib: repository '.lake/packages/mathlib' has local changes
batteries: repository '.lake/packages/batteries' has local changes
```

The package warnings existed before this work and are not caused by the current
Volume I changes.

## Immediate Next Task

Start binary union only. Add the first operations module for binary union,
using the proved element-level readings in `Semantics/AxiomReadings.lean`.

Suggested scope:

1. add `LRA/VolumeI/Set/ZFC/Operations.lean`;
2. add `LRA/VolumeI/Set/ZFC/Operations/Union.lean`;
3. define `IsBinaryUnion` using `zfcSetMembership`;
4. prove `exists_binaryUnion` from `pairingAxiomReading` and
   `unionAxiomReading`;
5. prove `isBinaryUnion_unique` from `extensionalityAxiomReading`;
6. optionally define the selected noncomputable `binaryUnion` and its
   membership characterization if the first two proofs stay small.

Do not start union algebra laws yet unless explicitly requested after this
checkpoint. Do not start intersection, complement, indexed union, relation
algebra, functions, quotients, orders, cardinality, or number systems.

Keep this in the ZFC syntax/semantics/theory boundary. Do not begin relation
algebra, general functions, quotients, orders, cardinality, number systems, or
set operations such as union/intersection/complement APIs and laws.

Do not move to relation algebra, general functions, quotients, orders,
cardinality, or number systems.

## Fresh Conversation Request

To continue in a new Codex conversation, paste this:

```text
We are working in F:\repos\lra-lean.

Read docs/restart/handoff-prompt.md, then inspect git status and the latest
commit. Continue from the current handoff exactly: start binary union only by
adding `Operations/Union.lean`, defining `IsBinaryUnion`, proving existence
from Pairing and Union readings, and proving uniqueness from Extensionality.
Only add the selected `binaryUnion` operation and membership theorem if that
stays within the same small checkpoint. Do not start union algebra laws,
intersection, complement, indexed union, relation algebra, functions, quotients,
orders, cardinality, or number systems.
```
