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

-- `thm:real-order-trichotomy`
/-- The theorem states the real order trichotomy assertion. -/
theorem RealOrderTrichotomy (a b : ℝ) :
    (a < b ∧ a ≠ b ∧ ¬ a > b) ∨ (a = b ∧ ¬ a < b ∧ ¬ a > b) ∨
    (a > b ∧ a ≠ b ∧ ¬ a < b) := by
  sorry

-- `thm:ineq-add-both-sides`
/-- The theorem states the ineq add both sides assertion. -/
theorem IneqAddBothSides (a b c : ℝ) : a < b → a + c < b + c := by sorry

-- `thm:ineq-nonstrict-add-both-sides`
/-- The theorem states the ineq nonstrict add both sides assertion. -/
theorem IneqNonstrictAddBothSides (a b c : ℝ) : a ≤ b → a + c ≤ b + c := by
  sorry

-- `thm:ineq-add-inequalities`
/-- The theorem states the ineq add inequalities assertion. -/
theorem IneqAddInequalities (a b c d : ℝ) :
    a < b ∧ c < d → a + c < b + d := by sorry

-- `thm:ineq-nonstrict-add-inequalities`
/-- The theorem states the ineq nonstrict add inequalities assertion. -/
theorem IneqNonstrictAddInequalities (a b c d : ℝ) :
    a ≤ b ∧ c ≤ d → a + c ≤ b + d := by sorry

-- `lem:positive-sum`
/-- The lemma states the positive sum assertion. -/
theorem PositiveSum (a b : ℝ) : a > 0 → b > 0 → a + b > 0 := by sorry

/-- `prop:subtraction-of-inequalities-not-valid`. -/
theorem SubtractionOfInequalitiesNotValid :
    ∃ a b c d : ℝ, a > b ∧ c > d ∧ ¬ (a - c > b - d) ∧ ¬ (c - a > d - b) := by
  sorry

-- `thm:ineq-mixed-add`
/-- The theorem states the ineq mixed add assertion. -/
theorem IneqMixedAdd (a b c d : ℝ) : a ≤ b ∧ c < d → a + c < b + d := by
  sorry

-- `thm:ineq-multiply-positive`
/-- The theorem states the ineq multiply positive assertion. -/
theorem IneqMultiplyPositive (a b c : ℝ) : a < b ∧ 0 < c → a * c < b * c := by
  sorry

-- `thm:ineq-multiply-negative`
/-- The theorem states the ineq multiply negative assertion. -/
theorem IneqMultiplyNegative (a b c : ℝ) : a < b ∧ c < 0 → a * c > b * c := by
  sorry

-- `thm:ineq-nonstrict-multiply-positive`
/-- The theorem states the ineq nonstrict multiply positive assertion. -/
theorem IneqNonstrictMultiplyPositive (a b c : ℝ) :
    a ≤ b ∧ 0 < c → a * c ≤ b * c := by sorry

-- `thm:ineq-nonstrict-multiply-nonneg`
/-- The theorem states the ineq nonstrict multiply nonneg assertion. -/
theorem IneqNonstrictMultiplyNonneg (a b c : ℝ) :
    a ≤ b ∧ 0 ≤ c → a * c ≤ b * c := by sorry

-- `lem:positive-product`
/-- The lemma states the positive product assertion. -/
theorem PositiveProduct (a b : ℝ) : a > 0 → b > 0 → a * b > 0 := by sorry

-- `lem:negative-times-negative-is-positive`
/-- The lemma states that negative times negative is positive. -/
theorem NegativeTimesNegativeIsPositive (a b : ℝ) :
    a < 0 → b < 0 → a * b > 0 := by sorry

-- `lem:positive-times-negative-is-negative`
/-- The lemma states that positive times negative is negative. -/
theorem PositiveTimesNegativeIsNegative (a b : ℝ) :
    a > 0 → b < 0 → a * b < 0 := by sorry

-- `lem:negative-times-positive-is-negative`
/-- The lemma states that negative times positive is negative. -/
theorem NegativeTimesPositiveIsNegative (a b : ℝ) :
    a < 0 → b > 0 → a * b < 0 := by sorry

-- `lem:order-and-subtraction`
/-- The lemma states the order and subtraction assertion. -/
theorem OrderAndSubtraction (a b : ℝ) : a < b ↔ b - a > 0 := by sorry

-- `lem:non-strict-order-and-subtraction`
/-- The lemma states the non strict order and subtraction assertion. -/
theorem NonStrictOrderAndSubtraction (a b : ℝ) : a ≤ b ↔ b - a ≥ 0 := by
  sorry

-- `lem:division-by-positive-preserves-order`
/-- The lemma states that division by positive preserves order. -/
theorem DivisionByPositivePreservesOrder (a b c : ℝ) :
    a < b → c > 0 → a / c < b / c := by sorry

-- `lem:division-by-negative-reverses-order`
/-- The lemma states the division by negative reverses order assertion. -/
theorem DivisionByNegativeReversesOrder (a b c : ℝ) :
    a < b → c < 0 → b / c < a / c := by sorry

-- `lem:positive-multiplication-cancellation`
/-- The lemma states the positive multiplication cancellation assertion. -/
theorem PositiveMultiplicationCancellation (a b c : ℝ) :
    c > 0 → a * c < b * c → a < b := by sorry

/-- `prop:division-of-inequalities-not-valid`. -/
theorem DivisionOfInequalitiesNotValid :
    ∃ a b c d : ℝ, a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0 ∧ d ≠ 0 ∧ a > b ∧ c > d ∧
      ¬ (a / c > b / d) ∧ ¬ (c / a > d / b) := by sorry

-- `thm:ineq-squeeze`
/-- The theorem states the ineq squeeze assertion. -/
theorem IneqSqueeze (a b c : ℝ) : a ≤ b ∧ b ≤ c ∧ a = c → b = a := by sorry

-- `thm:ineq-transitivity-strict`
/-- The theorem states the ineq transitivity strict assertion. -/
theorem IneqTransitivityStrict (a b c : ℝ) : a < b ∧ b < c → a < c := by
  sorry

-- `thm:ineq-transitivity-mixed`
/-- The theorem states the ineq transitivity mixed assertion. -/
theorem IneqTransitivityMixed (a b c : ℝ) : a ≤ b ∧ b < c → a < c := by
  sorry

-- `thm:ineq-reciprocal-positive`
/-- The theorem states the ineq reciprocal positive assertion. -/
theorem IneqReciprocalPositive (a b : ℝ) :
    0 < a ∧ a < b → 0 < 1 / b ∧ 1 / b < 1 / a := by sorry

-- `thm:ineq-reciprocal-flip`
/-- The theorem states the ineq reciprocal flip assertion. -/
theorem IneqReciprocalFlip (a b : ℝ) (ha : a > 0) (hb : b > 0) :
    a < b ↔ 1 / b < 1 / a := by sorry

end LRA.VolumeIII.Analysis.RealAnalysis
