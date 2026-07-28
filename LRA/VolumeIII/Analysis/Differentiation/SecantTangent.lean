/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/differentiation/notes/secant-tangent/notes-secant-tangent.tex.

Full-coverage pass over the `secant-tangent` section (motivational content
ahead of the formal derivative definition). One Lean statement per book
label, `sorry`-bodied where content is asserted, `def` where content is
purely definitional.
-/

import Mathlib.Data.Real.Basic

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Differentiation

/-- `def:secant-line`: the line through `(x₁, f x₁)` and `(x₂, f x₂)`. -/
noncomputable def SecantLine (f : ℝ → ℝ) (x₁ x₂ : ℝ) : ℝ → ℝ :=
  fun x => f x₁ + (f x₂ - f x₁) / (x₂ - x₁) * (x - x₁)

/-- `def:difference-quotient`: the slope of the secant through `c` and
`c + h`. -/
noncomputable def DifferenceQuotient (f : ℝ → ℝ) (c h : ℝ) : ℝ :=
  (f (c + h) - f c) / h

/-- `def:tangent-line`: the line through `(c, f c)` with slope `f'(c)`,
defined once `f` is known to be differentiable at `c`. -/
def TangentLine (f : ℝ → ℝ) (c fc' : ℝ) : ℝ → ℝ :=
  fun x => f c + fc' * (x - c)

end Differentiation
end Analysis
end VolumeIII
end LRA
