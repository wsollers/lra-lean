import Mathlib.Order.Interval.Set.Defs
import Mathlib.Data.Real.Basic
import LRA.VolumeI.Order.Bounds.Infimum.Definition

namespace LRA.Order

section RealOpenUnitInterval

/--
Statement: The infimum of the open unit interval is its omitted left endpoint.

Logical form:
```lean
Infimum (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0
```
-/
example :
    Infimum (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0 := by
  sorry

end RealOpenUnitInterval

end LRA.Order
