/-
Draft module; not yet imported by the active Volume III root.
Source: real-analysis/notes/modulus/notes-modulus.tex. Audited clean (no
ISSUES.md findings) — this file develops the algebra of absolute value
from scratch as its own axiomatic package (mirroring the book's own
from-first-principles style), even though every fact here is a Mathlib
simp lemma on `abs` (`abs_nonneg`, `abs_eq_zero`, `abs_mul`, etc.) — kept
as `sorry`-bodied statements of their own for parity with the rest of
this audit's one-Lean-statement-per-book-label protocol.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Data.Fintype.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

namespace LRA.VolumeIII.Analysis.RealAnalysis

/-- `def:absolute-value`. -/
noncomputable def AbsR (a : ℝ) : ℝ := if a ≥ 0 then a else -a

-- `thm:absolute-value-nonneg`
/-- Let `a : ℝ`. Then `AbsR a ≥ 0`. -/
theorem AbsoluteValueNonneg (a : ℝ) : AbsR a ≥ 0 := by
  sorry

-- `thm:absolute-value-zero-iff-zero`
/-- Let `a : ℝ`. Then `AbsR a = 0 ↔ a = 0`. -/
theorem AbsoluteValueZeroIffZero (a : ℝ) : AbsR a = 0 ↔ a = 0 := by
  sorry

-- `thm:absolute-value-self-or-neg`
/-- Let `a : ℝ`. Then `AbsR a = a ∨ AbsR a = -a`. -/
theorem AbsoluteValueSelfOrNeg (a : ℝ) : AbsR a = a ∨ AbsR a = -a := by
  sorry

-- `thm:absolute-value-symmetric`
/-- Let `a : ℝ`. Then `AbsR (-a) = AbsR a`. -/
theorem AbsoluteValueSymmetric (a : ℝ) : AbsR (-a) = AbsR a := by
  sorry

-- `thm:absolute-value-product`
/-- Let `a b : ℝ`. Then `AbsR (a * b) = AbsR a * AbsR b`. -/
theorem AbsoluteValueProduct (a b : ℝ) : AbsR (a * b) = AbsR a * AbsR b := by
  sorry

-- `thm:absolute-value-quotient`
/-- Let `a b : ℝ`. If `hb : b ≠ 0`. Then `AbsR (a / b) = AbsR a / AbsR b`. -/
theorem AbsoluteValueQuotient (a b : ℝ) (hb : b ≠ 0) :
    AbsR (a / b) = AbsR a / AbsR b := by
  sorry

-- `thm:absolute-value-bounds`
/-- Let `a : ℝ`. Then `-AbsR a ≤ a ∧ a ≤ AbsR a`. -/
theorem AbsoluteValueBounds (a : ℝ) : -AbsR a ≤ a ∧ a ≤ AbsR a := by
  sorry

-- `thm:absolute-value-le-iff`
/-- Let `a r : ℝ`. If `hr : r ≥ 0`. Then `AbsR a ≤ r ↔ -r ≤ a ∧ a ≤ r`. -/
theorem AbsoluteValueLeIff (a r : ℝ) (hr : r ≥ 0) :
    AbsR a ≤ r ↔ -r ≤ a ∧ a ≤ r := by
  sorry

-- `thm:absolute-value-lt-iff`
/-- Let `a r : ℝ`. If `hr : r > 0`. Then `AbsR a < r ↔ -r < a ∧ a < r`. -/
theorem AbsoluteValueLtIff (a r : ℝ) (hr : r > 0) :
    AbsR a < r ↔ -r < a ∧ a < r := by
  sorry

-- `thm:reverse-triangle-inequality`
/-- Let `a b : ℝ`. Then `AbsR (AbsR a - AbsR b) ≤ AbsR (a - b)`. -/
theorem ReverseTriangleInequality (a b : ℝ) :
    AbsR (AbsR a - AbsR b) ≤ AbsR (a - b) := by
  sorry

-- `thm:absolute-value-sum-bound`
/-- Let `n : ℕ`. If `a : Fin n → ℝ`. Then `AbsR (Finset.univ.sum a) ≤ Finset.univ.sum (fun i => AbsR
(a i))`. -/
theorem AbsoluteValueSumBound (n : ℕ) (a : Fin n → ℝ) :
    AbsR (Finset.univ.sum a) ≤ Finset.univ.sum (fun i => AbsR (a i)) := by
  sorry

end LRA.VolumeIII.Analysis.RealAnalysis
