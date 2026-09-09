
import Mathlib.Data.Real.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition

namespace LRA.Analysis.Differentiation

/--
`HasLinearApproximation` TODO

Predicate logic:

  ∀ (f : Real → Real) (a L ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), Real.instLT.lt 0 (abs (instHSub.hSub x a)) → Real.instLT.lt (abs (instHSub.hSub x a)) δ → Real.instLE.le (abs (instHSub.hSub (instHSub.hSub (f x) (f a)) (instHMul.hMul L (instHSub.hSub x a)))) (instHMul.hMul ε (abs (instHSub.hSub x a)))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) δ → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f a)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul L ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ε (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)))))

Logical form (Lean):

```lean
def HasLinearApproximation (f : ℝ → ℝ) (a L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x : ℝ, 0 < |x - a| → |x - a| < δ →
    |f x - f a - L * (x - a)| ≤ ε * |x - a|
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def HasLinearApproximation (f : ℝ → ℝ) (a L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x : ℝ, 0 < |x - a| → |x - a| < δ →
    |f x - f a - L * (x - a)| ≤ ε * |x - a|

/--
`DifferentiableIffHasLinearApproximation` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), LRA.Analysis.Differentiation.IsDifferentiable f A c ↔ Exists fun L => LRA.Analysis.Differentiation.HasLinearApproximation f c L

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
  Prove
    LRA.Analysis.Differentiation.IsDifferentiable f A c ↔ Exists fun L => LRA.Analysis.Differentiation.HasLinearApproximation f c L

Logical form (Lean):

```lean
theorem DifferentiableIffHasLinearApproximation (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    IsDifferentiable f A c ↔ ∃ L, HasLinearApproximation f c L
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem DifferentiableIffHasLinearApproximation (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    IsDifferentiable f A c ↔ ∃ L, HasLinearApproximation f c L := by
  sorry
/--
`LinearApproximationSlopeEqDerivative` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c D : Real), LRA.Analysis.Differentiation.Derivative D f A c → ∀ (L : Real), LRA.Analysis.Differentiation.HasLinearApproximation f c L → L = D

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c D : ℝ
    hD : Derivative D f A c
    L : ℝ
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) D)) ε))) → ∀ (L : Real), (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLE.le (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f c)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul L ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ε (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)))))) → L = D

Logical form (Lean):

```lean
theorem LinearApproximationSlopeEqDerivative (f : ℝ → ℝ) (A : Set ℝ) (c D : ℝ)
    (hD : Derivative D f A c) (L : ℝ) (hL : HasLinearApproximation f c L) :
    L = D
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem LinearApproximationSlopeEqDerivative (f : ℝ → ℝ) (A : Set ℝ) (c D : ℝ)
    (hD : Derivative D f A c) (L : ℝ) (hL : HasLinearApproximation f c L) :
    L = D := by
  sorry
end LRA.Analysis.Differentiation
