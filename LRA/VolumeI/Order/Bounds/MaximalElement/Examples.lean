import Mathlib.Order.Interval.Set.Defs
import Mathlib.Data.Real.Basic
import LRA.VolumeI.Order.Bounds.MaximalElement.Definition

namespace LRA.Order

section RealClosedUnitInterval

/--
Statement: The right endpoint is maximal in the closed unit interval.

Logical form:
```lean
MaximalElement (fun left right : Real => left < right) (Set.Icc 0 1) 1
```
-/
example :
    MaximalElement (fun left right : Real => left < right) (Set.Icc 0 1) 1 := by
  refine ⟨⟨zero_le_one, le_rfl⟩, ?_⟩
  intro element membership oneLessThanElement
  exact (not_lt_of_ge membership.2) oneLessThanElement

end RealClosedUnitInterval

end LRA.Order
