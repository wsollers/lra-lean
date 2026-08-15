import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Bounds.LeastUpperBoundProperty.Definition

namespace LRA.Order

section RealCompleteness

/--
Statement: The real numbers have the least-upper-bound property.

Logical form:
```lean
LeastUpperBoundProperty (Set Real) (fun left right : Real => left ≤ right)
```
-/
example :
    LeastUpperBoundProperty (Set Real)
      (fun left right : Real => left ≤ right) := by
  sorry

end RealCompleteness

end LRA.Order
