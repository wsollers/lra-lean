/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/continuity/notes/approximation/notes-approximation.tex.

Full-coverage pass over the `approximation` section. One Lean statement
per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Analysis.Polynomial.Basic
import LRA.VolumeIII.Analysis.Continuity.GlobalTheorems

namespace LRA.VolumeIII.Analysis.Continuity

/-- A step function on `[a,b]`: constant on each cell of some finite
partition. -/
def IsStepFunction (f : ℝ → ℝ) (a b : ℝ) : Prop :=
  ∃ (n : ℕ) (P : Fin (n + 1) → ℝ) (v : Fin n → ℝ),
    P 0 = a ∧ P (Fin.last n) = b ∧ (∀ i : Fin n, P i.castSucc < P i.succ) ∧
    ∀ i : Fin n, ∀ x ∈ Set.Ioo (P i.castSucc) (P i.succ), f x = v i

/-- `thm:step-function-approximation`: continuous functions on `[a,b]`
are uniformly approximable by step functions. -/
theorem StepFunctionApproximation (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∀ ε > 0, ∃ g : ℝ → ℝ, IsStepFunction g a b ∧
      ∀ x ∈ Set.Icc a b, |f x - g x| < ε := by
  sorry

/-- `def:piecewise-linear-function`: continuous and affine on each cell
of a finite partition. -/
def IsPiecewiseLinear (f : ℝ → ℝ) (a b : ℝ) : Prop :=
  ∃ (n : ℕ) (P : Fin (n + 1) → ℝ), P 0 = a ∧ P (Fin.last n) = b ∧
    (∀ i : Fin n, P i.castSucc < P i.succ) ∧
    ContinuousOn' f (Set.Icc a b) ∧
    ∀ i : Fin n, ∃ m c : ℝ, ∀ x ∈ Set.Icc (P i.castSucc) (P i.succ), f x = m * x + c

/-- `thm:piecewise-linear-approximation`: continuous functions on `[a,b]`
are uniformly approximable by piecewise-linear functions. -/
theorem PiecewiseLinearApproximation (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∀ ε > 0, ∃ g : ℝ → ℝ, IsPiecewiseLinear g a b ∧
      ∀ x ∈ Set.Icc a b, |f x - g x| < ε := by
  sorry

/-- `thm:weierstrass-approximation`: continuous functions on `[a,b]` are
uniformly approximable by polynomials. -/
theorem WeierstrassApproximation (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∀ ε > 0, ∃ p : Polynomial ℝ, ∀ x ∈ Set.Icc a b, |f x - p.eval x| < ε := by
  sorry

/-- `def:bernstein-polynomial`: the degree-`n` Bernstein polynomial of
`f` on `[0,1]`. -/
noncomputable def BernsteinPolynomial (f : ℝ → ℝ) (n : ℕ) : Polynomial ℝ :=
  ∑ k ∈ Finset.range (n + 1),
    Polynomial.C (f (k / n : ℝ)) *
      (Polynomial.C ((n.choose k : ℝ))) *
      Polynomial.X ^ k * (1 - Polynomial.X) ^ (n - k)

/-- `thm:bernstein-approximation`: the Bernstein polynomials of a
continuous `f : [0,1] → ℝ` converge uniformly to `f`, giving a
constructive proof of Weierstrass approximation on `[0,1]`. -/
theorem BernsteinApproximation (f : ℝ → ℝ) (hf : ContinuousOn' f (Set.Icc 0 1)) :
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, ∀ x ∈ Set.Icc (0:ℝ) 1,
      |f x - (BernsteinPolynomial f n).eval x| < ε := by
  sorry

end LRA.VolumeIII.Analysis.Continuity
