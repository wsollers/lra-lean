# Step 3: Logic Layer Layout

## Goal

Reserve a clean Lean space under `LRA/VolumeI` for logic-related material
without letting the restart turn into a full model-theory or
proof-assistant-inside-a-proof-assistant project.

The logic layer should support the book pedagogically. It is not the logical
foundation Lean itself uses to check later proofs, so it belongs to Volume I
rather than `LRA.Foundation`.

## Implementation Posture

- Use Lean's `Prop` logic for actual future mathematical proofs where possible.
- Keep any tiny Bourbaki-style object logic under `Alternate/` as a learning
  artifact, not as the core logic layer.
- Include proof-theory vocabulary because Bourbaki's formalization starts with
  theoremhood and deductive criteria.
- Accommodate first-order logic and model theory with namespaces and files, but
  keep them empty except for wiring tests until we deliberately enter those
  phases.
- Do not spend weeks on syntax bureaucracy before sets.

## Proposed Lean Locations

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
      FirstOrder.lean
      FirstOrderLogic/
        FirstOrderLogic.lean
      ProofTheory.lean
      ProofTheory/
        ProofTheory.lean
      ModelTheory.lean
      ModelTheory/
        ModelTheory.lean
```

## Proposed Namespaces

```lean
namespace LRA.VolumeI.Logic
namespace LRA.VolumeI.Logic.Prelude
namespace LRA.VolumeI.Logic.Semantics.Satisfaction
namespace LRA.VolumeI.Logic.Semantics.TheoryModels
namespace LRA.VolumeI.Logic.Semantics.Entailment
namespace LRA.VolumeI.Logic.PropositionalLogic
namespace LRA.VolumeI.Logic.FirstOrderLogic
namespace LRA.VolumeI.Logic.ProofTheory
namespace LRA.VolumeI.Logic.ModelTheory
```

## Wiring Tests

`LRA/VolumeI/Logic/Core.lean` is the shared abstract object-logic interface.
It owns:

- `Logic`;
- `Logic.HasTruthValue`;
- `Logic.HasBooleanEvaluation`;
- `Logic.HasNegation`;
- `Logic.HasConjunction`;
- `Logic.HasDisjunction`;
- `Logic.HasImplication`;
- `Logic.HasBiconditional`;
- `Logic.HasQuantifiers`;
- `Logic.HasTheoremhood`;
- `Logic.HasSemanticEntailment`;
- `LogicalLanguage`;
- `LogicalFormula`;
- `LogicalStructure`;
- `LogicalTheory`;
- `evaluateFormula`;
- `StructureSatisfiesFormula`;
- `StructureModelsTheory`.

It also owns `LRA.VolumeI.Logic.Notation`, an opt-in notation namespace for
languages that designate standard connectives:

- `HasLogicalNot` and `¬ₗ`;
- `HasLogicalAnd` and `∧ₗ`;
- `HasLogicalOr` and `∨ₗ`;
- `HasLogicalImplies` and `→ₗ`;
- `HasLogicalIff` and `↔ₗ`.

Quantifier notation is intentionally not added here yet. It belongs with a
first-order formula syntax that has variables and binders.

It also owns `LRA.VolumeI.Logic.ClosureRules`, the generic formation facts for
`LogicalFormula`. Concrete logics should use these shared theorems directly
rather than adding local wrapper theorem names.

It also owns `LRA.VolumeI.Logic.FormulaMinimality`, for generic
induction/minimality facts.

Bool-valued satisfaction and theory semantics live under:

- `LRA.VolumeI.Logic.Semantics.Satisfaction`;
- `LRA.VolumeI.Logic.Semantics.TheoryModels`;
- `LRA.VolumeI.Logic.Semantics.Entailment`.

Concrete object logics specialize this interface. Inside
`LRA.VolumeI.Logic.PropositionalLogic`, the file path supplies the context, so
the main names are short: `Atom`, `UnaryConnective`, `BinaryConnective`,
`language`, `Formula`, `Structure`, and `Theory`.

Each placeholder module should compile with a tiny theorem proving `True`.

Example:

```lean
namespace LRA.VolumeI.Logic.FirstOrderLogic

theorem wiring_test : True := by
  trivial

end LRA.VolumeI.Logic.FirstOrderLogic
```

Purpose:

- prove imports and namespaces are wired;
- avoid accidental architecture before we are ready;
- provide a minimal stable surface for handoffs across chats.

## Root Imports

`LRA/VolumeI/Logic.lean` should import:

```lean
import LRA.VolumeI.Logic.Core
import LRA.VolumeI.Logic.Prelude
import LRA.VolumeI.Logic.Semantics
import LRA.VolumeI.Logic.PropositionalLogic
import LRA.VolumeI.Logic.FirstOrderLogic
import LRA.VolumeI.Logic.ProofTheory
import LRA.VolumeI.Logic.ModelTheory
```

`LRA/VolumeI.lean` should import:

```lean
import LRA.Foundation
import LRA.VolumeI.Logic
```

`LRA.Foundation.lean` should not import the object-logic layer. The set
foundation should not import the object-logic layer unless we make a
specific source-grounded decision to do so.

## Acceptance Criteria

- The new logic files exist after the archive step.
- Each placeholder module has only documentation and a tautological wiring test.
- The aggregate `LRA.VolumeI.Logic` module compiles.
- No model-theory definitions are added in the first restart pass.

## Result

Completed.

Created Lean locations:

```text
LRA/Foundation.lean
LRA/Foundation/Sets.lean
LRA/VolumeI.lean
LRA/VolumeI/Logic.lean
LRA/VolumeI/Logic/Core.lean
LRA/VolumeI/Logic/Prelude.lean
LRA/VolumeI/Logic/Semantics.lean
LRA/VolumeI/Logic/Semantics/Satisfaction.lean
LRA/VolumeI/Logic/Semantics/TheoryModels.lean
LRA/VolumeI/Logic/Semantics/Entailment.lean
LRA/VolumeI/Logic/PropositionalLogic.lean
LRA/VolumeI/Logic/PropositionalLogic/PropositionalLogic.lean
LRA/VolumeI/Logic/PropositionalLogic/Alternate/NandBasedPropositionalLogic.lean
LRA/VolumeI/Logic/FirstOrderLogic.lean
LRA/VolumeI/Logic/FirstOrderLogic/FirstOrderLogic.lean
LRA/VolumeI/Logic/ProofTheory.lean
LRA/VolumeI/Logic/ProofTheory/ProofTheory.lean
LRA/VolumeI/Logic/ModelTheory.lean
LRA/VolumeI/Logic/ModelTheory/ModelTheory.lean
```

The placeholder modules contain tautological wiring tests. The model-theory file
contains no model-theory definitions.
