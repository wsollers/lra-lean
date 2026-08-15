import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.GreatestLowerBoundProperty.Definition

namespace LRA.Order

section RealCompleteness

/--
Statement: The real numbers have the greatest-lower-bound property.

Logical form:
```lean
GreatestLowerBoundProperty (Set Real) (fun left right : Real => left ≤ right)
```
-/
example :
    GreatestLowerBoundProperty (Set Real)
      (fun left right : Real => left ≤ right) := by
  sorry

end RealCompleteness

end LRA.Order
