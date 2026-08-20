import Mathlib.Data.Rat.Cast.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Basic

/-!
Density of the rationals and irrationals in the real line.
-/

namespace LRA.Analysis.Completeness

/-- A subset is order dense when it contains an element strictly between every ordered pair.

Logical form:

```lean
def IsOrderDenseSubset {S : Type*} [Preorder S] (D : Set S) : Prop :=
  ∀ x y : S, x < y → ∃ d ∈ D, x < d ∧ d < y
```
-/
def IsOrderDenseSubset {S : Type*} [Preorder S] (D : Set S) : Prop :=
  ∀ x y : S, x < y → ∃ d ∈ D, x < d ∧ d < y

/-- A real number is rational when it lies in the image of the rational coercion.

Logical form:

```lean
def IsRat (x : ℝ) : Prop :=
  x ∈ Set.range ((↑) : ℚ → ℝ)
```
-/
def IsRat (x : ℝ) : Prop :=
  x ∈ Set.range ((↑) : ℚ → ℝ)

/-- A real number is irrational when it is not in the image of the rational coercion.

Logical form:

```lean
def IsIrrational (x : ℝ) : Prop :=
  ¬ IsRat x
```
-/
def IsIrrational (x : ℝ) : Prop :=
  ¬ IsRat x

/-- Let `x : ℝ`. Then `IsIrrational x ↔ ¬ IsRat x`.

Logical form:

```lean
theorem IsIrrationalIffNotRational {x : ℝ} :
    IsIrrational x ↔ ¬ IsRat x
```
-/
theorem IsIrrationalIffNotRational {x : ℝ} :
    IsIrrational x ↔ ¬ IsRat x := by
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

/-- Let `r q : ℚ`. Then `IsRat ((r : ℝ) + (q : ℝ))`.

Logical form:

```lean
theorem RationalTranslationPreservesRationality (r q : ℚ) :
    IsRat ((r : ℝ) + (q : ℝ))
```
-/
theorem RationalTranslationPreservesRationality (r q : ℚ) :
    IsRat ((r : ℝ) + (q : ℝ)) := by
  sorry

/-- Let `r q : ℚ`. Then `IsRat ((r : ℝ) - (q : ℝ))`.

Logical form:

```lean
theorem RationalDifferencePreservesRationality (r q : ℚ) :
    IsRat ((r : ℝ) - (q : ℝ))
```
-/
theorem RationalDifferencePreservesRationality (r q : ℚ) :
    IsRat ((r : ℝ) - (q : ℝ)) := by
  sorry

/-- Let `q : ℚ` and `x : ℝ`. If `nonzeroRationalHypothesis : q ≠ 0` and `irrationalHypothesis : ¬
IsRat x`. Then `¬ IsRat ((q : ℝ) * x)`.

Logical form:

```lean
theorem NonzeroRationalProductPreservesIrrationality {q : ℚ}
    (nonzeroRationalHypothesis : q ≠ 0)
    {x : ℝ}
    (irrationalHypothesis : ¬ IsRat x) :
    ¬ IsRat ((q : ℝ) * x)
```
-/
theorem NonzeroRationalProductPreservesIrrationality {q : ℚ}
    (nonzeroRationalHypothesis : q ≠ 0)
    {x : ℝ}
    (irrationalHypothesis : ¬ IsRat x) :
    ¬ IsRat ((q : ℝ) * x) := by
  sorry

/-- Let `q : ℚ` and `x : ℝ`. If `irrationalHypothesis : ¬ IsRat x`. Then `¬ IsRat ((q : ℝ) + x)`.

Logical form:

```lean
theorem RationalTranslationPreservesIrrationality {q : ℚ} {x : ℝ}
    (irrationalHypothesis : ¬ IsRat x) :
    ¬ IsRat ((q : ℝ) + x)
```
-/
theorem RationalTranslationPreservesIrrationality {q : ℚ} {x : ℝ}
    (irrationalHypothesis : ¬ IsRat x) :
    ¬ IsRat ((q : ℝ) + x) := by
  sorry

/-- The theorem asserts `∃ x y : ℝ, ¬ IsRat x ∧ ¬ IsRat y ∧ IsRat (x - y)`.

Logical form:

```lean
theorem IrrationalMinusIrrationalNeedNotBeIrrational :
    ∃ x y : ℝ, ¬ IsRat x ∧ ¬ IsRat y ∧ IsRat (x - y)
```
-/
theorem IrrationalMinusIrrationalNeedNotBeIrrational :
    ∃ x y : ℝ, ¬ IsRat x ∧ ¬ IsRat y ∧ IsRat (x - y) := by
  sorry

/-- Let `q : ℚ` and `x : ℝ`. If `irrationalHypothesis : ¬ IsRat x`. Then `¬ IsRat ((q : ℝ) - x)`.

Logical form:

```lean
theorem RationalMinusIrrationalIsIrrational {q : ℚ} {x : ℝ}
    (irrationalHypothesis : ¬ IsRat x) :
    ¬ IsRat ((q : ℝ) - x)
```
-/
theorem RationalMinusIrrationalIsIrrational {q : ℚ} {x : ℝ}
    (irrationalHypothesis : ¬ IsRat x) :
    ¬ IsRat ((q : ℝ) - x) := by
  sorry

/-- Let `x : ℝ` and `q : ℚ`. If `irrationalHypothesis : ¬ IsRat x`. Then `¬ IsRat (x + (q : ℝ))`.

Logical form:

```lean
theorem IrrationalPlusRationalIsIrrational {x : ℝ} {q : ℚ}
    (irrationalHypothesis : ¬ IsRat x) :
    ¬ IsRat (x + (q : ℝ))
```
-/
theorem IrrationalPlusRationalIsIrrational {x : ℝ} {q : ℚ}
    (irrationalHypothesis : ¬ IsRat x) :
    ¬ IsRat (x + (q : ℝ)) := by
  sorry

/-- Let `x : ℝ` and `q : ℚ`. If `irrationalHypothesis : ¬ IsRat x`. Then `¬ IsRat (x - (q : ℝ))`.

Logical form:

```lean
theorem IrrationalMinusRationalIsIrrational {x : ℝ} {q : ℚ}
    (irrationalHypothesis : ¬ IsRat x) :
    ¬ IsRat (x - (q : ℝ))
```
-/
theorem IrrationalMinusRationalIsIrrational {x : ℝ} {q : ℚ}
    (irrationalHypothesis : ¬ IsRat x) :
    ¬ IsRat (x - (q : ℝ)) := by
  sorry

/-- Let `a b : ℝ`. If `intervalHypothesis : a < b`. Then `∃ s : ℝ, ¬ IsRat s ∧ a < s ∧ s < b`.

Logical form:

```lean
theorem DensityOfIrrationalsInReals {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ s : ℝ, ¬ IsRat s ∧ a < s ∧ s < b
```
-/
theorem DensityOfIrrationalsInReals {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ s : ℝ, ¬ IsRat s ∧ a < s ∧ s < b := by
  sorry

/-- Let `r s : ℚ`. If `rationalIntervalHypothesis : r < s`. Then `∃ x : ℝ, ¬ IsRat x ∧ (r : ℝ) < x ∧
x < (s : ℝ)`.

Logical form:

```lean
theorem IrrationalBetweenAnyTwoRationals {r s : ℚ}
    (rationalIntervalHypothesis : r < s) :
    ∃ x : ℝ, ¬ IsRat x ∧ (r : ℝ) < x ∧ x < (s : ℝ)
```
-/
theorem IrrationalBetweenAnyTwoRationals {r s : ℚ}
    (rationalIntervalHypothesis : r < s) :
    ∃ x : ℝ, ¬ IsRat x ∧ (r : ℝ) < x ∧ x < (s : ℝ) := by
  sorry

/-- Let `x y : ℝ`. If `leftIrrationalHypothesis : ¬ IsRat x`, `rightIrrationalHypothesis : ¬ IsRat
y`, and `intervalHypothesis : x < y`. Then `∃ q : ℚ, x < (q : ℝ) ∧ (q : ℝ) < y`.

Logical form:

```lean
theorem RationalBetweenAnyTwoIrrationals {x y : ℝ}
    (leftIrrationalHypothesis : ¬ IsRat x)
    (rightIrrationalHypothesis : ¬ IsRat y)
    (intervalHypothesis : x < y) :
    ∃ q : ℚ, x < (q : ℝ) ∧ (q : ℝ) < y
```
-/
theorem RationalBetweenAnyTwoIrrationals {x y : ℝ}
    (leftIrrationalHypothesis : ¬ IsRat x)
    (rightIrrationalHypothesis : ¬ IsRat y)
    (intervalHypothesis : x < y) :
    ∃ q : ℚ, x < (q : ℝ) ∧ (q : ℝ) < y := by
  sorry

/-- Let `ε : ℝ`. If `positiveToleranceHypothesis : ε > 0`. Then `∃ η : ℝ, ¬ IsRat η ∧ 0 < η ∧ η <
ε`.

Logical form:

```lean
theorem SmallIrrationalPositiveNumber {ε : ℝ}
    (positiveToleranceHypothesis : ε > 0) :
    ∃ η : ℝ, ¬ IsRat η ∧ 0 < η ∧ η < ε
```
-/
theorem SmallIrrationalPositiveNumber {ε : ℝ}
    (positiveToleranceHypothesis : ε > 0) :
    ∃ η : ℝ, ¬ IsRat η ∧ 0 < η ∧ η < ε := by
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
: ℝ, ¬ IsRat s ∧ a < s ∧ s < b`.

Logical form:

```lean
theorem EveryOpenIntervalContainsRationalAndIrrational {a b : ℝ}
    (intervalHypothesis : a < b) :
    (∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b) ∧
      ∃ s : ℝ, ¬ IsRat s ∧ a < s ∧ s < b
```
-/
theorem EveryOpenIntervalContainsRationalAndIrrational {a b : ℝ}
    (intervalHypothesis : a < b) :
    (∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b) ∧
      ∃ s : ℝ, ¬ IsRat s ∧ a < s ∧ s < b := by
  sorry

/-- Let `a b : ℝ`. If `intervalHypothesis : a < b`. Then `{q : ℚ | a < (q : ℝ) ∧ (q : ℝ) <
b}.Infinite ∧ {s : ℝ | ¬ IsRat s ∧ a < s ∧ s < b}.Infinite`.

Logical form:

```lean
theorem InfinitelyManyRationalsAndIrrationalsInOpenInterval {a b : ℝ}
    (intervalHypothesis : a < b) :
    {q : ℚ | a < (q : ℝ) ∧ (q : ℝ) < b}.Infinite ∧
      {s : ℝ | ¬ IsRat s ∧ a < s ∧ s < b}.Infinite
```
-/
theorem InfinitelyManyRationalsAndIrrationalsInOpenInterval {a b : ℝ}
    (intervalHypothesis : a < b) :
    {q : ℚ | a < (q : ℝ) ∧ (q : ℝ) < b}.Infinite ∧
      {s : ℝ | ¬ IsRat s ∧ a < s ∧ s < b}.Infinite := by
  sorry

end LRA.Analysis.Completeness
