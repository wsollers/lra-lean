import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.Analysis.Bounding.ExtremalBounds.MaximaMinima
import LRA.Analysis.Bounding.ExtremalBounds.SupremaInfima

/-!
Order separation consequences of completeness.
-/

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extremal
open LRA.Analysis.Bounds

/-- Let `A B : Set ℝ`. If `leftNonemptyHypothesis : A.Nonempty`, `rightNonemptyHypothesis :
B.Nonempty`, and `separationHypothesis : ∀ a ∈ A, ∀ b ∈ B, a ≤ b`. Then `(∃ u, IsUpperBound u A)
∧ (∃ l, IsLowerBound l B) ∧ ∃ c : ℝ, IsSupremum c A ∧ (∀ a ∈ A, ∀ b ∈ B, a ≤ c ∧ c ≤ b)`.

Logical form:

```lean
theorem OrderSeparationBySupremum {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    (separationHypothesis : ∀ a ∈ A, ∀ b ∈ B, a ≤ b) :
    (∃ u, IsUpperBound u A) ∧ (∃ l, IsLowerBound l B) ∧
      ∃ c : ℝ, IsSupremum c A ∧ (∀ a ∈ A, ∀ b ∈ B, a ≤ c ∧ c ≤ b)
```
-/
theorem OrderSeparationBySupremum {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    (separationHypothesis : ∀ a ∈ A, ∀ b ∈ B, a ≤ b) :
    (∃ u, IsUpperBound u A) ∧ (∃ l, IsLowerBound l B) ∧
      ∃ c : ℝ, IsSupremum c A ∧ (∀ a ∈ A, ∀ b ∈ B, a ≤ c ∧ c ≤ b) := by
  sorry

/-- Let `A B : Set ℝ` and `s i : ℝ`. If `leftNonemptyHypothesis : A.Nonempty`,
`rightNonemptyHypothesis : B.Nonempty`, `separationHypothesis : ∀ a ∈ A, ∀ b ∈ B, a ≤ b`,
`supremumHypothesis : IsSupremum s A`, and `infimumHypothesis : IsInfimum i B`. Then `s ≤ i`.

Logical form:

```lean
theorem SupremumLeInfimumOfOrderSeparatedSets {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    (separationHypothesis : ∀ a ∈ A, ∀ b ∈ B, a ≤ b)
    {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i B) :
    s ≤ i
```
-/
theorem SupremumLeInfimumOfOrderSeparatedSets {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    (separationHypothesis : ∀ a ∈ A, ∀ b ∈ B, a ≤ b)
    {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i B) :
    s ≤ i := by
  sorry

/-- Let `L U : Set ℝ`. If `lowerSetNonemptyHypothesis : L.Nonempty`, `upperSetNonemptyHypothesis :
U.Nonempty`, `disjointHypothesis : L ∩ U = ∅`, `coverHypothesis : L ∪ U = Set.univ`, and
`strictSeparationHypothesis : ∀ l ∈ L, ∀ u ∈ U, l < u`. Then `(∃ m, IsMaximum m L) ∨ (∃ n,
IsMinimum n U)`.

Logical form:

```lean
theorem DedekindCutProperty {L U : Set ℝ}
    (lowerSetNonemptyHypothesis : L.Nonempty)
    (upperSetNonemptyHypothesis : U.Nonempty)
    (disjointHypothesis : L ∩ U = ∅)
    (coverHypothesis : L ∪ U = Set.univ)
    (strictSeparationHypothesis : ∀ l ∈ L, ∀ u ∈ U, l < u) :
    (∃ m, IsMaximum m L) ∨ (∃ n, IsMinimum n U)
```
-/
theorem DedekindCutProperty {L U : Set ℝ}
    (lowerSetNonemptyHypothesis : L.Nonempty)
    (upperSetNonemptyHypothesis : U.Nonempty)
    (disjointHypothesis : L ∩ U = ∅)
    (coverHypothesis : L ∪ U = Set.univ)
    (strictSeparationHypothesis : ∀ l ∈ L, ∀ u ∈ U, l < u) :
    (∃ m, IsMaximum m L) ∨ (∃ n, IsMinimum n U) := by
  sorry

/-- Let `L U : Set ℝ`. If `lowerSetNonemptyHypothesis : L.Nonempty`, `upperSetNonemptyHypothesis :
U.Nonempty`, `disjointHypothesis : L ∩ U = ∅`, `coverHypothesis : L ∪ U = Set.univ`, and
`strictSeparationHypothesis : ∀ l ∈ L, ∀ u ∈ U, l < u`. Then `∃! c : ℝ, (L = {x : ℝ | x < c} ∧ U
= {x : ℝ | c ≤ x}) ∨ (L = {x : ℝ | x ≤ c} ∧ U = {x : ℝ | c < x})`.

Logical form:

```lean
theorem NoGapsInReals {L U : Set ℝ}
    (lowerSetNonemptyHypothesis : L.Nonempty)
    (upperSetNonemptyHypothesis : U.Nonempty)
    (disjointHypothesis : L ∩ U = ∅)
    (coverHypothesis : L ∪ U = Set.univ)
    (strictSeparationHypothesis : ∀ l ∈ L, ∀ u ∈ U, l < u) :
    ∃! c : ℝ, (L = {x : ℝ | x < c} ∧ U = {x : ℝ | c ≤ x}) ∨
      (L = {x : ℝ | x ≤ c} ∧ U = {x : ℝ | c < x})
```
-/
theorem NoGapsInReals {L U : Set ℝ}
    (lowerSetNonemptyHypothesis : L.Nonempty)
    (upperSetNonemptyHypothesis : U.Nonempty)
    (disjointHypothesis : L ∩ U = ∅)
    (coverHypothesis : L ∪ U = Set.univ)
    (strictSeparationHypothesis : ∀ l ∈ L, ∀ u ∈ U, l < u) :
    ∃! c : ℝ, (L = {x : ℝ | x < c} ∧ U = {x : ℝ | c ≤ x}) ∨
      (L = {x : ℝ | x ≤ c} ∧ U = {x : ℝ | c < x}) := by
  sorry

end LRA.Analysis.Completeness
