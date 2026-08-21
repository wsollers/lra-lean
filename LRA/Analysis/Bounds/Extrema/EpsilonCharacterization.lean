import LRA.Analysis.Bounds.Extrema.SupremaInfima

/-!
Epsilon characterizations of suprema and infima in the real line.
-/

namespace LRA.Analysis.Bounds.Extrema

/-- Let `A : Set ℝ` and `s : ℝ`. Then `IsSupremum s A ↔ IsUpperBound s A ∧ ∀ ε : ℝ, 0 < ε → ∃ a ∈ A,
s - ε < a`.

Logical form:

```lean
theorem SupremumEpsilonCharacterization {A : Set ℝ} {s : ℝ} :
    IsSupremum s A ↔
      IsUpperBound s A ∧ ∀ ε : ℝ, 0 < ε → ∃ a ∈ A, s - ε < a
```
-/
theorem SupremumEpsilonCharacterization {A : Set ℝ} {s : ℝ} :
    IsSupremum s A ↔
      IsUpperBound s A ∧ ∀ ε : ℝ, 0 < ε → ∃ a ∈ A, s - ε < a := by
  sorry

/-- Let `A : Set ℝ` and `i : ℝ`. Then `IsInfimum i A ↔ IsLowerBound i A ∧ ∀ ε : ℝ, 0 < ε → ∃ a ∈ A,
a < i + ε`.

Logical form:

```lean
theorem InfimumEpsilonCharacterization {A : Set ℝ} {i : ℝ} :
    IsInfimum i A ↔
      IsLowerBound i A ∧ ∀ ε : ℝ, 0 < ε → ∃ a ∈ A, a < i + ε
```
-/
theorem InfimumEpsilonCharacterization {A : Set ℝ} {i : ℝ} :
    IsInfimum i A ↔
      IsLowerBound i A ∧ ∀ ε : ℝ, 0 < ε → ∃ a ∈ A, a < i + ε := by
  sorry

/-- Let `A : Set ℝ` and `s u : ℝ`. If `supremumHypothesis : IsSupremum s A` and `strictApproximation
: u < s`. Then `∃ a ∈ A, u < a`.

Logical form:

```lean
theorem SupremumStrictUpperApproximation {A : Set ℝ} {s u : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (strictApproximation : u < s) :
    ∃ a ∈ A, u < a
```
-/
theorem SupremumStrictUpperApproximation {A : Set ℝ} {s u : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (strictApproximation : u < s) :
    ∃ a ∈ A, u < a := by
  sorry

/-- Let `A : Set ℝ` and `i l : ℝ`. If `infimumHypothesis : IsInfimum i A` and `strictApproximation :
i < l`. Then `∃ a ∈ A, a < l`.

Logical form:

```lean
theorem InfimumStrictLowerApproximation {A : Set ℝ} {i l : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (strictApproximation : i < l) :
    ∃ a ∈ A, a < l
```
-/
theorem InfimumStrictLowerApproximation {A : Set ℝ} {i l : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (strictApproximation : i < l) :
    ∃ a ∈ A, a < l := by
  sorry

end LRA.Analysis.Bounds.Extrema
