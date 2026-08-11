import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.SupremaInfima

/-!
Maxima and minima as attained extremal bounds.
-/

namespace LRA.VolumeIII.Analysis.Bounding.ExtremalBounds

variable {S : Type*}

/-- `IsMaximum m A` says `m` is an upper bound of `A` that belongs to `A`.

Logical form:

```lean
def IsMaximum [LE S] (m : S) (A : Set S) : Prop :=
  m ∈ A ∧ IsUpperBound m A
```
-/
def IsMaximum [LE S] (m : S) (A : Set S) : Prop :=
  m ∈ A ∧ IsUpperBound m A

/-- `IsMinimum m A` says `m` is a lower bound of `A` that belongs to `A`.

Logical form:

```lean
def IsMinimum [LE S] (m : S) (A : Set S) : Prop :=
  m ∈ A ∧ IsLowerBound m A
```
-/
def IsMinimum [LE S] (m : S) (A : Set S) : Prop :=
  m ∈ A ∧ IsLowerBound m A

/-- Let `A : Set S` and `m₁ m₂ : S`. If `[PartialOrder S]`, `leftMaximum : IsMaximum m₁ A`, and
`rightMaximum : IsMaximum m₂ A`. Then `m₁ = m₂`.

Logical form:

```lean
theorem MaximumUnique [PartialOrder S] {A : Set S} {m₁ m₂ : S}
    (leftMaximum : IsMaximum m₁ A) (rightMaximum : IsMaximum m₂ A) : m₁ = m₂
```
-/
theorem MaximumUnique [PartialOrder S] {A : Set S} {m₁ m₂ : S}
    (leftMaximum : IsMaximum m₁ A) (rightMaximum : IsMaximum m₂ A) : m₁ = m₂ := by
  sorry

/-- Let `A : Set S` and `m₁ m₂ : S`. If `[PartialOrder S]`, `leftMinimum : IsMinimum m₁ A`, and
`rightMinimum : IsMinimum m₂ A`. Then `m₁ = m₂`.

Logical form:

```lean
theorem MinimumUnique [PartialOrder S] {A : Set S} {m₁ m₂ : S}
    (leftMinimum : IsMinimum m₁ A) (rightMinimum : IsMinimum m₂ A) : m₁ = m₂
```
-/
theorem MinimumUnique [PartialOrder S] {A : Set S} {m₁ m₂ : S}
    (leftMinimum : IsMinimum m₁ A) (rightMinimum : IsMinimum m₂ A) : m₁ = m₂ := by
  sorry

/-- Let `A : Set S` and `m : S`. If `[PartialOrder S]` and `maximumHypothesis : IsMaximum m A`. Then
`IsSupremum m A`.

Logical form:

```lean
theorem MaximumIsSupremum [PartialOrder S] {A : Set S} {m : S}
    (maximumHypothesis : IsMaximum m A) : IsSupremum m A
```
-/
theorem MaximumIsSupremum [PartialOrder S] {A : Set S} {m : S}
    (maximumHypothesis : IsMaximum m A) : IsSupremum m A := by
  sorry

/-- Let `A : Set S` and `m : S`. If `[PartialOrder S]` and `minimumHypothesis : IsMinimum m A`. Then
`IsInfimum m A`.

Logical form:

```lean
theorem MinimumIsInfimum [PartialOrder S] {A : Set S} {m : S}
    (minimumHypothesis : IsMinimum m A) : IsInfimum m A
```
-/
theorem MinimumIsInfimum [PartialOrder S] {A : Set S} {m : S}
    (minimumHypothesis : IsMinimum m A) : IsInfimum m A := by
  sorry

/-- Let `A : Set S` and `s : S`. If `[Preorder S]`, `supremumHypothesis : IsSupremum s A`, and
`membershipHypothesis : s ∈ A`. Then `IsMaximum s A`.

Logical form:

```lean
theorem SupremumInSetIsMaximum [Preorder S] {A : Set S} {s : S}
    (supremumHypothesis : IsSupremum s A)
    (membershipHypothesis : s ∈ A) : IsMaximum s A
```
-/
theorem SupremumInSetIsMaximum [Preorder S] {A : Set S} {s : S}
    (supremumHypothesis : IsSupremum s A)
    (membershipHypothesis : s ∈ A) : IsMaximum s A := by
  sorry

/-- Let `A : Set S` and `i : S`. If `[Preorder S]`, `infimumHypothesis : IsInfimum i A`, and
`membershipHypothesis : i ∈ A`. Then `IsMinimum i A`.

Logical form:

```lean
theorem InfimumInSetIsMinimum [Preorder S] {A : Set S} {i : S}
    (infimumHypothesis : IsInfimum i A)
    (membershipHypothesis : i ∈ A) : IsMinimum i A
```
-/
theorem InfimumInSetIsMinimum [Preorder S] {A : Set S} {i : S}
    (infimumHypothesis : IsInfimum i A)
    (membershipHypothesis : i ∈ A) : IsMinimum i A := by
  sorry

/-- Let `A : Set S` and `s : S`. If `[PartialOrder S]`. Then `IsMaximum s A ↔ IsSupremum s A ∧ s ∈
A`.

Logical form:

```lean
theorem MaximumIffSupremumAndMembership [PartialOrder S] {A : Set S} {s : S} :
    IsMaximum s A ↔ IsSupremum s A ∧ s ∈ A
```
-/
theorem MaximumIffSupremumAndMembership [PartialOrder S] {A : Set S} {s : S} :
    IsMaximum s A ↔ IsSupremum s A ∧ s ∈ A := by
  sorry

end LRA.VolumeIII.Analysis.Bounding.ExtremalBounds
