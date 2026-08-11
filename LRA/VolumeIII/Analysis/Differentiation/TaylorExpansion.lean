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

namespace LRA.VolumeIII.Analysis.Differentiation

-- ---------------------------------------------------------------------
-- Taylor: construction and error.
-- ---------------------------------------------------------------------

/-- `def:taylor-polynomial-at-a-point`.

Logical form:

```lean
noncomputable def TaylorPoly (fD : ℕ → ℝ → ℝ) (n : ℕ) (a : ℝ) : ℝ → ℝ :=
  fun x => ∑ k ∈ Finset.range (n + 1), fD k a / (Nat.factorial k) * (x - a) ^ k
```
-/
noncomputable def TaylorPoly (fD : ℕ → ℝ → ℝ) (n : ℕ) (a : ℝ) : ℝ → ℝ :=
  fun x => ∑ k ∈ Finset.range (n + 1), fD k a / (Nat.factorial k) * (x - a) ^ k

/-- `def:taylor-remainder`.

Logical form:

```lean
noncomputable def TaylorRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (n : ℕ) (a : ℝ) : ℝ → ℝ :=
  fun x => f x - TaylorPoly fD n a x
```
-/
noncomputable def TaylorRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (n : ℕ) (a : ℝ) : ℝ → ℝ :=
  fun x => f x - TaylorPoly fD n a x

/-- `def:maclaurin-polynomial`: the Taylor polynomial centered at `0`.

Logical form:

```lean
noncomputable def MaclaurinPoly (fD : ℕ → ℝ → ℝ) (n : ℕ) : ℝ → ℝ :=
  TaylorPoly fD n 0
```
-/
noncomputable def MaclaurinPoly (fD : ℕ → ℝ → ℝ) (n : ℕ) : ℝ → ℝ :=
  TaylorPoly fD n 0

-- `thm:taylor-theorem-lagrange-remainder`
/-- Let `a b : ℝ` and `n : ℕ`. If `f : ℝ → ℝ`, `fD : ℕ → ℝ → ℝ`, `hab : a < b`, `hcont : ∀ k ≤ n,
LRA.VolumeIII.Analysis.Continuity.ContinuousOn' (fD k) (Set.Icc a b)`, and `hDnp1 : ∀ x ∈
Set.Ioo a b, ∃ D, Derivative D (fD n) (Set.Ioo a b) x`. Then `∀ x ∈ Set.Ioo a b, ∃ c, (a < c ∧ c
< x) ∧ ∃ Dnp1, Derivative Dnp1 (fD n) (Set.Ioo a b) c ∧ f x = TaylorPoly fD n a x + Dnp1 /
(Nat.factorial (n + 1)) * (x - a) ^ (n + 1)`.

Logical form:

```lean
theorem TaylorTheoremLagrangeRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (a b : ℝ)
    (hab : a < b) (n : ℕ)
    (hcont : ∀ k ≤ n, LRA.VolumeIII.Analysis.Continuity.ContinuousOn' (fD k) (Set.Icc a b))
    (hDnp1 : ∀ x ∈ Set.Ioo a b, ∃ D, Derivative D (fD n) (Set.Ioo a b) x) :
    ∀ x ∈ Set.Ioo a b, ∃ c, (a < c ∧ c < x) ∧ ∃ Dnp1,
      Derivative Dnp1 (fD n) (Set.Ioo a b) c ∧
      f x = TaylorPoly fD n a x + Dnp1 / (Nat.factorial (n + 1)) * (x - a) ^ (n + 1)
```
-/
theorem TaylorTheoremLagrangeRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (a b : ℝ)
    (hab : a < b) (n : ℕ)
    (hcont : ∀ k ≤ n, LRA.VolumeIII.Analysis.Continuity.ContinuousOn' (fD k) (Set.Icc a b))
    (hDnp1 : ∀ x ∈ Set.Ioo a b, ∃ D, Derivative D (fD n) (Set.Ioo a b) x) :
    ∀ x ∈ Set.Ioo a b, ∃ c, (a < c ∧ c < x) ∧ ∃ Dnp1,
      Derivative Dnp1 (fD n) (Set.Ioo a b) c ∧
      f x = TaylorPoly fD n a x + Dnp1 / (Nat.factorial (n + 1)) * (x - a) ^ (n + 1) := by
  sorry

/-- Let `I : Set ℝ`, `a : ℝ`, and `n : ℕ`. If `f : ℝ → ℝ`, `fD : ℕ → ℝ → ℝ`, `ha : a ∈ interior I`,
`hD : HigherDerivativeAt f fD I n a`, and `hcont :
LRA.VolumeIII.Analysis.Continuity.ContinuousAtPoint (fD n) I a`. Then `Filter.Tendsto (fun x =>
(f x - TaylorPoly fD n a x) / (x - a) ^ n) (nhdsWithin a {a}ᶜ) (nhds 0)`.

Logical form:

```lean
theorem TaylorExpansionPeanoRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) (a : ℝ)
    (n : ℕ) (ha : a ∈ interior I) (hD : HigherDerivativeAt f fD I n a)
    (hcont : LRA.VolumeIII.Analysis.Continuity.ContinuousAtPoint (fD n) I a) :
    Filter.Tendsto (fun x => (f x - TaylorPoly fD n a x) / (x - a) ^ n)
      (nhdsWithin a {a}ᶜ) (nhds 0)
```
-/
theorem TaylorExpansionPeanoRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) (a : ℝ)
    (n : ℕ) (ha : a ∈ interior I) (hD : HigherDerivativeAt f fD I n a)
    (hcont : LRA.VolumeIII.Analysis.Continuity.ContinuousAtPoint (fD n) I a) :
    Filter.Tendsto (fun x => (f x - TaylorPoly fD n a x) / (x - a) ^ n)
      (nhdsWithin a {a}ᶜ) (nhds 0) := by
  sorry

/-- Let `A : Set ℝ` and `c D : ℝ`. If `f : ℝ → ℝ` and `hf : Derivative D f A c`. Then
`Filter.Tendsto (fun h => (f (c + h) - f c - D * h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)`.

Logical form:

```lean
theorem FirstOrderPeanoRemainder (f : ℝ → ℝ) (A : Set ℝ) (c D : ℝ)
    (hf : Derivative D f A c) :
    Filter.Tendsto (fun h => (f (c + h) - f c - D * h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)
```
-/
theorem FirstOrderPeanoRemainder (f : ℝ → ℝ) (A : Set ℝ) (c D : ℝ)
    (hf : Derivative D f A c) :
    Filter.Tendsto (fun h => (f (c + h) - f c - D * h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0) := by
  sorry

/-- `prop:flat-function`: the classic flat function separating
`C^∞` from `C^ω`, restated in Lean via its three defining properties.

Logical form:

```lean
noncomputable def FlatFunction : ℝ → ℝ := fun x => if x = 0 then 0 else Real.exp (-1 / x ^ 2)
```
-/
noncomputable def FlatFunction : ℝ → ℝ := fun x => if x = 0 then 0 else Real.exp (-1 / x ^ 2)

/-- If `fD : ℕ → ℝ → ℝ` and `hfD0 : fD 0 = FlatFunction`. Then `IsClassCInfty FlatFunction fD
Set.univ ∧ (∀ n : ℕ, fD n 0 = 0) ∧ ¬ IsClassCOmega FlatFunction fD Set.univ`.

Logical form:

```lean
theorem FlatFunctionProperties (fD : ℕ → ℝ → ℝ) (hfD0 : fD 0 = FlatFunction) :
    IsClassCInfty FlatFunction fD Set.univ ∧
    (∀ n : ℕ, fD n 0 = 0) ∧
    ¬ IsClassCOmega FlatFunction fD Set.univ
```
-/
theorem FlatFunctionProperties (fD : ℕ → ℝ → ℝ) (hfD0 : fD 0 = FlatFunction) :
    IsClassCInfty FlatFunction fD Set.univ ∧
    (∀ n : ℕ, fD n 0 = 0) ∧
    ¬ IsClassCOmega FlatFunction fD Set.univ := by
  sorry

-- ---------------------------------------------------------------------
-- The Differential (`notes-differential.tex`).
-- ---------------------------------------------------------------------

/-- `def:differentiability-by-a-differential`: differentiability recast
as the existence of a first-order linear map `L` with `o(h)` error.

Logical form:

```lean
def DifferentiableByDifferential (f : ℝ → ℝ) (c : ℝ) : Prop :=
  ∃ L : ℝ →ₗ[ℝ] ℝ,
    Filter.Tendsto (fun h => (f (c + h) - f c - L h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)
```
-/
def DifferentiableByDifferential (f : ℝ → ℝ) (c : ℝ) : Prop :=
  ∃ L : ℝ →ₗ[ℝ] ℝ,
    Filter.Tendsto (fun h => (f (c + h) - f c - L h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)

-- `thm:differential-and-derivative-agree`
/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ`. Then `IsDifferentiable f A c ↔
DifferentiableByDifferential f c`.

Logical form:

```lean
theorem DifferentialAndDerivativeAgree (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    IsDifferentiable f A c ↔ DifferentiableByDifferential f c
```
-/
theorem DifferentialAndDerivativeAgree (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    IsDifferentiable f A c ↔ DifferentiableByDifferential f c := by
  sorry

-- `thm:uniqueness-of-the-differential`
/-- Let `c : ℝ`. If `f : ℝ → ℝ`, `L₁ L₂ : ℝ →ₗ[ℝ] ℝ`, `h₁ : Filter.Tendsto (fun h => (f (c + h) - f
c - L₁ h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)`, and `h₂ : Filter.Tendsto (fun h => (f (c + h) - f
c - L₂ h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)`. Then `L₁ = L₂`.

Logical form:

```lean
theorem UniquenessOfTheDifferential (f : ℝ → ℝ) (c : ℝ) (L₁ L₂ : ℝ →ₗ[ℝ] ℝ)
    (h₁ : Filter.Tendsto (fun h => (f (c + h) - f c - L₁ h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0))
    (h₂ : Filter.Tendsto (fun h => (f (c + h) - f c - L₂ h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)) :
    L₁ = L₂
```
-/
theorem UniquenessOfTheDifferential (f : ℝ → ℝ) (c : ℝ) (L₁ L₂ : ℝ →ₗ[ℝ] ℝ)
    (h₁ : Filter.Tendsto (fun h => (f (c + h) - f c - L₁ h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0))
    (h₂ : Filter.Tendsto (fun h => (f (c + h) - f c - L₂ h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)) :
    L₁ = L₂ := by
  sorry

-- `thm:differential-continuity-criterion`
/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ` and `h : DifferentiableByDifferential f c`. Then
`LRA.VolumeIII.Analysis.Continuity.ContinuousAtPoint f A c`.

Logical form:

```lean
theorem DifferentialContinuityCriterion (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : DifferentiableByDifferential f c) :
    LRA.VolumeIII.Analysis.Continuity.ContinuousAtPoint f A c
```
-/
theorem DifferentialContinuityCriterion (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : DifferentiableByDifferential f c) :
    LRA.VolumeIII.Analysis.Continuity.ContinuousAtPoint f A c := by
  sorry

-- `thm:chain-rule-for-differentials`
/-- Let `c : ℝ`. If `f g : ℝ → ℝ`, `hf : DifferentiableByDifferential f c`, and `hg :
DifferentiableByDifferential g (f c)`. Then `DifferentiableByDifferential (fun x => g (f x)) c`.

Logical form:

```lean
theorem ChainRuleForDifferentials (f g : ℝ → ℝ) (c : ℝ)
    (hf : DifferentiableByDifferential f c) (hg : DifferentiableByDifferential g (f c)) :
    DifferentiableByDifferential (fun x => g (f x)) c
```
-/
theorem ChainRuleForDifferentials (f g : ℝ → ℝ) (c : ℝ)
    (hf : DifferentiableByDifferential f c) (hg : DifferentiableByDifferential g (f c)) :
    DifferentiableByDifferential (fun x => g (f x)) c := by
  sorry

-- `thm:linearity-of-the-differential`
/-- Let `c α β : ℝ`. If `f g : ℝ → ℝ`, `hf : DifferentiableByDifferential f c`, and `hg :
DifferentiableByDifferential g c`. Then `DifferentiableByDifferential (fun x => α * f x + β * g
x) c`.

Logical form:

```lean
theorem LinearityOfTheDifferential (f g : ℝ → ℝ) (c α β : ℝ)
    (hf : DifferentiableByDifferential f c) (hg : DifferentiableByDifferential g c) :
    DifferentiableByDifferential (fun x => α * f x + β * g x) c
```
-/
theorem LinearityOfTheDifferential (f g : ℝ → ℝ) (c α β : ℝ)
    (hf : DifferentiableByDifferential f c) (hg : DifferentiableByDifferential g c) :
    DifferentiableByDifferential (fun x => α * f x + β * g x) c := by
  sorry

end LRA.VolumeIII.Analysis.Differentiation
