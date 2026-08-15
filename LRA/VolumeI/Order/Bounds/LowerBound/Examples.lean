import Mathlib.Order.Interval.Set.Defs
import Mathlib.Data.Real.Basic
import LRA.VolumeI.Order.Bounds.LowerBound.Definition

namespace LRA.Order

section RealOpenUnitInterval

/--
Statement: The left endpoint is a lower bound of the open unit interval.

Logical form:
```lean
LowerBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0
```
-/
example :
    LowerBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0 := by
  intro element elementInInterval
  exact le_of_lt elementInInterval.1

end RealOpenUnitInterval

end LRA.Order
