-- LRA/VolumeIII/Analysis/Bounding/BoundsTests.lean
-- Carrier checks and small examples for bounds.

import Mathlib.Tactic
import LRA.VolumeII.Switches.NumberSystems
import LRA.VolumeIII.Analysis.Bounding.Bounds
import LRA.VolumeIII.RealNumbers.LraReal

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Bounding
namespace Bounds
namespace Tests

abbrev ActiveReal := LRA.VolumeII.Switches.NumberSystems.RealNumbers.R

#check (@IsSupremum ActiveReal _)
#check (@IsBoundedAbove ActiveReal _)
#check (@Algebra.SupremumOfSum ActiveReal _)

#check (@IsSupremum LRA.VolumeIII.RealNumbers.LraReal _)
#check (@IsBoundedAbove LRA.VolumeIII.RealNumbers.LraReal _)
#check (@IsMaximum LRA.VolumeIII.RealNumbers.LraReal _)

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

end Tests
end Bounds
end Bounding
end Analysis
end VolumeIII
end LRA
