import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.SupremaInfima

/-!
Epsilon characterizations of suprema and infima in the real line.
-/

namespace LRA.VolumeIII.Analysis.Bounding.ExtremalBounds

/-- A real number is a supremum exactly when it has arbitrarily close witnesses below it. -/
theorem SupremumEpsilonCharacterization {A : Set ℝ} {s : ℝ} :
    IsSupremum s A ↔
      IsUpperBound s A ∧ ∀ ε : ℝ, 0 < ε → ∃ a ∈ A, s - ε < a := by
  sorry

/-- A real number is an infimum exactly when it has arbitrarily close witnesses above it. -/
theorem InfimumEpsilonCharacterization {A : Set ℝ} {i : ℝ} :
    IsInfimum i A ↔
      IsLowerBound i A ∧ ∀ ε : ℝ, 0 < ε → ∃ a ∈ A, a < i + ε := by
  sorry

/-- Every strict upper approximation to a supremum is exceeded by a set element. -/
theorem SupremumStrictUpperApproximation {A : Set ℝ} {s u : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (strictApproximation : u < s) :
    ∃ a ∈ A, u < a := by
  sorry

/-- Every strict lower approximation to an infimum is exceeded downward by a set element. -/
theorem InfimumStrictLowerApproximation {A : Set ℝ} {i l : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (strictApproximation : i < l) :
    ∃ a ∈ A, a < l := by
  sorry

end LRA.VolumeIII.Analysis.Bounding.ExtremalBounds
