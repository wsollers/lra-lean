/-
Draft module; not yet imported by the active Volume III root.
Source: real-analysis/notes/inequality/notes-inequality.tex, first block
(order arithmetic, transitivity, multiplication, reciprocal — through
`thm:ineq-reciprocal-flip`). See ISSUES.md #41, #42 for two Predicate-
reading mismatches found on `thm:ineq-mixed-add` and
`thm:ineq-reciprocal-positive` respectively; the theorem-box statements
formalized below are unaffected (the mismatches are only in the audit
remark, not the theorem itself).
-/

import Mathlib.Data.Real.Basic

namespace LRA.VolumeIII.Analysis.RealAnalysis

/-- `thm:real-order-trichotomy`. -/
theorem RealOrderTrichotomy (a b : ℝ) :
    (a < b ∧ a ≠ b ∧ ¬ a > b) ∨ (a = b ∧ ¬ a < b ∧ ¬ a > b) ∨
    (a > b ∧ a ≠ b ∧ ¬ a < b) := by
  sorry

/-- `thm:ineq-add-both-sides`. -/
theorem IneqAddBothSides (a b c : ℝ) : a < b → a + c < b + c := by sorry

/-- `thm:ineq-nonstrict-add-both-sides`. -/
theorem IneqNonstrictAddBothSides (a b c : ℝ) : a ≤ b → a + c ≤ b + c := by
  sorry

/-- `thm:ineq-add-inequalities`. -/
theorem IneqAddInequalities (a b c d : ℝ) :
    a < b ∧ c < d → a + c < b + d := by sorry

/-- `thm:ineq-nonstrict-add-inequalities`. -/
theorem IneqNonstrictAddInequalities (a b c d : ℝ) :
    a ≤ b ∧ c ≤ d → a + c ≤ b + d := by sorry

/-- `lem:positive-sum`. -/
theorem PositiveSum (a b : ℝ) : a > 0 → b > 0 → a + b > 0 := by sorry

/-- `prop:subtraction-of-inequalities-not-valid`. -/
theorem SubtractionOfInequalitiesNotValid :
    ∃ a b c d : ℝ, a > b ∧ c > d ∧ ¬ (a - c > b - d) ∧ ¬ (c - a > d - b) := by
  sorry

/-- `thm:ineq-mixed-add`. -/
theorem IneqMixedAdd (a b c d : ℝ) : a ≤ b ∧ c < d → a + c < b + d := by
  sorry

/-- `thm:ineq-multiply-positive`. -/
theorem IneqMultiplyPositive (a b c : ℝ) : a < b ∧ 0 < c → a * c < b * c := by
  sorry

/-- `thm:ineq-multiply-negative`. -/
theorem IneqMultiplyNegative (a b c : ℝ) : a < b ∧ c < 0 → a * c > b * c := by
  sorry

/-- `thm:ineq-nonstrict-multiply-positive`. -/
theorem IneqNonstrictMultiplyPositive (a b c : ℝ) :
    a ≤ b ∧ 0 < c → a * c ≤ b * c := by sorry

/-- `thm:ineq-nonstrict-multiply-nonneg`. -/
theorem IneqNonstrictMultiplyNonneg (a b c : ℝ) :
    a ≤ b ∧ 0 ≤ c → a * c ≤ b * c := by sorry

/-- `lem:positive-product`. -/
theorem PositiveProduct (a b : ℝ) : a > 0 → b > 0 → a * b > 0 := by sorry

/-- `lem:negative-times-negative-is-positive`. -/
theorem NegativeTimesNegativeIsPositive (a b : ℝ) :
    a < 0 → b < 0 → a * b > 0 := by sorry

/-- `lem:positive-times-negative-is-negative`. -/
theorem PositiveTimesNegativeIsNegative (a b : ℝ) :
    a > 0 → b < 0 → a * b < 0 := by sorry

/-- `lem:negative-times-positive-is-negative`. -/
theorem NegativeTimesPositiveIsNegative (a b : ℝ) :
    a < 0 → b > 0 → a * b < 0 := by sorry

/-- `lem:order-and-subtraction`. -/
theorem OrderAndSubtraction (a b : ℝ) : a < b ↔ b - a > 0 := by sorry

/-- `lem:non-strict-order-and-subtraction`. -/
theorem NonStrictOrderAndSubtraction (a b : ℝ) : a ≤ b ↔ b - a ≥ 0 := by
  sorry

/-- `lem:division-by-positive-preserves-order`. -/
theorem DivisionByPositivePreservesOrder (a b c : ℝ) :
    a < b → c > 0 → a / c < b / c := by sorry

/-- `lem:division-by-negative-reverses-order`. -/
theorem DivisionByNegativeReversesOrder (a b c : ℝ) :
    a < b → c < 0 → b / c < a / c := by sorry

/-- `lem:positive-multiplication-cancellation`. -/
theorem PositiveMultiplicationCancellation (a b c : ℝ) :
    c > 0 → a * c < b * c → a < b := by sorry

/-- `prop:division-of-inequalities-not-valid`. -/
theorem DivisionOfInequalitiesNotValid :
    ∃ a b c d : ℝ, a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0 ∧ d ≠ 0 ∧ a > b ∧ c > d ∧
      ¬ (a / c > b / d) ∧ ¬ (c / a > d / b) := by sorry

/-- `thm:ineq-squeeze`. -/
theorem IneqSqueeze (a b c : ℝ) : a ≤ b ∧ b ≤ c ∧ a = c → b = a := by sorry

/-- `thm:ineq-transitivity-strict`. -/
theorem IneqTransitivityStrict (a b c : ℝ) : a < b ∧ b < c → a < c := by
  sorry

/-- `thm:ineq-transitivity-mixed`. -/
theorem IneqTransitivityMixed (a b c : ℝ) : a ≤ b ∧ b < c → a < c := by
  sorry

/-- `thm:ineq-reciprocal-positive`. -/
theorem IneqReciprocalPositive (a b : ℝ) :
    0 < a ∧ a < b → 0 < 1 / b ∧ 1 / b < 1 / a := by sorry

/-- `thm:ineq-reciprocal-flip`. -/
theorem IneqReciprocalFlip (a b : ℝ) (ha : a > 0) (hb : b > 0) :
    a < b ↔ 1 / b < 1 / a := by sorry

end LRA.VolumeIII.Analysis.RealAnalysis
