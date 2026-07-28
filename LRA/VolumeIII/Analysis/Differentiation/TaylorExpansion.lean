/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/differentiation/notes/taylor-expansion/{notes-taylor-expansion.tex,
notes-differential.tex}.

Full-coverage pass over the `taylor-expansion` section (the chapter's
final section) — Taylor polynomials, Lagrange and Peano remainders, the
flat-function analyticity separator, and the differential/tangent-map
reframing that seeds differential geometry. One Lean statement per book
label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Exp
import LRA.VolumeIII.Analysis.Differentiation.DerivativeDefinition
import LRA.VolumeIII.Analysis.Differentiation.ChainRule
import LRA.VolumeIII.Analysis.Differentiation.GraphReading
import LRA.VolumeIII.Analysis.Differentiation.AlgebraOfDerivatives

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Differentiation

-- ---------------------------------------------------------------------
-- Taylor: construction and error.
-- ---------------------------------------------------------------------

/-- `def:taylor-polynomial-at-a-point`. -/
noncomputable def TaylorPoly (fD : ℕ → ℝ → ℝ) (n : ℕ) (a : ℝ) : ℝ → ℝ :=
  fun x => ∑ k ∈ Finset.range (n + 1), fD k a / (Nat.factorial k) * (x - a) ^ k

/-- `def:taylor-remainder`. -/
noncomputable def TaylorRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (n : ℕ) (a : ℝ) : ℝ → ℝ :=
  fun x => f x - TaylorPoly fD n a x

/-- `def:maclaurin-polynomial`: the Taylor polynomial centered at `0`. -/
noncomputable def MaclaurinPoly (fD : ℕ → ℝ → ℝ) (n : ℕ) : ℝ → ℝ :=
  TaylorPoly fD n 0

/-- `thm:taylor-theorem-lagrange-remainder`. -/
theorem TaylorTheoremLagrangeRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (a b : ℝ)
    (hab : a < b) (n : ℕ)
    (hcont : ∀ k ≤ n, LRA.VolumeIII.Analysis.Continuity.ContinuousOn' (fD k) (Set.Icc a b))
    (hDnp1 : ∀ x ∈ Set.Ioo a b, ∃ D, Derivative D (fD n) (Set.Ioo a b) x) :
    ∀ x ∈ Set.Ioo a b, ∃ c, (a < c ∧ c < x) ∧ ∃ Dnp1,
      Derivative Dnp1 (fD n) (Set.Ioo a b) c ∧
      f x = TaylorPoly fD n a x + Dnp1 / (Nat.factorial (n + 1)) * (x - a) ^ (n + 1) := by
  sorry

/-- `cor:taylor-expansion-peano-remainder`. -/
theorem TaylorExpansionPeanoRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) (a : ℝ)
    (n : ℕ) (ha : a ∈ interior I) (hD : HigherDerivativeAt f fD I n a)
    (hcont : LRA.VolumeIII.Analysis.Continuity.ContinuousAtPoint (fD n) I a) :
    Filter.Tendsto (fun x => (f x - TaylorPoly fD n a x) / (x - a) ^ n)
      (nhdsWithin a {a}ᶜ) (nhds 0) := by
  sorry

/-- `cor:first-order-peano-remainder`. -/
theorem FirstOrderPeanoRemainder (f : ℝ → ℝ) (A : Set ℝ) (c D : ℝ)
    (hf : Derivative D f A c) :
    Filter.Tendsto (fun h => (f (c + h) - f c - D * h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0) := by
  sorry

/-- `prop:flat-function`: the classic flat function separating
`C^∞` from `C^ω`, restated in Lean via its three defining properties. -/
noncomputable def FlatFunction : ℝ → ℝ := fun x => if x = 0 then 0 else Real.exp (-1 / x ^ 2)

theorem FlatFunctionProperties (fD : ℕ → ℝ → ℝ) (hfD0 : fD 0 = FlatFunction) :
    IsClassCInfty FlatFunction fD Set.univ ∧
    (∀ n : ℕ, fD n 0 = 0) ∧
    ¬ IsClassCOmega FlatFunction fD Set.univ := by
  sorry

-- ---------------------------------------------------------------------
-- The Differential (`notes-differential.tex`).
-- ---------------------------------------------------------------------

/-- `def:differentiability-by-a-differential`: differentiability recast
as the existence of a first-order linear map `L` with `o(h)` error. -/
def DifferentiableByDifferential (f : ℝ → ℝ) (c : ℝ) : Prop :=
  ∃ L : ℝ →ₗ[ℝ] ℝ,
    Filter.Tendsto (fun h => (f (c + h) - f c - L h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)

/-- `thm:differential-and-derivative-agree`. -/
theorem DifferentialAndDerivativeAgree (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    IsDifferentiable f A c ↔ DifferentiableByDifferential f c := by
  sorry

/-- `thm:uniqueness-of-the-differential`. -/
theorem UniquenessOfTheDifferential (f : ℝ → ℝ) (c : ℝ) (L₁ L₂ : ℝ →ₗ[ℝ] ℝ)
    (h₁ : Filter.Tendsto (fun h => (f (c + h) - f c - L₁ h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0))
    (h₂ : Filter.Tendsto (fun h => (f (c + h) - f c - L₂ h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)) :
    L₁ = L₂ := by
  sorry

/-- `thm:differential-continuity-criterion`. -/
theorem DifferentialContinuityCriterion (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : DifferentiableByDifferential f c) :
    LRA.VolumeIII.Analysis.Continuity.ContinuousAtPoint f A c := by
  sorry

/-- `thm:chain-rule-for-differentials`: the tangent-map composition law,
the one-dimensional prototype for `T_cf : T_cM → T_{f(c)}N` on a
manifold — directly relevant to the tangent-space bookkeeping needed for
Brownian motion on a torus. -/
theorem ChainRuleForDifferentials (f g : ℝ → ℝ) (c : ℝ)
    (hf : DifferentiableByDifferential f c) (hg : DifferentiableByDifferential g (f c)) :
    DifferentiableByDifferential (fun x => g (f x)) c := by
  sorry

/-- `thm:linearity-of-the-differential`. -/
theorem LinearityOfTheDifferential (f g : ℝ → ℝ) (c α β : ℝ)
    (hf : DifferentiableByDifferential f c) (hg : DifferentiableByDifferential g c) :
    DifferentiableByDifferential (fun x => α * f x + β * g x) c := by
  sorry

end Differentiation
end Analysis
end VolumeIII
end LRA
