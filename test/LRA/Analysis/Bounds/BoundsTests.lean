-- test/LRA/Analysis/Bounds/BoundsTests.lean
-- Smoke checks for the Volume III bounds interface.

import Mathlib.Tactic
import LRA.Analysis.Bounds.Bounds
import LRA.VolumeIII.RealNumbers.LraReal

namespace LRA.Analysis.BoundsTests

abbrev ActiveReal := Real

open LRA.Analysis.Bounds

example : IsBoundedAbove ({1, 2, 3} : Set ActiveReal) := by
  refine ⟨3, ?_⟩
  intro x membership
  rcases membership with rfl | rfl | rfl <;> norm_num

example : IsMaximum (3 : ActiveReal) ({1, 2, 3} : Set ActiveReal) := by
  refine ⟨by norm_num, ?_⟩
  intro x membership
  rcases membership with rfl | rfl | rfl <;> norm_num

example : IsSupremum (3 : ActiveReal) ({1, 2, 3} : Set ActiveReal) :=
  MaximumIsSupremum (by
    refine ⟨by norm_num, ?_⟩
    intro x membership
    rcases membership with rfl | rfl | rfl <;> norm_num)

example :
    Set LRA.NumberSystems.RealNumbers.LraReal -> Prop :=
  @IsBoundedAbove LRA.NumberSystems.RealNumbers.LraReal inferInstance

example :
    LRA.NumberSystems.RealNumbers.LraReal ->
      Set LRA.NumberSystems.RealNumbers.LraReal ->
      Prop :=
  @IsSupremum LRA.NumberSystems.RealNumbers.LraReal inferInstance

end LRA.Analysis.BoundsTests
