
import Mathlib.Data.Real.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition

namespace LRA.Analysis.Differentiation

/--
`LeftDerivative` TODO

Predicate logic:

  ∀ (D : Real) (f : Real → Real) (A : Set Real) (c ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D)) ε)

Predicate logic (unfolded):

  ∀ (D : Real) (f : Real → Real) (A : Real → Prop) (c ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.1 (f x) (f c)) (instHSub.1 x c)) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D))) ε)

Logical form (Lean):

```lean
def LeftDerivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c →
    |(f x - f c) / (x - c) - D| < ε
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
def LeftDerivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c →
    |(f x - f c) / (x - c) - D| < ε

/--
`RightDerivative` TODO

Predicate logic:

  ∀ (D : Real) (f : Real → Real) (A : Set Real) (c ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (abs (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D)) ε)

Predicate logic (unfolded):

  ∀ (D : Real) (f : Real → Real) (A : Real → Prop) (c ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.1 (f x) (f c)) (instHSub.1 x c)) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D))) ε)

Logical form (Lean):

```lean
def RightDerivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ →
    |(f x - f c) / (x - c) - D| < ε
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
def RightDerivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ →
    |(f x - f c) / (x - c) - D| < ε

/--
`DifferentiableIffOneSidedDerivativesAgree` TODO

Predicate logic:

  (ℝ → ℝ) → IsDifferentiable f A c ↔ ∃ D, LeftDerivative D f A c ∧ RightDerivative D f A c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D))) ε) ↔ Exists fun D => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D))) ε))

Logical form (Lean):

```lean
theorem DifferentiableIffOneSidedDerivativesAgree (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    IsDifferentiable f A c ↔
      ∃ D, LeftDerivative D f A c ∧ RightDerivative D f A c
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use

-/
theorem DifferentiableIffOneSidedDerivativesAgree (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    IsDifferentiable f A c ↔
      ∃ D, LeftDerivative D f A c ∧ RightDerivative D f A c := by
  sorry

end LRA.Analysis.Differentiation
