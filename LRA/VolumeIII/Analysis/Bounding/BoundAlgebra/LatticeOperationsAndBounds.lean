import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.SupremaInfima

/-!
Pairwise lattice operations on bounded real sets.
-/

namespace LRA.VolumeIII.Analysis.Bounding.BoundAlgebra

open LRA.VolumeIII.Analysis.Bounding.ExtremalBounds

/-- The set of pairwise maxima of elements from `A` and `B`. -/
def PairwiseMax (A B : Set ℝ) : Set ℝ :=
  {x | ∃ a ∈ A, ∃ b ∈ B, x = max a b}

/-- The set of pairwise minima of elements from `A` and `B`. -/
def PairwiseMin (A B : Set ℝ) : Set ℝ :=
  {x | ∃ a ∈ A, ∃ b ∈ B, x = min a b}

/-- The supremum of a pairwise-maximum set is the maximum of the suprema. -/
theorem SupremumOfPairwiseMaximumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsSupremum (max sA sB) (PairwiseMax A B) := by
  sorry

/-- The infimum of a pairwise-maximum set is the maximum of the infima. -/
theorem InfimumOfPairwiseMaximumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA iB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum (max iA iB) (PairwiseMax A B) := by
  sorry

/-- The supremum of a pairwise-minimum set is the minimum of the suprema. -/
theorem SupremumOfPairwiseMinimumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsSupremum (min sA sB) (PairwiseMin A B) := by
  sorry

/-- The infimum of a pairwise-minimum set is the minimum of the infima. -/
theorem InfimumOfPairwiseMinimumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA iB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum (min iA iB) (PairwiseMin A B) := by
  sorry

end LRA.VolumeIII.Analysis.Bounding.BoundAlgebra
