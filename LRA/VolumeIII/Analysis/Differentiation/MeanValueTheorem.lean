/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/differentiation/notes/mean-value-theorem/notes-mean-value-theorem.tex.

Full-coverage pass over the `mean-value-theorem` section. One Lean
statement per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic
import LRA.VolumeIII.Analysis.Differentiation.DerivativeDefinition
import LRA.VolumeIII.Analysis.Continuity.GlobalTheorems
import LRA.VolumeIII.Analysis.Continuity.UniformContinuity

namespace LRA.Analysis.Differentiation

-- `thm:rolles-theorem`
/-- Let `a b : ℝ`. If `f : ℝ → ℝ`, `hab : a < b`, `hcont :
LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)`, `hdiff : ∀ x ∈ Set.Ioo a b,
IsDifferentiable f (Set.Ioo a b) x`, and `hfab : f a = f b`. Then `∃ c ∈ Set.Ioo a b, Derivative
0 f (Set.Ioo a b) c`.

Logical form:

```lean
theorem RollesTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hfab : f a = f b) :
    ∃ c ∈ Set.Ioo a b, Derivative 0 f (Set.Ioo a b) c
```
-/
theorem RollesTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hfab : f a = f b) :
    ∃ c ∈ Set.Ioo a b, Derivative 0 f (Set.Ioo a b) c := by
  sorry

-- `thm:mean-value-theorem`
/-- Let `a b : ℝ`. If `f : ℝ → ℝ`, `hab : a < b`, `hcont :
LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)`, and `hdiff : ∀ x ∈ Set.Ioo a
b, IsDifferentiable f (Set.Ioo a b) x`. Then `∃ c ∈ Set.Ioo a b, Derivative ((f b - f a) / (b -
a)) f (Set.Ioo a b) c`.

Logical form:

```lean
theorem MeanValueTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x) :
    ∃ c ∈ Set.Ioo a b, Derivative ((f b - f a) / (b - a)) f (Set.Ioo a b) c
```
-/
theorem MeanValueTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x) :
    ∃ c ∈ Set.Ioo a b, Derivative ((f b - f a) / (b - a)) f (Set.Ioo a b) c := by
  sorry

-- `thm:cauchy-mean-value-theorem`
/-- Let `a b : ℝ`. If `f g : ℝ → ℝ`, `hab : a < b`, `hfcont :
LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)`, `hgcont :
LRA.Analysis.Continuity.ContinuousOn' g (Set.Icc a b)`, `hfdiff : ∀ x ∈ Set.Ioo a b,
IsDifferentiable f (Set.Ioo a b) x`, `hgdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a
b) x`, and `hgD : ∀ x ∈ Set.Ioo a b, ¬ Derivative 0 g (Set.Ioo a b) x`. Then `∃ c ∈ Set.Ioo a b,
∃ Df Dg, Derivative Df f (Set.Ioo a b) c ∧ Derivative Dg g (Set.Ioo a b) c ∧ Df * (g b - g a) =
Dg * (f b - f a)`.

Logical form:

```lean
theorem CauchyMeanValueTheorem (f g : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hfcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hgcont : LRA.Analysis.Continuity.ContinuousOn' g (Set.Icc a b))
    (hfdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hgdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x)
    (hgD : ∀ x ∈ Set.Ioo a b, ¬ Derivative 0 g (Set.Ioo a b) x) :
    ∃ c ∈ Set.Ioo a b, ∃ Df Dg, Derivative Df f (Set.Ioo a b) c ∧
      Derivative Dg g (Set.Ioo a b) c ∧
      Df * (g b - g a) = Dg * (f b - f a)
```
-/
theorem CauchyMeanValueTheorem (f g : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hfcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hgcont : LRA.Analysis.Continuity.ContinuousOn' g (Set.Icc a b))
    (hfdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hgdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x)
    (hgD : ∀ x ∈ Set.Ioo a b, ¬ Derivative 0 g (Set.Ioo a b) x) :
    ∃ c ∈ Set.Ioo a b, ∃ Df Dg, Derivative Df f (Set.Ioo a b) c ∧
      Derivative Dg g (Set.Ioo a b) c ∧
      Df * (g b - g a) = Dg * (f b - f a) := by
  sorry

-- `thm:nondecreasing-iff-nonneg-derivative`
/-- Let `I : Set ℝ`. If `f : ℝ → ℝ`, `hI : I.OrdConnected`, and `hdiff : ∀ x ∈ I, IsDifferentiable f
I x`. Then `MonotoneOn f I ↔ ∀ x ∈ I, ∀ D, Derivative D f I x → D ≥ 0`.

Logical form:

```lean
theorem NondecreasingIffNonnegDerivative (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, IsDifferentiable f I x) :
    MonotoneOn f I ↔ ∀ x ∈ I, ∀ D, Derivative D f I x → D ≥ 0
```
-/
theorem NondecreasingIffNonnegDerivative (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, IsDifferentiable f I x) :
    MonotoneOn f I ↔ ∀ x ∈ I, ∀ D, Derivative D f I x → D ≥ 0 := by
  sorry

/-- Let `I : Set ℝ` and `M : ℝ`. If `f : ℝ → ℝ`, `hI : I.OrdConnected`, `hdiff : ∀ x ∈ I,
IsDifferentiable f I x`, `hM : M ≥ 0`, and `hbound : ∀ x ∈ I, ∀ D, Derivative D f I x → |D| ≤
M`. Then `LRA.Analysis.Continuity.IsLipschitzOn f I M`.

Logical form:

```lean
theorem DerivativeBoundImpliesLipschitz (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, IsDifferentiable f I x) (M : ℝ) (hM : M ≥ 0)
    (hbound : ∀ x ∈ I, ∀ D, Derivative D f I x → |D| ≤ M) :
    LRA.Analysis.Continuity.IsLipschitzOn f I M
```
-/
theorem DerivativeBoundImpliesLipschitz (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, IsDifferentiable f I x) (M : ℝ) (hM : M ≥ 0)
    (hbound : ∀ x ∈ I, ∀ D, Derivative D f I x → |D| ≤ M) :
    LRA.Analysis.Continuity.IsLipschitzOn f I M := by
  sorry

end LRA.Analysis.Differentiation
