-- LRA/VolumeIII/Analysis/Bounding/Examples.lean
-- Small examples for the bounds interface.

import Mathlib.Tactic
import LRA.VolumeIII.Analysis.Bounding.Bounds
import LRA.VolumeIII.RealNumbers.LraReal

namespace LRA.VolumeIII.Analysis.Bounding.Bounds.Examples

/--
`ActiveReal` abbreviates the displayed type or object for active real.

Logical form:

```lean
abbrev ActiveReal := Real
```
-/
abbrev ActiveReal := Real

example : IsUpperBound (3 : ActiveReal) {1, 2, 3} := by
  intro x membership
  rcases membership with rfl | rfl | rfl <;> norm_num

example : IsMaximum (3 : ActiveReal) {1, 2, 3} := by
  refine ⟨by norm_num, ?_⟩
  intro x membership
  rcases membership with rfl | rfl | rfl <;> norm_num

example : IsSupremum (3 : ActiveReal) {1, 2, 3} :=
  MaximumIsSupremum (by
    refine ⟨by norm_num, ?_⟩
    intro x membership
    rcases membership with rfl | rfl | rfl <;> norm_num)

end LRA.VolumeIII.Analysis.Bounding.Bounds.Examples
