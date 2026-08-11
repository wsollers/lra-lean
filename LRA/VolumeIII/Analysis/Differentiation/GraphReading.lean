/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/differentiation/notes/graph-reading/{notes-understanding-derivatives.tex,
notes-second-order-shape.tex, notes-darboux.tex, notes-smoothness-classes.tex}.

Full-coverage pass over the `graph-reading` section (all four subsections:
First-Order Shape, Second-Order Shape, Darboux's Theorem, Smoothness
Classes). One Lean statement per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic
import LRA.VolumeIII.Analysis.Differentiation.DerivativeDefinition
import LRA.VolumeIII.Analysis.Differentiation.DerivativeGeometry
import LRA.VolumeIII.Analysis.Differentiation.ChainRule
import LRA.VolumeIII.Analysis.Continuity.GlobalTheorems
import LRA.VolumeIII.Analysis.Continuity.PointContinuity
import LRA.VolumeIII.Analysis.Continuity.UniformContinuity

namespace LRA.VolumeIII.Analysis.Differentiation

-- ---------------------------------------------------------------------
-- First-Order Shape (`notes-understanding-derivatives.tex`).
-- ---------------------------------------------------------------------

/-- `def:increasing-at-a-point`.

Logical form:

```lean
def IsIncreasingAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ δ > 0, (∀ x ∈ A, c - δ < x → x < c → f x < f c) ∧
    (∀ x ∈ A, c < x → x < c + δ → f c < f x)
```
-/
def IsIncreasingAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ δ > 0, (∀ x ∈ A, c - δ < x → x < c → f x < f c) ∧
    (∀ x ∈ A, c < x → x < c + δ → f c < f x)

/-- `def:decreasing-at-a-point`.

Logical form:

```lean
def IsDecreasingAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ δ > 0, (∀ x ∈ A, c - δ < x → x < c → f c < f x) ∧
    (∀ x ∈ A, c < x → x < c + δ → f x < f c)
```
-/
def IsDecreasingAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ δ > 0, (∀ x ∈ A, c - δ < x → x < c → f c < f x) ∧
    (∀ x ∈ A, c < x → x < c + δ → f x < f c)

/-- Nonincreasing (order-reversing) on `I`.

Logical form:

```lean
def OrderReversing (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ x ∈ I, ∀ y ∈ I, x < y → f y ≤ f x
```
-/
def OrderReversing (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ x ∈ I, ∀ y ∈ I, x < y → f y ≤ f x

-- `thm:nonincreasing-iff-nonpos-derivative`
/-- Let `I : Set ℝ`. If `f : ℝ → ℝ`, `hI : I.OrdConnected`, and `hdiff : ∀ x ∈ I, IsDifferentiable f
I x`. Then `OrderReversing f I ↔ ∀ x ∈ I, ∀ D, Derivative D f I x → D ≤ 0`.

Logical form:

```lean
theorem NonincreasingIffNonposDerivative (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, IsDifferentiable f I x) :
    OrderReversing f I ↔ ∀ x ∈ I, ∀ D, Derivative D f I x → D ≤ 0
```
-/
theorem NonincreasingIffNonposDerivative (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, IsDifferentiable f I x) :
    OrderReversing f I ↔ ∀ x ∈ I, ∀ D, Derivative D f I x → D ≤ 0 := by
  sorry

-- `thm:zero-derivative-implies-constant`
/-- Let `I : Set ℝ`. If `f : ℝ → ℝ`, `hI : I.OrdConnected`, and `hdiff : ∀ x ∈ I, Derivative 0 f I
x`. Then `∃ k : ℝ, ∀ x ∈ I, f x = k`.

Logical form:

```lean
theorem ZeroDerivativeImpliesConstant (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, Derivative 0 f I x) :
    ∃ k : ℝ, ∀ x ∈ I, f x = k
```
-/
theorem ZeroDerivativeImpliesConstant (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, Derivative 0 f I x) :
    ∃ k : ℝ, ∀ x ∈ I, f x = k := by
  sorry

/-- Let `I : Set ℝ`. If `f g : ℝ → ℝ`, `hI : I.OrdConnected`, and `hdiff : ∀ x ∈ I, ∀ D, Derivative
D f I x ↔ Derivative D g I x`. Then `∃ k : ℝ, ∀ x ∈ I, f x - g x = k`.

Logical form:

```lean
theorem EqualDerivativesConstantDifference (f g : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, ∀ D, Derivative D f I x ↔ Derivative D g I x) :
    ∃ k : ℝ, ∀ x ∈ I, f x - g x = k
```
-/
theorem EqualDerivativesConstantDifference (f g : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, ∀ D, Derivative D f I x ↔ Derivative D g I x) :
    ∃ k : ℝ, ∀ x ∈ I, f x - g x = k := by
  sorry

-- `thm:first-derivative-test-maximum`
/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ`, `hc : c ∈ interior A`, `hcrit : Derivative 0 f A
c`, `hpos : ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → ∀ D, Derivative D f A x → D > 0`, and `hneg :
∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → ∀ D, Derivative D f A x → D < 0`. Then `IsRelativeMaximum
f A c`.

Logical form:

```lean
theorem FirstDerivativeTestMaximum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A) (hcrit : Derivative 0 f A c)
    (hpos : ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → ∀ D, Derivative D f A x → D > 0)
    (hneg : ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → ∀ D, Derivative D f A x → D < 0) :
    IsRelativeMaximum f A c
```
-/
theorem FirstDerivativeTestMaximum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A) (hcrit : Derivative 0 f A c)
    (hpos : ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → ∀ D, Derivative D f A x → D > 0)
    (hneg : ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → ∀ D, Derivative D f A x → D < 0) :
    IsRelativeMaximum f A c := by
  sorry

-- `thm:first-derivative-test-minimum`
/-- Let `A : Set ℝ` and `c : ℝ`. If `f : ℝ → ℝ`, `hc : c ∈ interior A`, `hcrit : Derivative 0 f A
c`, `hneg : ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → ∀ D, Derivative D f A x → D < 0`, and `hpos :
∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → ∀ D, Derivative D f A x → D > 0`. Then `IsRelativeMinimum
f A c`.

Logical form:

```lean
theorem FirstDerivativeTestMinimum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A) (hcrit : Derivative 0 f A c)
    (hneg : ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → ∀ D, Derivative D f A x → D < 0)
    (hpos : ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → ∀ D, Derivative D f A x → D > 0) :
    IsRelativeMinimum f A c
```
-/
theorem FirstDerivativeTestMinimum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A) (hcrit : Derivative 0 f A c)
    (hneg : ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → ∀ D, Derivative D f A x → D < 0)
    (hpos : ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → ∀ D, Derivative D f A x → D > 0) :
    IsRelativeMinimum f A c := by
  sorry

-- ---------------------------------------------------------------------
-- Second-Order Shape (`notes-second-order-shape.tex`).
-- ---------------------------------------------------------------------

/-- `def:second-derivative`.

Logical form:

```lean
def SecondDerivative (D2 : ℝ) (f fD1 : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  Derivative D2 fD1 A c
```
-/
def SecondDerivative (D2 : ℝ) (f fD1 : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  Derivative D2 fD1 A c

/-- `def:higher-derivatives`, matching `ChainRule.lean`'s
`NthDerivativeAt` local stand-in.

Logical form:

```lean
def HigherDerivativeAt (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (A : Set ℝ) (n : ℕ) (c : ℝ) : Prop :=
  LRA.VolumeIII.Analysis.Differentiation.NthDerivativeAt f fD A n c
```
-/
def HigherDerivativeAt (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (A : Set ℝ) (n : ℕ) (c : ℝ) : Prop :=
  LRA.VolumeIII.Analysis.Differentiation.NthDerivativeAt f fD A n c

-- `thm:second-derivative-convexity-test`
/-- Let `I : Set ℝ`. If `f fD1 fD2 : ℝ → ℝ`, `hI : I.OrdConnected`, `hD1 : ∀ x ∈ I, Derivative (fD1
x) f I x`, `hD2 : ∀ x ∈ I, Derivative (fD2 x) fD1 I x`, and `hpos : ∀ x ∈ I, fD2 x ≥ 0`. Then
`IsConvexOn f I`.

Logical form:

```lean
theorem SecondDerivativeConvexityTest (f fD1 fD2 : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hD1 : ∀ x ∈ I, Derivative (fD1 x) f I x)
    (hD2 : ∀ x ∈ I, Derivative (fD2 x) fD1 I x)
    (hpos : ∀ x ∈ I, fD2 x ≥ 0) :
    IsConvexOn f I
```
-/
theorem SecondDerivativeConvexityTest (f fD1 fD2 : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hD1 : ∀ x ∈ I, Derivative (fD1 x) f I x)
    (hD2 : ∀ x ∈ I, Derivative (fD2 x) fD1 I x)
    (hpos : ∀ x ∈ I, fD2 x ≥ 0) :
    IsConvexOn f I := by
  sorry

-- `thm:second-derivative-concavity-test`
/-- Let `I : Set ℝ`. If `f fD1 fD2 : ℝ → ℝ`, `hI : I.OrdConnected`, `hD1 : ∀ x ∈ I, Derivative (fD1
x) f I x`, `hD2 : ∀ x ∈ I, Derivative (fD2 x) fD1 I x`, and `hneg : ∀ x ∈ I, fD2 x ≤ 0`. Then
`IsConcaveOn f I`.

Logical form:

```lean
theorem SecondDerivativeConcavityTest (f fD1 fD2 : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hD1 : ∀ x ∈ I, Derivative (fD1 x) f I x)
    (hD2 : ∀ x ∈ I, Derivative (fD2 x) fD1 I x)
    (hneg : ∀ x ∈ I, fD2 x ≤ 0) :
    IsConcaveOn f I
```
-/
theorem SecondDerivativeConcavityTest (f fD1 fD2 : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hD1 : ∀ x ∈ I, Derivative (fD1 x) f I x)
    (hD2 : ∀ x ∈ I, Derivative (fD2 x) fD1 I x)
    (hneg : ∀ x ∈ I, fD2 x ≤ 0) :
    IsConcaveOn f I := by
  sorry

-- `thm:second-derivative-test`
/-- Let `A : Set ℝ` and `c : ℝ`. If `f fD1 fD2 : ℝ → ℝ`, `hD1c : Derivative 0 f A c`, `hD1 : ∀ x ∈
A, Derivative (fD1 x) f A x`, and `hD2c : Derivative (fD2 c) fD1 A c`. Then `(fD2 c > 0 →
IsRelativeMinimum f A c) ∧ (fD2 c < 0 → IsRelativeMaximum f A c)`.

Logical form:

```lean
theorem SecondDerivativeTest (f fD1 fD2 : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hD1c : Derivative 0 f A c)
    (hD1 : ∀ x ∈ A, Derivative (fD1 x) f A x) (hD2c : Derivative (fD2 c) fD1 A c) :
    (fD2 c > 0 → IsRelativeMinimum f A c) ∧ (fD2 c < 0 → IsRelativeMaximum f A c)
```
-/
theorem SecondDerivativeTest (f fD1 fD2 : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hD1c : Derivative 0 f A c)
    (hD1 : ∀ x ∈ A, Derivative (fD1 x) f A x) (hD2c : Derivative (fD2 c) fD1 A c) :
    (fD2 c > 0 → IsRelativeMinimum f A c) ∧ (fD2 c < 0 → IsRelativeMaximum f A c) := by
  sorry

/-- Let `A : Set ℝ` and `c : ℝ`. If `f fD1 fD2 : ℝ → ℝ`, `hinfl : IsInflection f c`, `hD1 : ∀ x ∈ A,
Derivative (fD1 x) f A x`, `hD2 : ∀ x ∈ A, Derivative (fD2 x) fD1 A x`, and `hcont :
LRA.VolumeIII.Analysis.Continuity.ContinuousAtPoint fD2 A c`. Then `fD2 c = 0`.

Logical form:

```lean
theorem InflectionPointNecessaryCondition (f fD1 fD2 : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hinfl : IsInflection f c)
    (hD1 : ∀ x ∈ A, Derivative (fD1 x) f A x) (hD2 : ∀ x ∈ A, Derivative (fD2 x) fD1 A x)
    (hcont : LRA.VolumeIII.Analysis.Continuity.ContinuousAtPoint fD2 A c) :
    fD2 c = 0
```
-/
theorem InflectionPointNecessaryCondition (f fD1 fD2 : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hinfl : IsInflection f c)
    (hD1 : ∀ x ∈ A, Derivative (fD1 x) f A x) (hD2 : ∀ x ∈ A, Derivative (fD2 x) fD1 A x)
    (hcont : LRA.VolumeIII.Analysis.Continuity.ContinuousAtPoint fD2 A c) :
    fD2 c = 0 := by
  sorry

-- ---------------------------------------------------------------------
-- Darboux's Theorem (`notes-darboux.tex`).
-- ---------------------------------------------------------------------

-- `thm:darboux`
/-- Let `a b : ℝ`, `Da Db : ℝ`, and `k : ℝ`. If `f : ℝ → ℝ`, `hab : a < b`, `hdiff : ∀ x ∈ Set.Icc a
b, IsDifferentiable f (Set.Icc a b) x`, `hDa : Derivative Da f (Set.Icc a b) a`, `hDb :
Derivative Db f (Set.Icc a b) b`, and `hk : (Da < k ∧ k < Db) ∨ (Db < k ∧ k < Da)`. Then `∃ c ∈
Set.Ioo a b, Derivative k f (Set.Icc a b) c`.

Logical form:

```lean
theorem darboux (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hdiff : ∀ x ∈ Set.Icc a b, IsDifferentiable f (Set.Icc a b) x)
    (Da Db : ℝ) (hDa : Derivative Da f (Set.Icc a b) a) (hDb : Derivative Db f (Set.Icc a b) b)
    (k : ℝ) (hk : (Da < k ∧ k < Db) ∨ (Db < k ∧ k < Da)) :
    ∃ c ∈ Set.Ioo a b, Derivative k f (Set.Icc a b) c
```
-/
theorem darboux (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hdiff : ∀ x ∈ Set.Icc a b, IsDifferentiable f (Set.Icc a b) x)
    (Da Db : ℝ) (hDa : Derivative Da f (Set.Icc a b) a) (hDb : Derivative Db f (Set.Icc a b) b)
    (k : ℝ) (hk : (Da < k ∧ k < Db) ∨ (Db < k ∧ k < Da)) :
    ∃ c ∈ Set.Ioo a b, Derivative k f (Set.Icc a b) c := by
  sorry

-- ---------------------------------------------------------------------
-- Smoothness Classes (`notes-smoothness-classes.tex`).
-- ---------------------------------------------------------------------

/-- `def:class-c1`.

Logical form:

```lean
def IsClassC1 (f : ℝ → ℝ) (fD1 : ℝ → ℝ) (I : Set ℝ) : Prop :=
  (∀ x ∈ I, Derivative (fD1 x) f I x) ∧
    LRA.VolumeIII.Analysis.Continuity.ContinuousOn' fD1 I
```
-/
def IsClassC1 (f : ℝ → ℝ) (fD1 : ℝ → ℝ) (I : Set ℝ) : Prop :=
  (∀ x ∈ I, Derivative (fD1 x) f I x) ∧
    LRA.VolumeIII.Analysis.Continuity.ContinuousOn' fD1 I

/-- `def:class-ck`, `k ≥ 0`, via a witnessing derivative-sequence
`fD : ℕ → ℝ → ℝ` (`fD 0 = f`), matching `ChainRule.lean`'s
`NthDerivativeAt` convention pointwise across `I`.

Logical form:

```lean
def IsClassCk (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) (k : ℕ) : Prop :=
  (∀ x ∈ I, HigherDerivativeAt f fD I k x) ∧
    LRA.VolumeIII.Analysis.Continuity.ContinuousOn' (fD k) I
```
-/
def IsClassCk (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) (k : ℕ) : Prop :=
  (∀ x ∈ I, HigherDerivativeAt f fD I k x) ∧
    LRA.VolumeIII.Analysis.Continuity.ContinuousOn' (fD k) I

/-- `def:class-cinfty`.

Logical form:

```lean
def IsClassCInfty (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ k : ℕ, IsClassCk f fD I k
```
-/
def IsClassCInfty (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ k : ℕ, IsClassCk f fD I k

/-- `def:class-comega`: real-analyticity — local convergence of the
Taylor series to `f` itself.

Logical form:

```lean
def IsClassCOmega (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ a ∈ I, ∃ r > 0, ∀ x ∈ Set.Ioo (a - r) (a + r) ∩ I,
    Filter.Tendsto (fun n => ∑ k ∈ Finset.range (n + 1),
      fD k a / (Nat.factorial k) * (x - a) ^ k) Filter.atTop (nhds (f x))
```
-/
def IsClassCOmega (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ a ∈ I, ∃ r > 0, ∀ x ∈ Set.Ioo (a - r) (a + r) ∩ I,
    Filter.Tendsto (fun n => ∑ k ∈ Finset.range (n + 1),
      fD k a / (Nat.factorial k) * (x - a) ^ k) Filter.atTop (nhds (f x))

-- `thm:smoothness-tower`
/-- Let `I : Set ℝ`. If `hI : I.Nontrivial`. Then `(∀ f fD k, IsClassCk f fD I (k + 1) → IsClassCk f
fD I k) ∧ (∀ f fD, IsClassCOmega f fD I → IsClassCInfty f fD I)`.

Logical form:

```lean
theorem SmoothnessTower (I : Set ℝ) (hI : I.Nontrivial) :
    (∀ f fD k, IsClassCk f fD I (k + 1) → IsClassCk f fD I k) ∧
    (∀ f fD, IsClassCOmega f fD I → IsClassCInfty f fD I)
```
-/
theorem SmoothnessTower (I : Set ℝ) (hI : I.Nontrivial) :
    (∀ f fD k, IsClassCk f fD I (k + 1) → IsClassCk f fD I k) ∧
    (∀ f fD, IsClassCOmega f fD I → IsClassCInfty f fD I) := by
  sorry

/-- `def:class-c11`: `C^1` with a Lipschitz derivative — the exact
regularity giving a bounded gradient-Lipschitz constant without requiring
`f''` to exist everywhere.

Logical form:

```lean
def IsClassC11 (f fD1 : ℝ → ℝ) (I : Set ℝ) : Prop :=
  IsClassC1 f fD1 I ∧ ∃ L ≥ 0,
    LRA.VolumeIII.Analysis.Continuity.IsLipschitzOn fD1 I L
```
-/
def IsClassC11 (f fD1 : ℝ → ℝ) (I : Set ℝ) : Prop :=
  IsClassC1 f fD1 I ∧ ∃ L ≥ 0,
    LRA.VolumeIII.Analysis.Continuity.IsLipschitzOn fD1 I L

-- `thm:c11-placement`
/-- Let `I : Set ℝ`. If `hI : I.Nontrivial`. Then `(∀ f fD1, IsClassC11 f fD1 I → IsClassC1 f fD1
I)`.

Logical form:

```lean
theorem C11Placement (I : Set ℝ) (hI : I.Nontrivial) :
    (∀ f fD1, IsClassC11 f fD1 I → IsClassC1 f fD1 I)
```
-/
theorem C11Placement (I : Set ℝ) (hI : I.Nontrivial) :
    (∀ f fD1, IsClassC11 f fD1 I → IsClassC1 f fD1 I) := by
  sorry

/-- Let `I : Set ℝ` and `M : ℝ`. If `f fD1 fD2 : ℝ → ℝ`, `hM : M ≥ 0`, `hclass : IsClassCk f (fun n
=> if n = 0 then f else if n = 1 then fD1 else fD2) I 2`, and `hbound : ∀ x ∈ I, |fD2 x| ≤ M`.
Then `IsClassC11 f fD1 I ∧ LRA.VolumeIII.Analysis.Continuity.IsLipschitzOn fD1 I M`.

Logical form:

```lean
theorem BoundedSecondDerivativeImpliesC11 (f fD1 fD2 : ℝ → ℝ) (I : Set ℝ) (M : ℝ)
    (hM : M ≥ 0) (hclass : IsClassCk f (fun n => if n = 0 then f else if n = 1 then fD1 else fD2) I 2)
    (hbound : ∀ x ∈ I, |fD2 x| ≤ M) :
    IsClassC11 f fD1 I ∧ LRA.VolumeIII.Analysis.Continuity.IsLipschitzOn fD1 I M
```
-/
theorem BoundedSecondDerivativeImpliesC11 (f fD1 fD2 : ℝ → ℝ) (I : Set ℝ) (M : ℝ)
    (hM : M ≥ 0) (hclass : IsClassCk f (fun n => if n = 0 then f else if n = 1 then fD1 else fD2) I 2)
    (hbound : ∀ x ∈ I, |fD2 x| ≤ M) :
    IsClassC11 f fD1 I ∧ LRA.VolumeIII.Analysis.Continuity.IsLipschitzOn fD1 I M := by
  sorry

end LRA.VolumeIII.Analysis.Differentiation
