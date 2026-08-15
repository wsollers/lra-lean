import Mathlib.Order.Interval.Set.Defs
import Mathlib.Data.Real.Basic
import LRA.VolumeI.Order.Bounds.Bounded.Definition

namespace LRA.Order

section RealOpenUnitInterval

/--
Statement: The open unit interval is bounded above and below.

Logical form:
```lean
Bounded (fun left right : Real => left ≤ right) (Set.Ioo 0 1)
```
-/
example : Bounded (fun left right : Real => left ≤ right) (Set.Ioo 0 1) := by
  constructor
  · exact ⟨1, fun _ membership => le_of_lt membership.2⟩
  · exact ⟨0, fun _ membership => le_of_lt membership.1⟩

end RealOpenUnitInterval

end LRA.Order
