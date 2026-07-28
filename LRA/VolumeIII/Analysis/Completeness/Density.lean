import Mathlib.Data.Rat.Cast.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Basic

/-!
Density of the rationals and irrationals in the real line.
-/

namespace LRA.VolumeIII.Analysis.Completeness

/-- A subset is order dense when it contains an element strictly between every ordered pair. -/
def IsOrderDenseSubset {S : Type*} [Preorder S] (D : Set S) : Prop :=
  ∀ x y : S, x < y → ∃ d ∈ D, x < d ∧ d < y

/-- A real number is rational when it lies in the image of the rational coercion. -/
def IsRat (x : ℝ) : Prop :=
  x ∈ Set.range ((↑) : ℚ → ℝ)

/-- A real number is irrational when it is not in the image of the rational coercion. -/
def IsIrrational (x : ℝ) : Prop :=
  ¬ IsRat x

/-- Irrationality is equivalent to not being rational. -/
theorem IsIrrationalIffNotRational {x : ℝ} :
    IsIrrational x ↔ ¬ IsRat x := by
  rfl

/-- The rationals are dense in the real line. -/
theorem DensityOfRationalsInReals {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b := by
  sorry

/-- Rational translation preserves rationality. -/
theorem RationalTranslationPreservesRationality (r q : ℚ) :
    IsRat ((r : ℝ) + (q : ℝ)) := by
  sorry

/-- Rational difference preserves rationality. -/
theorem RationalDifferencePreservesRationality (r q : ℚ) :
    IsRat ((r : ℝ) - (q : ℝ)) := by
  sorry

/-- Nonzero rational products preserve irrationality. -/
theorem NonzeroRationalProductPreservesIrrationality {q : ℚ}
    (nonzeroRationalHypothesis : q ≠ 0)
    {x : ℝ}
    (irrationalHypothesis : ¬ IsRat x) :
    ¬ IsRat ((q : ℝ) * x) := by
  sorry

/-- Rational translation preserves irrationality. -/
theorem RationalTranslationPreservesIrrationality {q : ℚ} {x : ℝ}
    (irrationalHypothesis : ¬ IsRat x) :
    ¬ IsRat ((q : ℝ) + x) := by
  sorry

/-- The difference of two irrational numbers need not be irrational. -/
theorem IrrationalMinusIrrationalNeedNotBeIrrational :
    ∃ x y : ℝ, ¬ IsRat x ∧ ¬ IsRat y ∧ IsRat (x - y) := by
  sorry

/-- A rational minus an irrational is irrational. -/
theorem RationalMinusIrrationalIsIrrational {q : ℚ} {x : ℝ}
    (irrationalHypothesis : ¬ IsRat x) :
    ¬ IsRat ((q : ℝ) - x) := by
  sorry

/-- An irrational plus a rational is irrational. -/
theorem IrrationalPlusRationalIsIrrational {x : ℝ} {q : ℚ}
    (irrationalHypothesis : ¬ IsRat x) :
    ¬ IsRat (x + (q : ℝ)) := by
  sorry

/-- An irrational minus a rational is irrational. -/
theorem IrrationalMinusRationalIsIrrational {x : ℝ} {q : ℚ}
    (irrationalHypothesis : ¬ IsRat x) :
    ¬ IsRat (x - (q : ℝ)) := by
  sorry

/-- The irrationals are dense in the real line. -/
theorem DensityOfIrrationalsInReals {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ s : ℝ, ¬ IsRat s ∧ a < s ∧ s < b := by
  sorry

/-- There is an irrational number between any two rational numbers. -/
theorem IrrationalBetweenAnyTwoRationals {r s : ℚ}
    (rationalIntervalHypothesis : r < s) :
    ∃ x : ℝ, ¬ IsRat x ∧ (r : ℝ) < x ∧ x < (s : ℝ) := by
  sorry

/-- There is a rational number between any two ordered irrational real numbers. -/
theorem RationalBetweenAnyTwoIrrationals {x y : ℝ}
    (leftIrrationalHypothesis : ¬ IsRat x)
    (rightIrrationalHypothesis : ¬ IsRat y)
    (intervalHypothesis : x < y) :
    ∃ q : ℚ, x < (q : ℝ) ∧ (q : ℝ) < y := by
  sorry

/-- There is a positive irrational number below any positive tolerance. -/
theorem SmallIrrationalPositiveNumber {ε : ℝ}
    (positiveToleranceHypothesis : ε > 0) :
    ∃ η : ℝ, ¬ IsRat η ∧ 0 < η ∧ η < ε := by
  sorry

/-- No two real numbers are adjacent. -/
theorem NoAdjacentRealNumbers {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ c : ℝ, a < c ∧ c < b := by
  sorry

/-- The real line has no immediate successors. -/
theorem NoImmediateSuccessorsInReals (a : ℝ) :
    ¬ ∃ m : ℝ, a < m ∧ ∀ x : ℝ, a < x → m ≤ x := by
  sorry

/-- The real line has no immediate predecessors. -/
theorem NoImmediatePredecessorsInReals (a : ℝ) :
    ¬ ∃ m : ℝ, m < a ∧ ∀ x : ℝ, x < a → x ≤ m := by
  sorry

/-- Every open interval contains both a rational and an irrational number. -/
theorem EveryOpenIntervalContainsRationalAndIrrational {a b : ℝ}
    (intervalHypothesis : a < b) :
    (∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b) ∧
      ∃ s : ℝ, ¬ IsRat s ∧ a < s ∧ s < b := by
  sorry

/-- Every open interval contains infinitely many rational and irrational numbers. -/
theorem InfinitelyManyRationalsAndIrrationalsInOpenInterval {a b : ℝ}
    (intervalHypothesis : a < b) :
    {q : ℚ | a < (q : ℝ) ∧ (q : ℝ) < b}.Infinite ∧
      {s : ℝ | ¬ IsRat s ∧ a < s ∧ s < b}.Infinite := by
  sorry

end LRA.VolumeIII.Analysis.Completeness
