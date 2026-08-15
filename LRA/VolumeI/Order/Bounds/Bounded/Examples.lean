import Mathlib.Order.Interval.Set.Defs
import Mathlib.Data.Real.Basic
import LRA.VolumeI.Order.Bounds.Bounded.Definition
import LRA.VolumeI.Order.Bounds.Bounded.Theorems
import LRA.VolumeI.Set.MathlibPredicateSet.Instances
import LRA.VolumeI.Set.MathlibPredicateSet.Laws

namespace LRA.Order

open scoped LRA.Set

section RealOpenUnitInterval

/--
Statement: The open unit interval is bounded above and below.

Logical form:
```lean
Bounded (fun left right : Real => left ≤ right) (Set.Ioo 0 1)
```
-/
example : Bounded (fun left right : Real => left ≤ right) (Set.Ioo 0 1) := by
  constructor
  · exact ⟨1, fun _ membership => le_of_lt membership.2⟩
  · exact ⟨0, fun _ membership => le_of_lt membership.1⟩

end RealOpenUnitInterval

section SymmetricDifference

/--
Statement: The symmetric difference of the closed intervals `[0,1]` and
`[2,3]` is bounded.

Logical form: `Bounded (· ≤ ·) (Set.Icc 0 1 ∆ Set.Icc 2 3)`.
-/
example :
    Bounded (fun left right : Real => left ≤ right)
      (Set.Icc 0 1 ∆ Set.Icc 2 3) := by
  apply SymmetricDifferenceBounded (Set.Icc 0 1) (Set.Icc 2 3)
  · exact ⟨⟨1, fun _ membership => membership.2⟩,
      ⟨0, fun _ membership => membership.1⟩⟩
  · exact ⟨⟨3, fun _ membership => membership.2⟩,
      ⟨2, fun _ membership => membership.1⟩⟩

end SymmetricDifference

end LRA.Order
