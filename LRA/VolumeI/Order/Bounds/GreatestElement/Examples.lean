import Mathlib.Order.Interval.Set.Defs
import Mathlib.Data.Real.Basic
import LRA.VolumeI.Order.Bounds.GreatestElement.Definition

namespace LRA.Order

section RealClosedUnitInterval

/--
Statement: The right endpoint is the greatest element of the closed unit interval.

Logical form:
```lean
GreatestElement (fun left right : Real => left ≤ right) (Set.Icc 0 1) 1
```
-/
example :
    GreatestElement (fun left right : Real => left ≤ right) (Set.Icc 0 1) 1 := by
  exact ⟨⟨zero_le_one, le_rfl⟩, fun _ membership => membership.2⟩

end RealClosedUnitInterval

end LRA.Order
