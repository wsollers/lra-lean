/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/differentiation/notes/algebra-of-derivatives/{notes-computation-intro.tex,
notes-algebra-of-derivatives.tex, notes-inverse-function.tex, notes-lhopital.tex}.

Full-coverage pass over the `algebra-of-derivatives` section. One Lean
statement per book label, `sorry`-bodied. Pointwise rules use a single
canonical `Derivative D f A c` signature throughout (ISSUES.md #64 tracks
the book's own drift between a 5-arg and a 3-arg convention within this
same section — not reproduced here).
-/

import Mathlib.Data.Real.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition
import LRA.Analysis.Differentiation.MeanValueTheorem
import LRA.Analysis.Differentiation.GraphReading
import LRA.Analysis.Limits

namespace LRA.Analysis.Differentiation

variable {f g : ℝ → ℝ} {A : Set ℝ} {c Df Dg α : ℝ}

-- `thm:constant-multiple-rule`
/-- Let `α : ℝ`. If `hf : Derivative Df f A c`. Then `Derivative (α * Df) (fun x => α * f x) A c`.

Logical form:

```lean
theorem ConstantMultipleRule (hf : Derivative Df f A c) (α : ℝ) :
    Derivative (α * Df) (fun x => α * f x) A c
```
-/
theorem ConstantMultipleRule (hf : Derivative Df f A c) (α : ℝ) :
    Derivative (α * Df) (fun x => α * f x) A c := by
  sorry

-- `thm:sum-rule`
/-- If `hf : Derivative Df f A c` and `hg : Derivative Dg g A c`. Then `Derivative (Df + Dg) (fun x
=> f x + g x) A c`.

Logical form:

```lean
theorem SumRule (hf : Derivative Df f A c) (hg : Derivative Dg g A c) :
    Derivative (Df + Dg) (fun x => f x + g x) A c
```
-/
theorem SumRule (hf : Derivative Df f A c) (hg : Derivative Dg g A c) :
    Derivative (Df + Dg) (fun x => f x + g x) A c := by
  sorry

-- `thm:product-rule`
/-- If `hf : Derivative Df f A c` and `hg : Derivative Dg g A c`. Then `Derivative (Df * g c + f c *
Dg) (fun x => f x * g x) A c`.

Logical form:

```lean
theorem ProductRule (hf : Derivative Df f A c) (hg : Derivative Dg g A c) :
    Derivative (Df * g c + f c * Dg) (fun x => f x * g x) A c
```
-/
theorem ProductRule (hf : Derivative Df f A c) (hg : Derivative Dg g A c) :
    Derivative (Df * g c + f c * Dg) (fun x => f x * g x) A c := by
  sorry

-- `thm:quotient-rule`
/-- If `hf : Derivative Df f A c`, `hg : Derivative Dg g A c`, and `hgc : g c ≠ 0`. Then `Derivative
((Df * g c - f c * Dg) / (g c) ^ 2) (fun x => f x / g x) A c`.

Logical form:

```lean
theorem QuotientRule (hf : Derivative Df f A c) (hg : Derivative Dg g A c)
    (hgc : g c ≠ 0) :
    Derivative ((Df * g c - f c * Dg) / (g c) ^ 2) (fun x => f x / g x) A c
```
-/
theorem QuotientRule (hf : Derivative Df f A c) (hg : Derivative Dg g A c)
    (hgc : g c ≠ 0) :
    Derivative ((Df * g c - f c * Dg) / (g c) ^ 2) (fun x => f x / g x) A c := by
  sorry

/-- Let `n : ℕ`. If `fs : Fin n → ℝ → ℝ`, `αs : Fin n → ℝ`, `Ds : Fin n → ℝ`, and `hfs : ∀ i,
Derivative (Ds i) (fs i) A c`. Then `Derivative (∑ i, αs i * Ds i) (fun x => ∑ i, αs i * fs i x)
A c`.

Logical form:

```lean
theorem FiniteSumRule (n : ℕ) (fs : Fin n → ℝ → ℝ) (αs : Fin n → ℝ) (Ds : Fin n → ℝ)
    (hfs : ∀ i, Derivative (Ds i) (fs i) A c) :
    Derivative (∑ i, αs i * Ds i) (fun x => ∑ i, αs i * fs i x) A c
```
-/
theorem FiniteSumRule (n : ℕ) (fs : Fin n → ℝ → ℝ) (αs : Fin n → ℝ) (Ds : Fin n → ℝ)
    (hfs : ∀ i, Derivative (Ds i) (fs i) A c) :
    Derivative (∑ i, αs i * Ds i) (fun x => ∑ i, αs i * fs i x) A c := by
  sorry

/-- Let `n : ℕ`. If `fs : Fin n → ℝ → ℝ`, `Ds : Fin n → ℝ`, and `hfs : ∀ i, Derivative (Ds i) (fs i)
A c`. Then `Derivative (∑ k, Ds k * ∏ i ∈ Finset.univ.erase k, fs i c) (fun x => ∏ i, fs i x) A
c`.

Logical form:

```lean
theorem ExtendedProductRule (n : ℕ) (fs : Fin n → ℝ → ℝ) (Ds : Fin n → ℝ)
    (hfs : ∀ i, Derivative (Ds i) (fs i) A c) :
    Derivative (∑ k, Ds k * ∏ i ∈ Finset.univ.erase k, fs i c)
      (fun x => ∏ i, fs i x) A c
```
-/
theorem ExtendedProductRule (n : ℕ) (fs : Fin n → ℝ → ℝ) (Ds : Fin n → ℝ)
    (hfs : ∀ i, Derivative (Ds i) (fs i) A c) :
    Derivative (∑ k, Ds k * ∏ i ∈ Finset.univ.erase k, fs i c)
      (fun x => ∏ i, fs i x) A c := by
  sorry

/-- Let `n : ℕ`. If `hf : Derivative Df f A c`. Then `Derivative (n * (f c) ^ (n - 1) * Df) (fun x
=> (f x) ^ n) A c`.

Logical form:

```lean
theorem PowerRuleSpecialCase (hf : Derivative Df f A c) (n : ℕ) :
    Derivative (n * (f c) ^ (n - 1) * Df) (fun x => (f x) ^ n) A c
```
-/
theorem PowerRuleSpecialCase (hf : Derivative Df f A c) (n : ℕ) :
    Derivative (n * (f c) ^ (n - 1) * Df) (fun x => (f x) ^ n) A c := by
  sorry

-- `thm:finite-linear-combination-rule`
/-- Let `n : ℕ`. If `fs : Fin n → ℝ → ℝ`, `αs : Fin n → ℝ`, `Ds : Fin n → ℝ`, and `hfs : ∀ i,
Derivative (Ds i) (fs i) A c`. Then `Derivative (∑ i, αs i * Ds i) (fun x => ∑ i, αs i * fs i x)
A c`.

Logical form:

```lean
theorem FiniteLinearCombinationRule (n : ℕ) (fs : Fin n → ℝ → ℝ) (αs : Fin n → ℝ)
    (Ds : Fin n → ℝ) (hfs : ∀ i, Derivative (Ds i) (fs i) A c) :
    Derivative (∑ i, αs i * Ds i) (fun x => ∑ i, αs i * fs i x) A c
```
-/
theorem FiniteLinearCombinationRule (n : ℕ) (fs : Fin n → ℝ → ℝ) (αs : Fin n → ℝ)
    (Ds : Fin n → ℝ) (hfs : ∀ i, Derivative (Ds i) (fs i) A c) :
    Derivative (∑ i, αs i * Ds i) (fun x => ∑ i, αs i * fs i x) A c := by
  sorry

-- The eight "on an Interval" global forms are the pointwise rules above
-- applied at every point of `I`; per the book's own Interpretation
-- remark ("not separate theorems"), they are recorded as one combined
-- corollary rather than eight separate restatements.

-- `thm:constant-multiple-rule-interval`
/-- Let `I : Set ℝ` and `α : ℝ`. If `hI : I.OrdConnected`, `f g : ℝ → ℝ`, `fD gD : ℝ → ℝ`, `hf : ∀ x
∈ I, Derivative (fD x) f I x`, and `hg : ∀ x ∈ I, Derivative (gD x) g I x`. Then `(∀ x ∈ I,
Derivative (α * fD x) (fun y => α * f y) I x) ∧ (∀ x ∈ I, Derivative (fD x + gD x) (fun y => f y
+ g y) I x) ∧ (∀ x ∈ I, Derivative (fD x * g x + f x * gD x) (fun y => f y * g y) I x)`.

Logical form:

```lean
theorem IntervalFormsOfAlgebraRules (I : Set ℝ) (hI : I.OrdConnected)
    (f g : ℝ → ℝ) (fD gD : ℝ → ℝ) (α : ℝ)
    (hf : ∀ x ∈ I, Derivative (fD x) f I x) (hg : ∀ x ∈ I, Derivative (gD x) g I x) :
    (∀ x ∈ I, Derivative (α * fD x) (fun y => α * f y) I x) ∧
    (∀ x ∈ I, Derivative (fD x + gD x) (fun y => f y + g y) I x) ∧
    (∀ x ∈ I, Derivative (fD x * g x + f x * gD x) (fun y => f y * g y) I x)
```
-/
theorem IntervalFormsOfAlgebraRules (I : Set ℝ) (hI : I.OrdConnected)
    (f g : ℝ → ℝ) (fD gD : ℝ → ℝ) (α : ℝ)
    (hf : ∀ x ∈ I, Derivative (fD x) f I x) (hg : ∀ x ∈ I, Derivative (gD x) g I x) :
    (∀ x ∈ I, Derivative (α * fD x) (fun y => α * f y) I x) ∧
    (∀ x ∈ I, Derivative (fD x + gD x) (fun y => f y + g y) I x) ∧
    (∀ x ∈ I, Derivative (fD x * g x + f x * gD x) (fun y => f y * g y) I x) := by
  sorry

-- ---------------------------------------------------------------------
-- Inverting the operation.
-- ---------------------------------------------------------------------

-- `thm:inverse-function-theorem-one-variable`
/-- Let `I : Set ℝ` and `c : ℝ`. If `f fD1 : ℝ → ℝ`, `hI : IsOpen I`, `hclass : IsClassC1 f fD1 I`,
`hc : c ∈ I`, and `hnz : fD1 c ≠ 0`. Then `∃ U V : Set ℝ, IsOpen U ∧ IsOpen V ∧ c ∈ U ∧ f c ∈ V
∧ U ⊆ I ∧ Set.BijOn f U V ∧ ∃ g : ℝ → ℝ, (∀ x ∈ U, g (f x) = x) ∧ (∀ y ∈ V, f (g y) = y) ∧ ∃ gD1
: ℝ → ℝ, IsClassC1 g gD1 V ∧ ∀ y ∈ V, ∃ x ∈ U, f x = y ∧ gD1 y * fD1 x = 1`.

Logical form:

```lean
theorem InverseFunctionTheoremOneVariable (f fD1 : ℝ → ℝ) (I : Set ℝ) (hI : IsOpen I)
    (hclass : IsClassC1 f fD1 I) (c : ℝ) (hc : c ∈ I) (hnz : fD1 c ≠ 0) :
    ∃ U V : Set ℝ, IsOpen U ∧ IsOpen V ∧ c ∈ U ∧ f c ∈ V ∧ U ⊆ I ∧
      Set.BijOn f U V ∧
      ∃ g : ℝ → ℝ, (∀ x ∈ U, g (f x) = x) ∧ (∀ y ∈ V, f (g y) = y) ∧
        ∃ gD1 : ℝ → ℝ, IsClassC1 g gD1 V ∧
          ∀ y ∈ V, ∃ x ∈ U, f x = y ∧ gD1 y * fD1 x = 1
```
-/
theorem InverseFunctionTheoremOneVariable (f fD1 : ℝ → ℝ) (I : Set ℝ) (hI : IsOpen I)
    (hclass : IsClassC1 f fD1 I) (c : ℝ) (hc : c ∈ I) (hnz : fD1 c ≠ 0) :
    ∃ U V : Set ℝ, IsOpen U ∧ IsOpen V ∧ c ∈ U ∧ f c ∈ V ∧ U ⊆ I ∧
      Set.BijOn f U V ∧
      ∃ g : ℝ → ℝ, (∀ x ∈ U, g (f x) = x) ∧ (∀ y ∈ V, f (g y) = y) ∧
        ∃ gD1 : ℝ → ℝ, IsClassC1 g gD1 V ∧
          ∀ y ∈ V, ∃ x ∈ U, f x = y ∧ gD1 y * fD1 x = 1 := by
  sorry

/-- Let `U V : Set ℝ`. If `f g fD1 : ℝ → ℝ`, `hf : ∀ x ∈ U, Derivative (fD1 x) f U x`, `hnz : ∀ x ∈
U, fD1 x ≠ 0`, `hgVU : ∀ y ∈ V, g y ∈ U`, `hinv : ∀ x ∈ U, g (f x) = x`, and `hinv' : ∀ y ∈ V, f
(g y) = y`. Then `∀ y ∈ V, Derivative (1 / fD1 (g y)) g V y`.

Logical form:

```lean
theorem InverseFunctionDerivative (f g fD1 : ℝ → ℝ) (U V : Set ℝ)
    (hf : ∀ x ∈ U, Derivative (fD1 x) f U x) (hnz : ∀ x ∈ U, fD1 x ≠ 0)
    (hgVU : ∀ y ∈ V, g y ∈ U)
    (hinv : ∀ x ∈ U, g (f x) = x) (hinv' : ∀ y ∈ V, f (g y) = y) :
    ∀ y ∈ V, Derivative (1 / fD1 (g y)) g V y
```
-/
theorem InverseFunctionDerivative (f g fD1 : ℝ → ℝ) (U V : Set ℝ)
    (hf : ∀ x ∈ U, Derivative (fD1 x) f U x) (hnz : ∀ x ∈ U, fD1 x ≠ 0)
    (hgVU : ∀ y ∈ V, g y ∈ U)
    (hinv : ∀ x ∈ U, g (f x) = x) (hinv' : ∀ y ∈ V, f (g y) = y) :
    ∀ y ∈ V, Derivative (1 / fD1 (g y)) g V y := by
  sorry

-- ---------------------------------------------------------------------
-- Indeterminate forms: L'Hôpital's Rule.
-- ---------------------------------------------------------------------

open LRA.Analysis.Limits in
-- `thm:lhopital-zero-over-zero`
/-- Let `a b : ℝ` and `L : ℝ`. If `f g : ℝ → ℝ`, `hab : a < b`, `hf : ∀ x ∈ Set.Ioo a b,
IsDifferentiable f (Set.Ioo a b) x`, `hg : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b)
x`, `hgD : ∀ x ∈ Set.Ioo a b, ∀ D, Derivative D g (Set.Ioo a b) x → D ≠ 0`, `hf0 : TendsToRight
f (Set.Ioo a b) a 0`, `hg0 : TendsToRight g (Set.Ioo a b) a 0`, `fD gD : ℝ → ℝ`, `hfD : ∀ x ∈
Set.Ioo a b, Derivative (fD x) f (Set.Ioo a b) x`, `hgD' : ∀ x ∈ Set.Ioo a b, Derivative (gD x)
g (Set.Ioo a b) x`, and `hL : TendsToRight (fun x => fD x / gD x) (Set.Ioo a b) a L`. Then
`TendsToRight (fun x => f x / g x) (Set.Ioo a b) a L`.

Logical form:

```lean
theorem LhopitalZeroOverZero (f g : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hg : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x)
    (hgD : ∀ x ∈ Set.Ioo a b, ∀ D, Derivative D g (Set.Ioo a b) x → D ≠ 0)
    (hf0 : TendsToRight f (Set.Ioo a b) a 0) (hg0 : TendsToRight g (Set.Ioo a b) a 0)
    (fD gD : ℝ → ℝ) (hfD : ∀ x ∈ Set.Ioo a b, Derivative (fD x) f (Set.Ioo a b) x)
    (hgD' : ∀ x ∈ Set.Ioo a b, Derivative (gD x) g (Set.Ioo a b) x)
    (L : ℝ) (hL : TendsToRight (fun x => fD x / gD x) (Set.Ioo a b) a L) :
    TendsToRight (fun x => f x / g x) (Set.Ioo a b) a L
```
-/
theorem LhopitalZeroOverZero (f g : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hg : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x)
    (hgD : ∀ x ∈ Set.Ioo a b, ∀ D, Derivative D g (Set.Ioo a b) x → D ≠ 0)
    (hf0 : TendsToRight f (Set.Ioo a b) a 0) (hg0 : TendsToRight g (Set.Ioo a b) a 0)
    (fD gD : ℝ → ℝ) (hfD : ∀ x ∈ Set.Ioo a b, Derivative (fD x) f (Set.Ioo a b) x)
    (hgD' : ∀ x ∈ Set.Ioo a b, Derivative (gD x) g (Set.Ioo a b) x)
    (L : ℝ) (hL : TendsToRight (fun x => fD x / gD x) (Set.Ioo a b) a L) :
    TendsToRight (fun x => f x / g x) (Set.Ioo a b) a L := by
  sorry

open LRA.Analysis.Limits in
-- `thm:lhopital-infinity-over-infinity`
/-- Let `a b : ℝ` and `L : ℝ`. If `f g : ℝ → ℝ`, `hab : a < b`, `hf : ∀ x ∈ Set.Ioo a b,
IsDifferentiable f (Set.Ioo a b) x`, `hg : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b)
x`, `hgD : ∀ x ∈ Set.Ioo a b, ∀ D, Derivative D g (Set.Ioo a b) x → D ≠ 0`, `hgInf : ∀ M > 0, ∃
δ > 0, ∀ x ∈ Set.Ioo a b, x < a + δ → |g x| > M`, `fD gD : ℝ → ℝ`, `hfD : ∀ x ∈ Set.Ioo a b,
Derivative (fD x) f (Set.Ioo a b) x`, `hgD' : ∀ x ∈ Set.Ioo a b, Derivative (gD x) g (Set.Ioo a
b) x`, and `hL : TendsToRight (fun x => fD x / gD x) (Set.Ioo a b) a L`. Then `TendsToRight (fun
x => f x / g x) (Set.Ioo a b) a L`.

Logical form:

```lean
theorem LhopitalInfinityOverInfinity (f g : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hg : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x)
    (hgD : ∀ x ∈ Set.Ioo a b, ∀ D, Derivative D g (Set.Ioo a b) x → D ≠ 0)
    (hgInf : ∀ M > 0, ∃ δ > 0, ∀ x ∈ Set.Ioo a b, x < a + δ → |g x| > M)
    (fD gD : ℝ → ℝ) (hfD : ∀ x ∈ Set.Ioo a b, Derivative (fD x) f (Set.Ioo a b) x)
    (hgD' : ∀ x ∈ Set.Ioo a b, Derivative (gD x) g (Set.Ioo a b) x)
    (L : ℝ) (hL : TendsToRight (fun x => fD x / gD x) (Set.Ioo a b) a L) :
    TendsToRight (fun x => f x / g x) (Set.Ioo a b) a L
```
-/
theorem LhopitalInfinityOverInfinity (f g : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hg : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x)
    (hgD : ∀ x ∈ Set.Ioo a b, ∀ D, Derivative D g (Set.Ioo a b) x → D ≠ 0)
    (hgInf : ∀ M > 0, ∃ δ > 0, ∀ x ∈ Set.Ioo a b, x < a + δ → |g x| > M)
    (fD gD : ℝ → ℝ) (hfD : ∀ x ∈ Set.Ioo a b, Derivative (fD x) f (Set.Ioo a b) x)
    (hgD' : ∀ x ∈ Set.Ioo a b, Derivative (gD x) g (Set.Ioo a b) x)
    (L : ℝ) (hL : TendsToRight (fun x => fD x / gD x) (Set.Ioo a b) a L) :
    TendsToRight (fun x => f x / g x) (Set.Ioo a b) a L := by
  sorry

end LRA.Analysis.Differentiation
