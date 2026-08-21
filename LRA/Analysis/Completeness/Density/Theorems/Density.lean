import Mathlib.Data.Rat.Cast.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Basic
import LRA.Analysis.Completeness.Density.Definition
import LRA.Order.Density

/-!
Order-density consequences: density of the rationals and irrationals in the
real line, and their order-theoretic corollaries.
-/

namespace LRA.Analysis.Completeness

/-- Let `D D' : Set S`. If `[Preorder S]`, `subsetHypothesis : D ⊆ D'`, and `denseHypothesis :
IsOrderDenseSubset D`. Then `IsOrderDenseSubset D'`.

Logical form:

```lean
theorem IsOrderDenseSubsetMonotone {S : Type*} [Preorder S] {D D' : Set S}
    (subsetHypothesis : D ⊆ D')
    (denseHypothesis : IsOrderDenseSubset D) :
    IsOrderDenseSubset D'
```
-/
theorem IsOrderDenseSubsetMonotone {S : Type*} [Preorder S] {D D' : Set S}
    (subsetHypothesis : D ⊆ D')
    (denseHypothesis : IsOrderDenseSubset D) :
    IsOrderDenseSubset D' := by
  sorry

/-- Let `D E : Set S`. If `[Preorder S]` and `denseHypothesis : IsOrderDenseSubset D`. Then
`IsOrderDenseSubset (D ∪ E)`.

Logical form:

```lean
theorem IsOrderDenseSubsetUnion {S : Type*} [Preorder S] {D : Set S} (E : Set S)
    (denseHypothesis : IsOrderDenseSubset D) :
    IsOrderDenseSubset (D ∪ E)
```
-/
theorem IsOrderDenseSubsetUnion {S : Type*} [Preorder S] {D : Set S} (E : Set S)
    (denseHypothesis : IsOrderDenseSubset D) :
    IsOrderDenseSubset (D ∪ E) := by
  sorry

/-- Let `S : Type*`. If `[Preorder S]`. Then `IsOrderDenseSubset (Set.univ : Set S) ↔
LRA.Order.DenseOrderLaw S`.

Logical form:

```lean
theorem IsOrderDenseSubsetUnivIffDenseOrderLaw {S : Type*} [Preorder S] :
    IsOrderDenseSubset (Set.univ : Set S) ↔ LRA.Order.DenseOrderLaw S
```
-/
theorem IsOrderDenseSubsetUnivIffDenseOrderLaw {S : Type*} [Preorder S] :
    IsOrderDenseSubset (Set.univ : Set S) ↔ LRA.Order.DenseOrderLaw S := by
  sorry

/-- Let `a b : ℝ`. If `intervalHypothesis : a < b`. Then `∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b`.

Logical form:

```lean
theorem DensityOfRationalsInReals {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b
```
-/
theorem DensityOfRationalsInReals {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b := by
  sorry

/-- Let `a b : ℝ`. If `intervalHypothesis : a < b`. Then `∃ s : ℝ, ¬ IsRational s ∧ a < s ∧ s < b`.

Logical form:

```lean
theorem DensityOfIrrationalsInReals {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ s : ℝ, ¬ IsRational s ∧ a < s ∧ s < b
```
-/
theorem DensityOfIrrationalsInReals {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ s : ℝ, ¬ IsRational s ∧ a < s ∧ s < b := by
  sorry

/-- Let `r s : ℚ`. If `rationalIntervalHypothesis : r < s`. Then `∃ x : ℝ, ¬ IsRational x ∧ (r : ℝ) <
x ∧ x < (s : ℝ)`.

Logical form:

```lean
theorem IrrationalBetweenAnyTwoRationals {r s : ℚ}
    (rationalIntervalHypothesis : r < s) :
    ∃ x : ℝ, ¬ IsRational x ∧ (r : ℝ) < x ∧ x < (s : ℝ)
```
-/
theorem IrrationalBetweenAnyTwoRationals {r s : ℚ}
    (rationalIntervalHypothesis : r < s) :
    ∃ x : ℝ, ¬ IsRational x ∧ (r : ℝ) < x ∧ x < (s : ℝ) := by
  sorry

/-- Let `x y : ℝ`. If `leftIrrationalHypothesis : ¬ IsRational x`, `rightIrrationalHypothesis : ¬
IsRational y`, and `intervalHypothesis : x < y`. Then `∃ q : ℚ, x < (q : ℝ) ∧ (q : ℝ) < y`.

Logical form:

```lean
theorem RationalBetweenAnyTwoIrrationals {x y : ℝ}
    (leftIrrationalHypothesis : ¬ IsRational x)
    (rightIrrationalHypothesis : ¬ IsRational y)
    (intervalHypothesis : x < y) :
    ∃ q : ℚ, x < (q : ℝ) ∧ (q : ℝ) < y
```
-/
theorem RationalBetweenAnyTwoIrrationals {x y : ℝ}
    (leftIrrationalHypothesis : ¬ IsRational x)
    (rightIrrationalHypothesis : ¬ IsRational y)
    (intervalHypothesis : x < y) :
    ∃ q : ℚ, x < (q : ℝ) ∧ (q : ℝ) < y := by
  sorry

/-- Let `ε : ℝ`. If `positiveToleranceHypothesis : ε > 0`. Then `∃ η : ℝ, ¬ IsRational η ∧ 0 < η ∧ η
< ε`.

Logical form:

```lean
theorem SmallIrrationalPositiveNumber {ε : ℝ}
    (positiveToleranceHypothesis : ε > 0) :
    ∃ η : ℝ, ¬ IsRational η ∧ 0 < η ∧ η < ε
```
-/
theorem SmallIrrationalPositiveNumber {ε : ℝ}
    (positiveToleranceHypothesis : ε > 0) :
    ∃ η : ℝ, ¬ IsRational η ∧ 0 < η ∧ η < ε := by
  sorry

/-- Let `a b : ℝ`. If `intervalHypothesis : a < b`. Then `∃ c : ℝ, a < c ∧ c < b`.

Logical form:

```lean
theorem NoAdjacentRealNumbers {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ c : ℝ, a < c ∧ c < b
```
-/
theorem NoAdjacentRealNumbers {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ c : ℝ, a < c ∧ c < b := by
  sorry

/-- Let `a : ℝ`. Then `¬ ∃ m : ℝ, a < m ∧ ∀ x : ℝ, a < x → m ≤ x`.

Logical form:

```lean
theorem NoImmediateSuccessorsInReals (a : ℝ) :
    ¬ ∃ m : ℝ, a < m ∧ ∀ x : ℝ, a < x → m ≤ x
```
-/
theorem NoImmediateSuccessorsInReals (a : ℝ) :
    ¬ ∃ m : ℝ, a < m ∧ ∀ x : ℝ, a < x → m ≤ x := by
  sorry

/-- Let `a : ℝ`. Then `¬ ∃ m : ℝ, m < a ∧ ∀ x : ℝ, x < a → x ≤ m`.

Logical form:

```lean
theorem NoImmediatePredecessorsInReals (a : ℝ) :
    ¬ ∃ m : ℝ, m < a ∧ ∀ x : ℝ, x < a → x ≤ m
```
-/
theorem NoImmediatePredecessorsInReals (a : ℝ) :
    ¬ ∃ m : ℝ, m < a ∧ ∀ x : ℝ, x < a → x ≤ m := by
  sorry

/-- Let `a b : ℝ`. If `intervalHypothesis : a < b`. Then `(∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b) ∧ ∃ s
: ℝ, ¬ IsRational s ∧ a < s ∧ s < b`.

Logical form:

```lean
theorem EveryOpenIntervalContainsRationalAndIrrational {a b : ℝ}
    (intervalHypothesis : a < b) :
    (∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b) ∧
      ∃ s : ℝ, ¬ IsRational s ∧ a < s ∧ s < b
```
-/
theorem EveryOpenIntervalContainsRationalAndIrrational {a b : ℝ}
    (intervalHypothesis : a < b) :
    (∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b) ∧
      ∃ s : ℝ, ¬ IsRational s ∧ a < s ∧ s < b := by
  sorry

/-- Let `a b : ℝ`. If `intervalHypothesis : a < b`. Then `{q : ℚ | a < (q : ℝ) ∧ (q : ℝ) <
b}.Infinite ∧ {s : ℝ | ¬ IsRational s ∧ a < s ∧ s < b}.Infinite`.

Logical form:

```lean
theorem InfinitelyManyRationalsAndIrrationalsInOpenInterval {a b : ℝ}
    (intervalHypothesis : a < b) :
    {q : ℚ | a < (q : ℝ) ∧ (q : ℝ) < b}.Infinite ∧
      {s : ℝ | ¬ IsRational s ∧ a < s ∧ s < b}.Infinite
```
-/
theorem InfinitelyManyRationalsAndIrrationalsInOpenInterval {a b : ℝ}
    (intervalHypothesis : a < b) :
    {q : ℚ | a < (q : ℝ) ∧ (q : ℝ) < b}.Infinite ∧
      {s : ℝ | ¬ IsRational s ∧ a < s ∧ s < b}.Infinite := by
  sorry

end LRA.Analysis.Completeness
