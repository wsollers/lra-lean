import Mathlib.Data.Real.Basic
import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.UpperLowerBounds

/-!
Suprema and infima for ordered carriers.
-/

namespace LRA.VolumeIII.Analysis.Bounding.ExtremalBounds

variable {S : Type*}

/-- `IsSupremum s A` says `s` is the least upper bound of `A`. -/
def IsSupremum [Preorder S] (s : S) (A : Set S) : Prop :=
  IsUpperBound s A ∧ ∀ u, IsUpperBound u A → s ≤ u

/-- `IsInfimum i A` says `i` is the greatest lower bound of `A`. -/
def IsInfimum [Preorder S] (i : S) (A : Set S) : Prop :=
  IsLowerBound i A ∧ ∀ l, IsLowerBound l A → l ≤ i

/-- Suprema are unique in a partial order. -/
theorem SupremumUnique [PartialOrder S] {A : Set S} {s t : S}
    (leftSupremum : IsSupremum s A) (rightSupremum : IsSupremum t A) : s = t := by
  sorry

/-- Infima are unique in a partial order. -/
theorem InfimumUnique [PartialOrder S] {A : Set S} {i j : S}
    (leftInfimum : IsInfimum i A) (rightInfimum : IsInfimum j A) : i = j := by
  sorry

/-- A supremum is an upper bound. -/
theorem SupremumIsUpperBound [Preorder S] {A : Set S} {s : S}
    (supremumHypothesis : IsSupremum s A) : IsUpperBound s A := by
  sorry

/-- An infimum is a lower bound. -/
theorem InfimumIsLowerBound [Preorder S] {A : Set S} {i : S}
    (infimumHypothesis : IsInfimum i A) : IsLowerBound i A := by
  sorry

/-- Subset inclusion preserves upper bounds contravariantly. -/
theorem SubsetPreservesUpperBounds [Preorder S] {A B : Set S} {u : S}
    (subsetHypothesis : A ⊆ B) (upperBoundHypothesis : IsUpperBound u B) :
    IsUpperBound u A := by
  sorry

/-- Subset inclusion preserves lower bounds contravariantly. -/
theorem SubsetPreservesLowerBounds [Preorder S] {A B : Set S} {l : S}
    (subsetHypothesis : A ⊆ B) (lowerBoundHypothesis : IsLowerBound l B) :
    IsLowerBound l A := by
  sorry

/-- Suprema are monotone under set inclusion. -/
theorem SupremumMonotoneUnderInclusion [PartialOrder S] {A B : Set S} {sA sB : S}
    (subsetHypothesis : A ⊆ B)
    (leftSupremum : IsSupremum sA A)
    (rightSupremum : IsSupremum sB B) :
    sA ≤ sB := by
  sorry

/-- Infima are antitone under set inclusion. -/
theorem InfimumAntitoneUnderInclusion [PartialOrder S] {A B : Set S} {iA iB : S}
    (subsetHypothesis : A ⊆ B)
    (leftInfimum : IsInfimum iA A)
    (rightInfimum : IsInfimum iB B) :
    iB ≤ iA := by
  sorry

/-- Upper bounds of a set are exactly the elements above its supremum. -/
theorem UpperBoundIffSupremumLe [PartialOrder S] {A : Set S} {s u : S}
    (supremumHypothesis : IsSupremum s A) :
    IsUpperBound u A ↔ s ≤ u := by
  sorry

/-- Lower bounds of a set are exactly the elements below its infimum. -/
theorem LowerBoundIffLeInfimum [PartialOrder S] {A : Set S} {i l : S}
    (infimumHypothesis : IsInfimum i A) :
    IsLowerBound l A ↔ l ≤ i := by
  sorry

/-- Every element of a set lies below its supremum. -/
theorem EveryElementLeSupremum [Preorder S] {A : Set S} {s : S}
    (supremumHypothesis : IsSupremum s A) :
    ∀ x ∈ A, x ≤ s := by
  sorry

/-- Every element of a set lies above its infimum. -/
theorem InfimumLeEveryElement [Preorder S] {A : Set S} {i : S}
    (infimumHypothesis : IsInfimum i A) :
    ∀ x ∈ A, i ≤ x := by
  sorry

/-- The infimum of a set is at most its supremum when both exist. -/
theorem InfimumLeSupremum [PartialOrder S] {A : Set S} {i s : S}
    (infimumHypothesis : IsInfimum i A)
    (supremumHypothesis : IsSupremum s A) : i ≤ s := by
  sorry

/-- A supremum need not belong to the set. -/
theorem SupremumNeedNotBelongToSet :
    ∃ (A : Set ℝ) (s : ℝ), A.Nonempty ∧ IsSupremum s A ∧ s ∉ A := by
  sorry

/-- An infimum need not belong to the set. -/
theorem InfimumNeedNotBelongToSet :
    ∃ (A : Set ℝ) (i : ℝ), A.Nonempty ∧ IsInfimum i A ∧ i ∉ A := by
  sorry

/-- Dominating every element of one set by some element of another compares suprema. -/
theorem SupremumComparisonByDominatingSet [PartialOrder S] {A B : Set S} {sA sB : S}
    (leftSupremum : IsSupremum sA A)
    (rightSupremum : IsSupremum sB B)
    (dominationHypothesis : ∀ a ∈ A, ∃ b ∈ B, a ≤ b) : sA ≤ sB := by
  sorry

/-- The least-upper-bound property gives existence and uniqueness of suprema. -/
theorem LubPropertyGivesSupremum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u A) :
    ∃! s : ℝ, IsSupremum s A := by
  sorry

/-- The greatest-lower-bound property gives existence and uniqueness of infima. -/
theorem GlbPropertyGivesInfimum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedBelowHypothesis : ∃ l, IsLowerBound l A) :
    ∃! i : ℝ, IsInfimum i A := by
  sorry

/-- Every nonempty bounded set of reals has both a supremum and an infimum. -/
theorem BoundedSetHasSupremumAndInfimum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedHypothesis : IsBounded A) :
    (∃! s : ℝ, IsSupremum s A) ∧ (∃! i : ℝ, IsInfimum i A) := by
  sorry

end LRA.VolumeIII.Analysis.Bounding.ExtremalBounds
