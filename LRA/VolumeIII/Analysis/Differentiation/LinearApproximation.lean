/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/differentiation/notes/linear-approximation/notes-linear-approximation.tex.

Full-coverage pass over the `linear-approximation` section. One Lean
statement per book label, `sorry`-bodied. `HasLinearApproximation` below
fixes a single canonical 3-argument signature (ISSUES.md #56 tracks the
book's own inconsistency between this section's usage and
`def:tangent-line`'s different, 2-argument usage — this file does not
reproduce that inconsistency).
-/

import Mathlib.Data.Real.Basic
import LRA.VolumeIII.Analysis.Differentiation.DerivativeDefinition

namespace LRA.VolumeIII.Analysis.Differentiation

/-- `def:first-order-approximation-at-a-point`: `f` has an affine
approximation at `a` with linear part `L`, error `o(x-a)`. -/
def HasLinearApproximation (f : ℝ → ℝ) (a L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x : ℝ, 0 < |x - a| → |x - a| < δ →
    |f x - f a - L * (x - a)| ≤ ε * |x - a|

/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ`. Then `IsDifferentiable f A c ↔ ∃ L,
HasLinearApproximation f c L`. -/
theorem DifferentiableIffHasLinearApproximation (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    IsDifferentiable f A c ↔ ∃ L, HasLinearApproximation f c L := by
  sorry

/-- Let `A : Set ℝ`, `c D : ℝ`, and `L : ℝ`. If `f : ℝ → ℝ`, `hD : Derivative D f A c`, and `hL :
HasLinearApproximation f c L`. Then `L = D`. -/
theorem LinearApproximationSlopeEqDerivative (f : ℝ → ℝ) (A : Set ℝ) (c D : ℝ)
    (hD : Derivative D f A c) (L : ℝ) (hL : HasLinearApproximation f c L) :
    L = D := by
  sorry

end LRA.VolumeIII.Analysis.Differentiation
