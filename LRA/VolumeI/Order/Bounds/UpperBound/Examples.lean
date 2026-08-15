import Mathlib.Order.Interval.Set.Defs
import Mathlib.Data.Real.Basic
import LRA.VolumeI.Order.Bounds.UpperBound.Definition

namespace LRA.Order

section RealOpenUnitInterval

/--
Statement: The right endpoint is an upper bound of the open unit interval.

Logical form:
```lean
UpperBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1
```
-/
example :
    UpperBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1 := by
  intro element elementInInterval
  exact le_of_lt elementInInterval.2

end RealOpenUnitInterval

end LRA.Order
