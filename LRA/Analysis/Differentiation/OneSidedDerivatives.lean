/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/differentiation/notes/one-sided-derivatives/notes-one-sided-derivatives.tex.

Full-coverage pass over the `one-sided-derivatives` section. One Lean
statement per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition

namespace LRA.Analysis.Differentiation

/-- `def:left-hand-derivative`.

Logical form:

```lean
def LeftDerivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c →
    |(f x - f c) / (x - c) - D| < ε
```
-/
def LeftDerivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c →
    |(f x - f c) / (x - c) - D| < ε

/-- `def:right-hand-derivative`.

Logical form:

```lean
def RightDerivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ →
    |(f x - f c) / (x - c) - D| < ε
```
-/
def RightDerivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ →
    |(f x - f c) / (x - c) - D| < ε

-- `thm:differentiability-and-one-sided-derivatives`
/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ`. Then `IsDifferentiable f A c ↔ ∃ D, LeftDerivative
D f A c ∧ RightDerivative D f A c`.

Logical form:

```lean
theorem DifferentiableIffOneSidedDerivativesAgree (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    IsDifferentiable f A c ↔
      ∃ D, LeftDerivative D f A c ∧ RightDerivative D f A c
```
-/
theorem DifferentiableIffOneSidedDerivativesAgree (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    IsDifferentiable f A c ↔
      ∃ D, LeftDerivative D f A c ∧ RightDerivative D f A c := by
  sorry

end LRA.Analysis.Differentiation
