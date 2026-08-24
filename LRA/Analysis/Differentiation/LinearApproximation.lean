
import Mathlib.Data.Real.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition

namespace LRA.Analysis.Differentiation

/--
`HasLinearApproximation` TODO

Predicate logic:

  ∀ (f : Real → Real) (a L ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Real.instLT.lt 0 (abs (instHSub.hSub x a)) → Real.instLT.lt (abs (instHSub.hSub x a)) δ → Real.instLE.le (abs (instHSub.hSub (instHSub.hSub (f x) (f a)) (instHMul.hMul L (instHSub.hSub x a)))) (instHMul.hMul ε (abs (instHSub.hSub x a))))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (a L ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) δ → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHSub.1 (f x) (f a)) (instHMul.1 L (instHSub.1 x a))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHSub.1 (f x) (f a)) (instHMul.1 L (instHSub.hSub x a))))) (instHMul.1 ε (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a)))))

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

  (ℝ → ℝ) → IsDifferentiable f A c ↔ ∃ L, HasLinearApproximation f c L

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D))) ε) ↔ Exists fun L => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHSub.1 (f x) (f c)) (instHMul.1 L (instHSub.hSub x c))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHSub.hSub (f x) (f c)) (instHMul.hMul L (instHSub.hSub x c))))) (instHMul.1 ε (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x c)))))

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

  (ℝ → ℝ ∧ HasLinearApproximation f c L) → L = D

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c D : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D))) ε)) → ∀ (L : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHSub.1 (f x) (f c)) (instHMul.1 L (instHSub.hSub x c))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHSub.hSub (f x) (f c)) (instHMul.hMul L (instHSub.hSub x c))))) (instHMul.1 ε (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x c)))))) → L = D

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
