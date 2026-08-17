import LRA.VolumeI.Logic.Language.Notation.LogicalSymbols

namespace LRA.Logic.Language

/-!
Aggregate import for the logical-symbols layer (`Language/Notation/`).
-/

/--
`notationWiringTest` states notation wiring test.

Logical form:

```lean
theorem notationWiringTest : forall proposition : Prop, proposition -> proposition
```
-/
theorem notationWiringTest :
    forall proposition : Prop, proposition -> proposition := by
  intro proposition proof
  exact proof

end LRA.Logic.Language
