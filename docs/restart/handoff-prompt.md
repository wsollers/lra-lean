# Handoff Prompt

We are working in `F:/repos/lra-lean`.

Start by reading the tracker:

```text
docs/restart/foundation-restart-plan.md
```

That file is the source of truth for the restart status, step index, design
decisions, and next action.

## Current Restart State

The old Lean tree has been archived:

```text
LRA-OLD/
```

The new `LRA/` tree is intentionally minimal. Current focus is Volume I
first-order logic, before moving to sets.

Important design decisions:

- Bourbaki is inspiration for ordering, rigor, and proof-theoretic orientation,
  not a requirement to preserve Bourbaki's historical notation.
- The restart targets modern mathematical logic, proof theory, and set theory in
  contemporary notation and terminology.
- Lean's native `Prop` is the proof engine for ordinary mathematical
  formalization.
- Object logics are Volume I learning artifacts unless a later design decision
  says otherwise.
- Shared object-logic vocabulary lives in `LRA/VolumeI/Logic/Core.lean`.
  The top-level interface is `Logic`, with mixins for truth values, Boolean
  evaluation, connectives, quantifiers, theoremhood, and semantic entailment.
  The `LogicalLanguage`/`LogicalFormula` layer remains as a concrete syntax
  helper for simple connective-based object logics.
- Shared connective notation lives in `LRA.VolumeI.Logic.Notation` and is
  opt-in through connective classes. Quantifier notation is deliberately
  delayed until first-order syntax is designed.
- Generic formula-formation facts live in `LRA.VolumeI.Logic.ClosureRules`.
  Concrete logic files should use them directly rather than wrapping them under
  local theorem names.
- Generic formula minimality/induction facts live in
  `LRA.VolumeI.Logic.FormulaMinimality`.
- Generic Bool-valued semantics live under `LRA.VolumeI.Logic.Semantics`, split
  into `Satisfaction`, `TheoryModels`, and `Entailment`.
- Do not start relation algebra, functions, quotients, orders, cardinality, or
  number-system construction until the logic prelude and set architecture are
  accepted.

## Current Lean Layout

```text
LRA/
  Foundation.lean
  Foundation/
    Sets.lean
  VolumeI.lean
  VolumeI/
    Logic.lean
    Logic/
      Core.lean
      Prelude.lean
      Semantics.lean
      Semantics/
        Satisfaction.lean
        TheoryModels.lean
        Entailment.lean
      PropositionalLogic.lean
      PropositionalLogic/
        PropositionalLogic.lean
        Alternate/
          BourbakiPropositionalLogic.lean
          NandBasedPropositionalLogic.lean
      FirstOrderLogic.lean
      FirstOrderLogic/
        FirstOrderLogic.lean
      ProofTheory.lean
      ProofTheory/
        ProofTheory.lean
      ModelTheory.lean
      ModelTheory/
        ModelTheory.lean
```

## Current Logic Status

`LRA/VolumeI/Logic/Core.lean` contains the shared abstract interface:

- `Logic`;
- `Logic` mixins for truth values, Boolean evaluation, connectives,
  quantifiers, theoremhood, and semantic entailment;
- `LogicalLanguage`;
- `LogicalFormula`;
- `LogicalStructure`;
- `LogicalTheory`;
- `evaluateFormula`;
- `StructureSatisfiesFormula`;
- `StructureModelsTheory`.
- `Notation` namespace with opt-in `¬ₗ`, `∧ₗ`, `∨ₗ`, `→ₗ`, and `↔ₗ`
  constructors.
- `ClosureRules` namespace with generic atom, unary, binary, and named
  connective formation facts.
- `FormulaMinimality` namespace with the generic well-formed-formula
  minimality theorem.

`LRA/VolumeI/Logic/Semantics/` contains generic Bool-valued semantics:

- `Satisfaction` for formula-level truth/satisfaction facts;
- `TheoryModels` for theory modeling, satisfiability, and theory-inclusion
  facts;
- `Entailment` for semantic consequence.

`LRA/VolumeI/Logic/PropositionalLogic/PropositionalLogic.lean` contains:

- Boolean propositional logic as a specialization of the shared `Logical*`
  interface;
- `propositionalLogic`, the first implementation of the shared `Logic`
  interface;
- short names: `Atom`, `UnaryConnective`, `BinaryConnective`, `language`,
  `Formula`, `Structure`, and `Theory`;
- Boolean evaluation theorems;
- DNF/connective-completeness statements with `sorry`.
- `Examples` namespace containing compile-time examples for ordinary
  evaluation and the shared `Logic` mixin callbacks.

`LRA/VolumeI/Logic/PropositionalLogic/Alternate/BourbakiPropositionalLogic.lean`
contains the Bourbaki-style proof-theory toy with `S1` through `S4`,
theoremhood, modus ponens, and `C8_identity` as a `sorry` proof target. This is
not the core logic direction.

`LRA/VolumeI/Logic/PropositionalLogic/Alternate/NandBasedPropositionalLogic.lean`
contains the NAND-only alternate/verification development.

## Validation Baseline

The following passed after the latest restructuring:

```text
lake -R build LRAVolumeI
git diff --check
```

Expected warnings: `sorry` declarations in the main propositional logic file
and the alternate Bourbaki file.

## Immediate Next Task

Begin the first-order logic first pass:

1. Read
   `docs/restart/foundation-restart-plan/04a-first-order-logic-first-pass.md`.
2. Create the first-order child modules under
   `LRA/VolumeI/Logic/FirstOrderLogic/`.
3. Start with `Language.lean`, then `Term.lean`, then `Formula.lean`.
4. Treat `Logic` as a mixin/interface target, but do not force first-order
   syntax into `LogicalFormula` if its own syntax is cleaner.
5. Prefer small proof-ready statements with `sorry` over large vague theorem
   bundles.

Do not move on to sets until the first-order architecture is accepted.
