/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/differentiation/notes/derivative-definition/notes-derivative-definition.tex.

Full-coverage pass over the `derivative-definition` section. One Lean
statement per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic
import LRA.VolumeIII.Analysis.Continuity.Limits
import LRA.VolumeIII.Analysis.Continuity.PointContinuity

namespace LRA.Analysis.Differentiation

/-- `def:derivative-at-a-point` (`h`-form): the ε-δ definition of the
derivative of `f` at `c`, `c` a limit point of `A`.

Logical form:

```lean
def Derivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ h : ℝ, c + h ∈ A → 0 < |h| → |h| < δ →
    |(f (c + h) - f c) / h - D| < ε
```
-/
def Derivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ h : ℝ, c + h ∈ A → 0 < |h| → |h| < δ →
    |(f (c + h) - f c) / h - D| < ε

/-- Zorich-style derivative definition: near `c`, the increment of `f`
is a linear principal part `D * (x - c)` plus a remainder
`α x * (x - c)`, where `α x → 0` as `x → c` along `A`.

Logical form:

```lean
def ZorichDerivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ α : ℝ → ℝ,
    LRA.Analysis.Continuity.TendsTo α A c 0 ∧
      ∀ x ∈ A, f x = f c + D * (x - c) + α x * (x - c)
```
-/
def ZorichDerivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ α : ℝ → ℝ,
    LRA.Analysis.Continuity.TendsTo α A c 0 ∧
      ∀ x ∈ A, f x = f c + D * (x - c) + α x * (x - c)

/-- `IsDifferentiable`: existential wrapper used throughout the chapter's
hypotheses (`IsDifferentiable(f,c,ℝ,ℝ)` in the book's Predicate-reading
convention).

Logical form:

```lean
def IsDifferentiable (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ D, Derivative D f A c
```
-/
def IsDifferentiable (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ D, Derivative D f A c

/-- `def:topological-definition-of-derivative-at-a-point`: the same
condition phrased via neighbourhoods of `c` rather than an explicit `δ`.

Logical form:

```lean
def DerivativeTop (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ U : Set ℝ, (∃ δ > 0, U = LRA.Analysis.Continuity.RelativeNeighborhood A c δ) ∧
    ∀ x ∈ U, x ≠ c → |(f x - f c) / (x - c) - D| < ε
```
-/
def DerivativeTop (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ U : Set ℝ, (∃ δ > 0, U = LRA.Analysis.Continuity.RelativeNeighborhood A c δ) ∧
    ∀ x ∈ U, x ≠ c → |(f x - f c) / (x - c) - D| < ε

/-- `def:sequential-definition-of-derivative-at-a-point`: the sequential
characterization — every sequence in `A \ {c}` converging to `c` produces
difference quotients converging to `D`.

Logical form:

```lean
def DerivativeSeq (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ A) → (∀ n, xs n ≠ c) →
    (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε) →
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |(f (xs n) - f c) / (xs n - c) - D| < ε
```
-/
def DerivativeSeq (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ A) → (∀ n, xs n ≠ c) →
    (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε) →
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |(f (xs n) - f c) / (xs n - c) - D| < ε

-- `thm:derivative-equivalence`
/-- Let `D : ℝ`, `A : Set ℝ`, and `c : ℝ`. If `f : ℝ → ℝ`. Then `Derivative D f A c ↔ DerivativeTop
D f A c ∧ DerivativeSeq D f A c`.

Logical form:

```lean
theorem DerivativeEquivalence (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    Derivative D f A c ↔ DerivativeTop D f A c ∧ DerivativeSeq D f A c
```
-/
theorem DerivativeEquivalence (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    Derivative D f A c ↔ DerivativeTop D f A c ∧ DerivativeSeq D f A c := by
  sorry

/-- Let `D : ℝ`, `A : Set ℝ`, and `c : ℝ`. If `f : ℝ → ℝ`. Then `Derivative D f A c ↔ (∀ ε > 0, ∃ δ
> 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |(f x - f c) / (x - c) - D| < ε)`.

Logical form:

```lean
theorem DerivativeHFormEquivalence (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    Derivative D f A c ↔
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ →
        |(f x - f c) / (x - c) - D| < ε)
```
-/
theorem DerivativeHFormEquivalence (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    Derivative D f A c ↔
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ →
        |(f x - f c) / (x - c) - D| < ε) := by
  sorry

-- `thm:differentiable-implies-continuous`
/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ` and `h : IsDifferentiable f A c`. Then
`LRA.Analysis.Continuity.ContinuousAtPoint f A c`.

Logical form:

```lean
theorem DifferentiableImpliesContinuous (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : IsDifferentiable f A c) :
    LRA.Analysis.Continuity.ContinuousAtPoint f A c
```
-/
theorem DifferentiableImpliesContinuous (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : IsDifferentiable f A c) :
    LRA.Analysis.Continuity.ContinuousAtPoint f A c := by
  sorry

-- `thm:uniqueness-of-the-derivative`
/-- Let `A : Set ℝ` and `c D₁ D₂ : ℝ`. If `f : ℝ → ℝ`, `h₁ : Derivative D₁ f A c`, and `h₂ :
Derivative D₂ f A c`. Then `D₁ = D₂`.

Logical form:

```lean
theorem DerivativeUnique (f : ℝ → ℝ) (A : Set ℝ) (c D₁ D₂ : ℝ)
    (h₁ : Derivative D₁ f A c) (h₂ : Derivative D₂ f A c) : D₁ = D₂
```
-/
theorem DerivativeUnique (f : ℝ → ℝ) (A : Set ℝ) (c D₁ D₂ : ℝ)
    (h₁ : Derivative D₁ f A c) (h₂ : Derivative D₂ f A c) : D₁ = D₂ := by
  sorry

end LRA.Analysis.Differentiation
