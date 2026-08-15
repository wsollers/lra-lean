import Mathlib.Analysis.Real.Sqrt
import Mathlib.Order.Interval.Set.Defs
import LRA.VolumeI.Order.Bounds.Supremum.Definition

namespace LRA.Order

section RealExamples

/--
Statement: The supremum of the open unit interval is its omitted right endpoint.

Logical form:
```lean
Supremum (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1
```
-/
example :
    Supremum (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1 := by
  sorry

/--
Statement: `sqrt 2` is the supremum of the nonnegative reals whose square is below two.

Logical form:
```lean
let squareBelowTwo : Set Real := {value | 0 ≤ value ∧ value ^ 2 < 2}
Supremum (fun left right : Real => left ≤ right) squareBelowTwo (Real.sqrt 2)
```
-/
example :
    let squareBelowTwo : Set Real :=
      {value | 0 ≤ value ∧ value ^ 2 < 2}
    Supremum (fun left right : Real => left ≤ right)
      squareBelowTwo (Real.sqrt 2) := by
  sorry

end RealExamples

end LRA.Order
