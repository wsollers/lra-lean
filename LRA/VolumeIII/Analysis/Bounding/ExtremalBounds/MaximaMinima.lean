import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.SupremaInfima

/-!
Maxima and minima as attained extremal bounds.
-/

namespace LRA.VolumeIII.Analysis.Bounding.ExtremalBounds

variable {S : Type*}

/-- `IsMaximum m A` says `m` is an upper bound of `A` that belongs to `A`. -/
def IsMaximum [LE S] (m : S) (A : Set S) : Prop :=
  m ∈ A ∧ IsUpperBound m A

/-- `IsMinimum m A` says `m` is a lower bound of `A` that belongs to `A`. -/
def IsMinimum [LE S] (m : S) (A : Set S) : Prop :=
  m ∈ A ∧ IsLowerBound m A

/-- Maxima are unique in a partial order. -/
theorem MaximumUnique [PartialOrder S] {A : Set S} {m₁ m₂ : S}
    (leftMaximum : IsMaximum m₁ A) (rightMaximum : IsMaximum m₂ A) : m₁ = m₂ := by
  sorry

/-- Minima are unique in a partial order. -/
theorem MinimumUnique [PartialOrder S] {A : Set S} {m₁ m₂ : S}
    (leftMinimum : IsMinimum m₁ A) (rightMinimum : IsMinimum m₂ A) : m₁ = m₂ := by
  sorry

/-- A maximum is a supremum. -/
theorem MaximumIsSupremum [PartialOrder S] {A : Set S} {m : S}
    (maximumHypothesis : IsMaximum m A) : IsSupremum m A := by
  sorry

/-- A minimum is an infimum. -/
theorem MinimumIsInfimum [PartialOrder S] {A : Set S} {m : S}
    (minimumHypothesis : IsMinimum m A) : IsInfimum m A := by
  sorry

/-- A supremum that belongs to the set is the maximum. -/
theorem SupremumInSetIsMaximum [Preorder S] {A : Set S} {s : S}
    (supremumHypothesis : IsSupremum s A)
    (membershipHypothesis : s ∈ A) : IsMaximum s A := by
  sorry

/-- An infimum that belongs to the set is the minimum. -/
theorem InfimumInSetIsMinimum [Preorder S] {A : Set S} {i : S}
    (infimumHypothesis : IsInfimum i A)
    (membershipHypothesis : i ∈ A) : IsMinimum i A := by
  sorry

/-- Being a maximum is equivalent to being a supremum that belongs to the set. -/
theorem MaximumIffSupremumAndMembership [PartialOrder S] {A : Set S} {s : S} :
    IsMaximum s A ↔ IsSupremum s A ∧ s ∈ A := by
  sorry

end LRA.VolumeIII.Analysis.Bounding.ExtremalBounds
