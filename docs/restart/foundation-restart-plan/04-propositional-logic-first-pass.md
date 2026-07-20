# Step 4: Propositional Logic First Pass

## Goal

Create a regular modern propositional object logic as a learning artifact and
as the first concrete specialization of the shared `Logical*` interface.

This object logic is not what later set proofs depend on. Later mathematical
proofs should use Lean's native `Prop` unless there is a specific reason to
reason about formalized formulas.

## Design Pivot

Bourbaki's proof-theoretic presentation remains useful historical context, but
the restart is not modeling Bourbaki logic as the core. The core
propositional module should use contemporary syntax, truth-table semantics, and
small proof-ready theorem statements.

If retained, the Bourbaki `S1` through `S4` toy proof system belongs under
`Alternate/`:

```text
LRA/VolumeI/Logic/PropositionalLogic/Alternate/BourbakiPropositionalLogic.lean
```

For reference, Bourbaki's "logical theories" begin with axiom schemes for
relations/formulas:

- `S1`: `(A or A) ==> A`
- `S2`: `A ==> (A or B)`
- `S3`: `(A or B) ==> (B or A)`
- `S4`: `(A ==> B) ==> ((C or A) ==> (C or B))`

The central objects there are theoremhood and derivability, not models.

## Minimal First Implementation

In `LRA/VolumeI/Logic/PropositionalLogic/PropositionalLogic.lean`, define or
harvest:

- a propositional language over a small atom type;
- unary and binary Boolean connectives;
- shared notation for not, and, or, implies, and iff;
- Boolean structures/valuations;
- evaluation, satisfaction, theory modeling, and basic semantic theorem
  statements;
- small propositional metatheory statements suitable for hand proofs.

## What Not To Do Yet

- Do not add model theory.
- Do not make Bourbaki theoremhood the core object logic.
- Do not formalize full Bourbaki substitution machinery.
- Do not make future set proofs depend on this object logic.

## Acceptance Criteria

- The regular propositional object logic compiles.
- The shared `Logical*` interface is specialized by propositional
  logic.
- Basic truth-table evaluation and satisfaction vocabulary is present.
- At least one tiny theorem is proved without `sorry`.
- More interesting semantic/metatheoretic statements may be stated with
  `sorry`.

## Current Result

Implemented in:

```text
LRA/VolumeI/Logic/PropositionalLogic/PropositionalLogic.lean
```

Current contents:

- shared generic object-logic language/structure/formula/theory machinery moved
  to `LRA/VolumeI/Logic/Core.lean` as `LogicalLanguage`,
  `LogicalFormula`, `LogicalStructure`, and `LogicalTheory`;
- harvested Boolean propositional language as a specialization of the
  shared interface;
- removed local wrappers around shared formula-formation and
  well-formed-formula minimality facts;
- harvested Boolean evaluation theorems;
- harvested DNF/connective-completeness statements with `sorry`;
- moved generic theory/model semantics under
  `LRA/VolumeI/Logic/Semantics/` as `Satisfaction`, `TheoryModels`, and
  `Entailment`;
- extracted Bourbaki-style propositional proof theory into:

```text
LRA/VolumeI/Logic/PropositionalLogic/Alternate/BourbakiPropositionalLogic.lean
```

- extracted NAND-only language, definitions of the Boolean connectives by NAND,
  and the propositional-to-NAND translation theorem into:

```text
LRA/VolumeI/Logic/PropositionalLogic/Alternate/NandBasedPropositionalLogic.lean
```

The old standalone `SimpleLogic.lean` material now lives as a coherent alternate
verification module rather than inside the main propositional logic file.
