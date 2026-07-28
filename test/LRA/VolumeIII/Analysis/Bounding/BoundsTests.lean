-- test/LRA/VolumeIII/Analysis/Bounding/BoundsTests.lean
-- Smoke checks for the Volume III bounds interface.

import Mathlib.Tactic
import LRA.VolumeII.Switches.NumberSystems
import LRA.VolumeIII.Analysis.Bounding.Bounds
import LRA.VolumeIII.RealNumbers.LraReal

namespace LRA.VolumeIII.Analysis.Bounding.BoundsTests

abbrev ActiveReal := LRA.VolumeII.Switches.NumberSystems.RealNumbers.R

open LRA.VolumeIII.Analysis.Bounding.Bounds

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
    Set LRA.VolumeIII.RealNumbers.LraReal -> Prop :=
  @IsBoundedAbove LRA.VolumeIII.RealNumbers.LraReal inferInstance

example :
    LRA.VolumeIII.RealNumbers.LraReal ->
      Set LRA.VolumeIII.RealNumbers.LraReal ->
      Prop :=
  @IsSupremum LRA.VolumeIII.RealNumbers.LraReal inferInstance

end LRA.VolumeIII.Analysis.Bounding.BoundsTests
