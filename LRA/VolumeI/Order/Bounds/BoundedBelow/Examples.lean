import Mathlib.Order.Interval.Set.Defs
import Mathlib.Data.Real.Basic
import LRA.VolumeI.Order.Bounds.BoundedBelow.Definition

namespace LRA.Order

section RealOpenUnitInterval

/--
Statement: The open unit interval is bounded below by its left endpoint.

Logical form:
```lean
BoundedBelow (fun left right : Real => left ≤ right) (Set.Ioo 0 1)
```
-/
example :
    BoundedBelow (fun left right : Real => left ≤ right) (Set.Ioo 0 1) := by
  exact ⟨0, fun _ membership => le_of_lt membership.1⟩

end RealOpenUnitInterval

end LRA.Order
