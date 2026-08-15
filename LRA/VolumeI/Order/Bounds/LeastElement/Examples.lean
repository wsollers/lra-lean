import Mathlib.Order.Interval.Set.Defs
import Mathlib.Data.Real.Basic
import LRA.VolumeI.Order.Bounds.LeastElement.Definition

namespace LRA.Order

section RealClosedUnitInterval

/--
Statement: The left endpoint is the least element of the closed unit interval.

Logical form:
```lean
LeastElement (fun left right : Real => left ≤ right) (Set.Icc 0 1) 0
```
-/
example :
    LeastElement (fun left right : Real => left ≤ right) (Set.Icc 0 1) 0 := by
  exact ⟨⟨le_rfl, zero_le_one⟩, fun _ membership => membership.1⟩

end RealClosedUnitInterval

end LRA.Order
