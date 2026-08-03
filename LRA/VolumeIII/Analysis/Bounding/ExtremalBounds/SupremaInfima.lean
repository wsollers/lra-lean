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

/-- Let `A : Set S` and `s t : S`. If `[PartialOrder S]`, `leftSupremum : IsSupremum s A`, and
`rightSupremum : IsSupremum t A`. Then `s = t`. -/
theorem SupremumUnique [PartialOrder S] {A : Set S} {s t : S}
    (leftSupremum : IsSupremum s A) (rightSupremum : IsSupremum t A) : s = t := by
  sorry

/-- Let `A : Set S` and `i j : S`. If `[PartialOrder S]`, `leftInfimum : IsInfimum i A`, and
`rightInfimum : IsInfimum j A`. Then `i = j`. -/
theorem InfimumUnique [PartialOrder S] {A : Set S} {i j : S}
    (leftInfimum : IsInfimum i A) (rightInfimum : IsInfimum j A) : i = j := by
  sorry

/-- Let `A : Set S` and `s : S`. If `[Preorder S]` and `supremumHypothesis : IsSupremum s A`. Then
`IsUpperBound s A`. -/
theorem SupremumIsUpperBound [Preorder S] {A : Set S} {s : S}
    (supremumHypothesis : IsSupremum s A) : IsUpperBound s A := by
  sorry

/-- Let `A : Set S` and `i : S`. If `[Preorder S]` and `infimumHypothesis : IsInfimum i A`. Then
`IsLowerBound i A`. -/
theorem InfimumIsLowerBound [Preorder S] {A : Set S} {i : S}
    (infimumHypothesis : IsInfimum i A) : IsLowerBound i A := by
  sorry

/-- Let `A B : Set S` and `u : S`. If `[Preorder S]`, `subsetHypothesis : A ⊆ B`, and
`upperBoundHypothesis : IsUpperBound u B`. Then `IsUpperBound u A`. -/
theorem SubsetPreservesUpperBounds [Preorder S] {A B : Set S} {u : S}
    (subsetHypothesis : A ⊆ B) (upperBoundHypothesis : IsUpperBound u B) :
    IsUpperBound u A := by
  sorry

/-- Let `A B : Set S` and `l : S`. If `[Preorder S]`, `subsetHypothesis : A ⊆ B`, and
`lowerBoundHypothesis : IsLowerBound l B`. Then `IsLowerBound l A`. -/
theorem SubsetPreservesLowerBounds [Preorder S] {A B : Set S} {l : S}
    (subsetHypothesis : A ⊆ B) (lowerBoundHypothesis : IsLowerBound l B) :
    IsLowerBound l A := by
  sorry

/-- Let `A B : Set S` and `sA sB : S`. If `[PartialOrder S]`, `subsetHypothesis : A ⊆ B`,
`leftSupremum : IsSupremum sA A`, and `rightSupremum : IsSupremum sB B`. Then `sA ≤ sB`. -/
theorem SupremumMonotoneUnderInclusion [PartialOrder S] {A B : Set S} {sA sB : S}
    (subsetHypothesis : A ⊆ B)
    (leftSupremum : IsSupremum sA A)
    (rightSupremum : IsSupremum sB B) :
    sA ≤ sB := by
  sorry

/-- Let `A B : Set S` and `iA iB : S`. If `[PartialOrder S]`, `subsetHypothesis : A ⊆ B`,
`leftInfimum : IsInfimum iA A`, and `rightInfimum : IsInfimum iB B`. Then `iB ≤ iA`. -/
theorem InfimumAntitoneUnderInclusion [PartialOrder S] {A B : Set S} {iA iB : S}
    (subsetHypothesis : A ⊆ B)
    (leftInfimum : IsInfimum iA A)
    (rightInfimum : IsInfimum iB B) :
    iB ≤ iA := by
  sorry

/-- Let `A : Set S` and `s u : S`. If `[PartialOrder S]` and `supremumHypothesis : IsSupremum s A`.
Then `IsUpperBound u A ↔ s ≤ u`. -/
theorem UpperBoundIffSupremumLe [PartialOrder S] {A : Set S} {s u : S}
    (supremumHypothesis : IsSupremum s A) :
    IsUpperBound u A ↔ s ≤ u := by
  sorry

/-- Let `A : Set S` and `i l : S`. If `[PartialOrder S]` and `infimumHypothesis : IsInfimum i A`.
Then `IsLowerBound l A ↔ l ≤ i`. -/
theorem LowerBoundIffLeInfimum [PartialOrder S] {A : Set S} {i l : S}
    (infimumHypothesis : IsInfimum i A) :
    IsLowerBound l A ↔ l ≤ i := by
  sorry

/-- Let `A : Set S` and `s : S`. If `[Preorder S]` and `supremumHypothesis : IsSupremum s A`. Then
`∀ x ∈ A, x ≤ s`. -/
theorem EveryElementLeSupremum [Preorder S] {A : Set S} {s : S}
    (supremumHypothesis : IsSupremum s A) :
    ∀ x ∈ A, x ≤ s := by
  sorry

/-- Let `A : Set S` and `i : S`. If `[Preorder S]` and `infimumHypothesis : IsInfimum i A`. Then `∀
x ∈ A, i ≤ x`. -/
theorem InfimumLeEveryElement [Preorder S] {A : Set S} {i : S}
    (infimumHypothesis : IsInfimum i A) :
    ∀ x ∈ A, i ≤ x := by
  sorry

/-- Let `A : Set S` and `i s : S`. If `[PartialOrder S]`, `infimumHypothesis : IsInfimum i A`, and
`supremumHypothesis : IsSupremum s A`. Then `i ≤ s`. -/
theorem InfimumLeSupremum [PartialOrder S] {A : Set S} {i s : S}
    (infimumHypothesis : IsInfimum i A)
    (supremumHypothesis : IsSupremum s A) : i ≤ s := by
  sorry

/-- The theorem asserts `∃ (A : Set ℝ) (s : ℝ), A.Nonempty ∧ IsSupremum s A ∧ s ∉ A`. -/
theorem SupremumNeedNotBelongToSet :
    ∃ (A : Set ℝ) (s : ℝ), A.Nonempty ∧ IsSupremum s A ∧ s ∉ A := by
  sorry

/-- The theorem asserts `∃ (A : Set ℝ) (i : ℝ), A.Nonempty ∧ IsInfimum i A ∧ i ∉ A`. -/
theorem InfimumNeedNotBelongToSet :
    ∃ (A : Set ℝ) (i : ℝ), A.Nonempty ∧ IsInfimum i A ∧ i ∉ A := by
  sorry

/-- Let `A B : Set S` and `sA sB : S`. If `[PartialOrder S]`, `leftSupremum : IsSupremum sA A`,
`rightSupremum : IsSupremum sB B`, and `dominationHypothesis : ∀ a ∈ A, ∃ b ∈ B, a ≤ b`. Then
`sA ≤ sB`. -/
theorem SupremumComparisonByDominatingSet [PartialOrder S] {A B : Set S} {sA sB : S}
    (leftSupremum : IsSupremum sA A)
    (rightSupremum : IsSupremum sB B)
    (dominationHypothesis : ∀ a ∈ A, ∃ b ∈ B, a ≤ b) : sA ≤ sB := by
  sorry

/-- Let `A : Set ℝ`. If `nonemptyHypothesis : A.Nonempty` and `boundedAboveHypothesis : ∃ u,
IsUpperBound u A`. Then `∃! s : ℝ, IsSupremum s A`. -/
theorem LubPropertyGivesSupremum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u A) :
    ∃! s : ℝ, IsSupremum s A := by
  sorry

/-- Let `A : Set ℝ`. If `nonemptyHypothesis : A.Nonempty` and `boundedBelowHypothesis : ∃ l,
IsLowerBound l A`. Then `∃! i : ℝ, IsInfimum i A`. -/
theorem GlbPropertyGivesInfimum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedBelowHypothesis : ∃ l, IsLowerBound l A) :
    ∃! i : ℝ, IsInfimum i A := by
  sorry

/-- Let `A : Set ℝ`. If `nonemptyHypothesis : A.Nonempty` and `boundedHypothesis : IsBounded A`.
Then `(∃! s : ℝ, IsSupremum s A) ∧ (∃! i : ℝ, IsInfimum i A)`. -/
theorem BoundedSetHasSupremumAndInfimum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedHypothesis : IsBounded A) :
    (∃! s : ℝ, IsSupremum s A) ∧ (∃! i : ℝ, IsInfimum i A) := by
  sorry

end LRA.VolumeIII.Analysis.Bounding.ExtremalBounds
