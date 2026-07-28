/-
Draft module; not yet imported by the active Volume III root.
Source: real-analysis/notes/inequality/notes-inequality.tex, second block
(squares and square roots — from `thm:square-nonnegative` through
`thm:unit-interval-square-bounds`). Square-root content is stated against
Mathlib's `Real.sqrt` rather than reintroducing a standalone square-root
function, since the book's own `def:real-square-root-function` is exactly
the existence/uniqueness property `Real.sqrt` already satisfies — restated
below as its own citable theorem to match this file's one-Lean-statement-
per-book-label protocol, not skipped for being "already in the library".
See ISSUES.md #43 for the one Predicate-reading mismatch found on
`thm:ineq-square-root-monotone`; the theorem-box statement below is
unaffected.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.SpecialFunctions.Pow.NNReal

namespace LRA
namespace VolumeIII
namespace Analysis
namespace RealAnalysis

/-- `thm:square-nonnegative`. -/
theorem SquareNonnegative (a : ℝ) : a ^ 2 ≥ 0 := by sorry

/-- `def:real-square-root-function`: existence and uniqueness of the
nonnegative square root, the defining property `Real.sqrt` already
satisfies. -/
theorem RealSquareRootFunction (a : ℝ) (ha : a ≥ 0) :
    ∃! b : ℝ, b ≥ 0 ∧ b ^ 2 = a := by sorry

/-- `thm:sqrt-nonnegative`. -/
theorem SqrtNonnegative (a : ℝ) (ha : a ≥ 0) : Real.sqrt a ≥ 0 := by sorry

/-- `thm:sqrt-square`. -/
theorem SqrtSquare (a : ℝ) (ha : a ≥ 0) : Real.sqrt a ^ 2 = a := by sorry

/-- `thm:sqrt-zero-one`. -/
theorem SqrtZeroOne : Real.sqrt 0 = 0 ∧ Real.sqrt 1 = 1 := by sorry

/-- `thm:sqrt-positive`. -/
theorem SqrtPositive (a : ℝ) (ha : a > 0) : Real.sqrt a > 0 := by sorry

/-- `thm:sqrt-of-square-absolute-value`. -/
theorem SqrtOfSquareAbsoluteValue (a : ℝ) : Real.sqrt (a ^ 2) = |a| := by
  sorry

/-- `thm:sqrt-product`. -/
theorem SqrtProduct (a b : ℝ) (ha : a ≥ 0) (hb : b ≥ 0) :
    Real.sqrt (a * b) = Real.sqrt a * Real.sqrt b := by sorry

/-- `thm:sqrt-quotient`. -/
theorem SqrtQuotient (a b : ℝ) (ha : a ≥ 0) (hb : b > 0) :
    Real.sqrt (a / b) = Real.sqrt a / Real.sqrt b := by sorry

/-- `thm:ineq-square-root-strict-monotone`. -/
theorem IneqSquareRootStrictMonotone (a b : ℝ) :
    0 ≤ a ∧ a < b → Real.sqrt a < Real.sqrt b := by sorry

/-- `lem:positive-powers-are-positive`. -/
theorem PositivePowersArePositive (x : ℝ) (n : ℕ) (hx : x > 0) : x ^ n > 0 := by
  sorry

/-- `lem:powers-preserve-order-for-positive-numbers`. -/
theorem PowersPreserveOrderForPositiveNumbers (x y : ℝ) (n : ℕ) :
    0 < x ∧ x < y → x ^ n < y ^ n := by sorry

/-- `thm:ineq-square-monotone`. -/
theorem IneqSquareMonotone (a b : ℝ) : 0 ≤ a ∧ a < b → a ^ 2 < b ^ 2 := by
  sorry

/-- `thm:ineq-square-root-monotone`. -/
theorem IneqSquareRootMonotone (a b : ℝ) :
    0 ≤ a ∧ a ≤ b → Real.sqrt a ≤ Real.sqrt b := by sorry

/-- `thm:positive-square-comparison`. -/
theorem PositiveSquareComparison (a b : ℝ) (ha : a > 0) (hb : b > 0)
    (h : a ^ 2 < b ^ 2) : a < b := by sorry

/-- `thm:unit-interval-square-bounds`. -/
theorem UnitIntervalSquareBounds (a : ℝ) :
    (0 < a ∧ a < 1 → a ^ 2 < a) ∧ (a > 1 → a ^ 2 > a) := by sorry

end RealAnalysis
end Analysis
end VolumeIII
end LRA
