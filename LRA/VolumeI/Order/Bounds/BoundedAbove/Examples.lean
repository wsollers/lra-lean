import Mathlib.Order.Interval.Set.Defs
import Mathlib.Data.Real.Basic
import LRA.VolumeI.Order.Bounds.BoundedAbove.Definition

namespace LRA.Order

section RealOpenUnitInterval

/--
Statement: The open unit interval is bounded above by its right endpoint.

Logical form:
```lean
BoundedAbove (fun left right : Real => left ≤ right) (Set.Ioo 0 1)
```
-/
example :
    BoundedAbove (fun left right : Real => left ≤ right) (Set.Ioo 0 1) := by
  exact ⟨1, fun _ membership => le_of_lt membership.2⟩

end RealOpenUnitInterval

end LRA.Order
