import Mathlib.Order.Interval.Set.Defs
import Mathlib.Data.Real.Basic
import LRA.VolumeI.Order.Bounds.MinimalElement.Definition

namespace LRA.Order

section RealClosedUnitInterval

/--
Statement: The left endpoint is minimal in the closed unit interval.

Logical form:
```lean
MinimalElement (fun left right : Real => left < right) (Set.Icc 0 1) 0
```
-/
example :
    MinimalElement (fun left right : Real => left < right) (Set.Icc 0 1) 0 := by
  refine ⟨⟨le_rfl, zero_le_one⟩, ?_⟩
  intro element membership elementLessThanZero
  exact (not_lt_of_ge membership.1) elementLessThanZero

end RealClosedUnitInterval

end LRA.Order
