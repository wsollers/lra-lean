/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/differentiation/notes/derivative-definition/notes-derivative-definition.tex.

Full-coverage pass over the `derivative-definition` section. One Lean
statement per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic
import LRA.VolumeIII.Analysis.Continuity.PointContinuity

namespace LRA.VolumeIII.Analysis.Differentiation

/-- `def:derivative-at-a-point` (`h`-form): the ε-δ definition of the
derivative of `f` at `c`, `c` a limit point of `A`. -/
def Derivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ h : ℝ, c + h ∈ A → 0 < |h| → |h| < δ →
    |(f (c + h) - f c) / h - D| < ε

/-- `IsDifferentiable`: existential wrapper used throughout the chapter's
hypotheses (`IsDifferentiable(f,c,ℝ,ℝ)` in the book's Predicate-reading
convention). -/
def IsDifferentiable (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ D, Derivative D f A c

/-- `def:topological-definition-of-derivative-at-a-point`: the same
condition phrased via neighbourhoods of `c` rather than an explicit `δ`. -/
def DerivativeTop (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ U : Set ℝ, (∃ δ > 0, U = LRA.VolumeIII.Analysis.Continuity.RelativeNeighborhood A c δ) ∧
    ∀ x ∈ U, x ≠ c → |(f x - f c) / (x - c) - D| < ε

/-- `def:sequential-definition-of-derivative-at-a-point`: the sequential
characterization — every sequence in `A \ {c}` converging to `c` produces
difference quotients converging to `D`. -/
def DerivativeSeq (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ A) → (∀ n, xs n ≠ c) →
    (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε) →
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |(f (xs n) - f c) / (xs n - c) - D| < ε

-- `thm:derivative-equivalence`
/-- the ε-δ, topological, and sequential
definitions of the derivative all agree. -/
theorem DerivativeEquivalence (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    Derivative D f A c ↔ DerivativeTop D f A c ∧ DerivativeSeq D f A c := by
  sorry

/-- `prop:derivative-h-form-equivalence`: the `h`-form
`(f(c+h)-f(c))/h → D` as `h → 0` agrees with the `x`-form
`(f(x)-f(c))/(x-c) → D` as `x → c`. -/
theorem DerivativeHFormEquivalence (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    Derivative D f A c ↔
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ →
        |(f x - f c) / (x - c) - D| < ε) := by
  sorry

-- `thm:differentiable-implies-continuous`
/-- The theorem states that differentiable implies continuous. -/
theorem DifferentiableImpliesContinuous (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : IsDifferentiable f A c) :
    LRA.VolumeIII.Analysis.Continuity.ContinuousAtPoint f A c := by
  sorry

-- `thm:uniqueness-of-the-derivative`
/-- The theorem states the uniqueness of the derivative assertion. -/
theorem DerivativeUnique (f : ℝ → ℝ) (A : Set ℝ) (c D₁ D₂ : ℝ)
    (h₁ : Derivative D₁ f A c) (h₂ : Derivative D₂ f A c) : D₁ = D₂ := by
  sorry

end LRA.VolumeIII.Analysis.Differentiation
