/-
Draft module; not yet imported by the active Volume III root.
Source: real-analysis/notes/error-propagation/notes-error-propagation.tex.
Audited clean (no ISSUES.md findings) — this file formalizes its content
in full, one node per `\label`.
-/

import Mathlib.Data.Real.Basic

namespace LRA.VolumeIII.Analysis.RealAnalysis

/-- `def:absolute-error-approximation`. -/
def AbsoluteError (x xTilde : ℝ) : ℝ := |x - xTilde|

/-- `def:relative-error-approximation`. -/
noncomputable def RelativeError (x xTilde : ℝ) : ℝ := AbsoluteError x xTilde / |xTilde|

-- `thm:absolute-error-sum`
/-- absolute error is subadditive under
addition. -/
theorem AbsoluteErrorSum (x y xTilde yTilde : ℝ) :
    AbsoluteError (x + y) (xTilde + yTilde) ≤
      AbsoluteError x xTilde + AbsoluteError y yTilde := by
  sorry

-- `thm:absolute-error-product`
/-- The theorem states the absolute error product assertion. -/
theorem AbsoluteErrorProduct (x y xTilde yTilde : ℝ) :
    AbsoluteError (x * y) (xTilde * yTilde) ≤
      |xTilde| * AbsoluteError y yTilde + |yTilde| * AbsoluteError x xTilde +
      AbsoluteError x xTilde * AbsoluteError y yTilde := by
  sorry

-- `thm:absolute-error-quotient`
/-- The theorem states the absolute error quotient assertion. -/
theorem AbsoluteErrorQuotient (x y xTilde yTilde : ℝ)
    (hy : y ≠ 0) (hyTilde : yTilde ≠ 0)
    (hdelta : RelativeError y yTilde < 1) :
    AbsoluteError (x / y) (xTilde / yTilde) ≤
      (|xTilde| * AbsoluteError y yTilde + |yTilde| * AbsoluteError x xTilde)
        / yTilde ^ 2 * (1 / (1 - RelativeError y yTilde)) := by
  sorry

/-- `prop:relative-error-product`. `x,y` are the (implicit-in-the-book)
exact values approximated by `xTilde,yTilde` respectively. -/
theorem RelativeErrorProduct (x y xTilde yTilde : ℝ)
    (hxTilde : xTilde ≠ 0) (hyTilde : yTilde ≠ 0) :
    RelativeError (x * y) (xTilde * yTilde) ≤
      RelativeError x xTilde + RelativeError y yTilde +
      RelativeError x xTilde * RelativeError y yTilde := by
  sorry

/-- `prop:relative-error-quotient`. -/
theorem RelativeErrorQuotient (x y xTilde yTilde : ℝ)
    (hxTilde : xTilde ≠ 0) (hyTilde : yTilde ≠ 0)
    (hdelta : RelativeError y yTilde < 1) :
    RelativeError (x / y) (xTilde / yTilde) ≤
      (RelativeError x xTilde + RelativeError y yTilde) /
        (1 - RelativeError y yTilde) := by
  sorry

end LRA.VolumeIII.Analysis.RealAnalysis
