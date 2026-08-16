import LRA.VolumeI.Logic.Language.Symbols.Signature

namespace LRA.Logic.Language

/-!
Aggregate import shim for the vocabulary layer (`Language/Symbols/`).
-/

/--
`symbolsWiringTest` states symbols wiring test.

Logical form:

```lean
theorem symbolsWiringTest : forall Symbol : Type, Nonempty Symbol -> Nonempty Symbol
```
-/
theorem symbolsWiringTest :
    forall Symbol : Type, Nonempty Symbol -> Nonempty Symbol := by
  intro Symbol symbolIsNonempty
  exact symbolIsNonempty

end LRA.Logic.Language
