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
/-- Let `a b : ℝ`. Then `(a < b ∧ a ≠ b ∧ ¬ a > b) ∨ (a = b ∧ ¬ a < b ∧ ¬ a > b) ∨ (a > b ∧ a ≠ b ∧
¬ a < b)`. -/
theorem RealOrderTrichotomy (a b : ℝ) :
    (a < b ∧ a ≠ b ∧ ¬ a > b) ∨ (a = b ∧ ¬ a < b ∧ ¬ a > b) ∨
    (a > b ∧ a ≠ b ∧ ¬ a < b) := by
  sorry

-- `thm:ineq-add-both-sides`
/-- Let `a b c : ℝ`. Then `a < b → a + c < b + c`. -/
theorem IneqAddBothSides (a b c : ℝ) : a < b → a + c < b + c := by sorry

-- `thm:ineq-nonstrict-add-both-sides`
/-- Let `a b c : ℝ`. Then `a ≤ b → a + c ≤ b + c`. -/
theorem IneqNonstrictAddBothSides (a b c : ℝ) : a ≤ b → a + c ≤ b + c := by
  sorry

-- `thm:ineq-add-inequalities`
/-- Let `a b c d : ℝ`. Then `a < b ∧ c < d → a + c < b + d`. -/
theorem IneqAddInequalities (a b c d : ℝ) :
    a < b ∧ c < d → a + c < b + d := by sorry

-- `thm:ineq-nonstrict-add-inequalities`
/-- Let `a b c d : ℝ`. Then `a ≤ b ∧ c ≤ d → a + c ≤ b + d`. -/
theorem IneqNonstrictAddInequalities (a b c d : ℝ) :
    a ≤ b ∧ c ≤ d → a + c ≤ b + d := by sorry

-- `lem:positive-sum`
/-- Let `a b : ℝ`. Then `a > 0 → b > 0 → a + b > 0`. -/
theorem PositiveSum (a b : ℝ) : a > 0 → b > 0 → a + b > 0 := by sorry

/-- The theorem asserts `∃ a b c d : ℝ, a > b ∧ c > d ∧ ¬ (a - c > b - d) ∧ ¬ (c - a > d - b)`. -/
theorem SubtractionOfInequalitiesNotValid :
    ∃ a b c d : ℝ, a > b ∧ c > d ∧ ¬ (a - c > b - d) ∧ ¬ (c - a > d - b) := by
  sorry

-- `thm:ineq-mixed-add`
/-- Let `a b c d : ℝ`. Then `a ≤ b ∧ c < d → a + c < b + d`. -/
theorem IneqMixedAdd (a b c d : ℝ) : a ≤ b ∧ c < d → a + c < b + d := by
  sorry

-- `thm:ineq-multiply-positive`
/-- Let `a b c : ℝ`. Then `a < b ∧ 0 < c → a * c < b * c`. -/
theorem IneqMultiplyPositive (a b c : ℝ) : a < b ∧ 0 < c → a * c < b * c := by
  sorry

-- `thm:ineq-multiply-negative`
/-- Let `a b c : ℝ`. Then `a < b ∧ c < 0 → a * c > b * c`. -/
theorem IneqMultiplyNegative (a b c : ℝ) : a < b ∧ c < 0 → a * c > b * c := by
  sorry

-- `thm:ineq-nonstrict-multiply-positive`
/-- Let `a b c : ℝ`. Then `a ≤ b ∧ 0 < c → a * c ≤ b * c`. -/
theorem IneqNonstrictMultiplyPositive (a b c : ℝ) :
    a ≤ b ∧ 0 < c → a * c ≤ b * c := by sorry

-- `thm:ineq-nonstrict-multiply-nonneg`
/-- Let `a b c : ℝ`. Then `a ≤ b ∧ 0 ≤ c → a * c ≤ b * c`. -/
theorem IneqNonstrictMultiplyNonneg (a b c : ℝ) :
    a ≤ b ∧ 0 ≤ c → a * c ≤ b * c := by sorry

-- `lem:positive-product`
/-- Let `a b : ℝ`. Then `a > 0 → b > 0 → a * b > 0`. -/
theorem PositiveProduct (a b : ℝ) : a > 0 → b > 0 → a * b > 0 := by sorry

-- `lem:negative-times-negative-is-positive`
/-- Let `a b : ℝ`. Then `a < 0 → b < 0 → a * b > 0`. -/
theorem NegativeTimesNegativeIsPositive (a b : ℝ) :
    a < 0 → b < 0 → a * b > 0 := by sorry

-- `lem:positive-times-negative-is-negative`
/-- Let `a b : ℝ`. Then `a > 0 → b < 0 → a * b < 0`. -/
theorem PositiveTimesNegativeIsNegative (a b : ℝ) :
    a > 0 → b < 0 → a * b < 0 := by sorry

-- `lem:negative-times-positive-is-negative`
/-- Let `a b : ℝ`. Then `a < 0 → b > 0 → a * b < 0`. -/
theorem NegativeTimesPositiveIsNegative (a b : ℝ) :
    a < 0 → b > 0 → a * b < 0 := by sorry

-- `lem:order-and-subtraction`
/-- Let `a b : ℝ`. Then `a < b ↔ b - a > 0`. -/
theorem OrderAndSubtraction (a b : ℝ) : a < b ↔ b - a > 0 := by sorry

-- `lem:non-strict-order-and-subtraction`
/-- Let `a b : ℝ`. Then `a ≤ b ↔ b - a ≥ 0`. -/
theorem NonStrictOrderAndSubtraction (a b : ℝ) : a ≤ b ↔ b - a ≥ 0 := by
  sorry

-- `lem:division-by-positive-preserves-order`
/-- Let `a b c : ℝ`. Then `a < b → c > 0 → a / c < b / c`. -/
theorem DivisionByPositivePreservesOrder (a b c : ℝ) :
    a < b → c > 0 → a / c < b / c := by sorry

-- `lem:division-by-negative-reverses-order`
/-- Let `a b c : ℝ`. Then `a < b → c < 0 → b / c < a / c`. -/
theorem DivisionByNegativeReversesOrder (a b c : ℝ) :
    a < b → c < 0 → b / c < a / c := by sorry

-- `lem:positive-multiplication-cancellation`
/-- Let `a b c : ℝ`. Then `c > 0 → a * c < b * c → a < b`. -/
theorem PositiveMultiplicationCancellation (a b c : ℝ) :
    c > 0 → a * c < b * c → a < b := by sorry

/-- The theorem asserts `∃ a b c d : ℝ, a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0 ∧ d ≠ 0 ∧ a > b ∧ c > d ∧ ¬ (a / c > b
/ d) ∧ ¬ (c / a > d / b)`. -/
theorem DivisionOfInequalitiesNotValid :
    ∃ a b c d : ℝ, a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0 ∧ d ≠ 0 ∧ a > b ∧ c > d ∧
      ¬ (a / c > b / d) ∧ ¬ (c / a > d / b) := by sorry

-- `thm:ineq-squeeze`
/-- Let `a b c : ℝ`. Then `a ≤ b ∧ b ≤ c ∧ a = c → b = a`. -/
theorem IneqSqueeze (a b c : ℝ) : a ≤ b ∧ b ≤ c ∧ a = c → b = a := by sorry

-- `thm:ineq-transitivity-strict`
/-- Let `a b c : ℝ`. Then `a < b ∧ b < c → a < c`. -/
theorem IneqTransitivityStrict (a b c : ℝ) : a < b ∧ b < c → a < c := by
  sorry

-- `thm:ineq-transitivity-mixed`
/-- Let `a b c : ℝ`. Then `a ≤ b ∧ b < c → a < c`. -/
theorem IneqTransitivityMixed (a b c : ℝ) : a ≤ b ∧ b < c → a < c := by
  sorry

-- `thm:ineq-reciprocal-positive`
/-- Let `a b : ℝ`. Then `0 < a ∧ a < b → 0 < 1 / b ∧ 1 / b < 1 / a`. -/
theorem IneqReciprocalPositive (a b : ℝ) :
    0 < a ∧ a < b → 0 < 1 / b ∧ 1 / b < 1 / a := by sorry

-- `thm:ineq-reciprocal-flip`
/-- Let `a b : ℝ`. If `ha : a > 0` and `hb : b > 0`. Then `a < b ↔ 1 / b < 1 / a`. -/
theorem IneqReciprocalFlip (a b : ℝ) (ha : a > 0) (hb : b > 0) :
    a < b ↔ 1 / b < 1 / a := by sorry

end LRA.VolumeIII.Analysis.RealAnalysis
