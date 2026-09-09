
import Mathlib.Data.Real.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition

namespace LRA.Analysis.Differentiation

/--
`LeftDerivative` TODO

Predicate logic:

  ∀ (D : Real) (f : Real → Real) (A : Set Real) (c ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D)) ε))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt ({ hSub := fun a b => Real.instSub.sub a b }.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f c)) ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) D)) ε))

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

  ∀ (D : Real) (f : Real → Real) (A : Set Real) (c ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (abs (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D)) ε))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt c x → Real.instLT.lt x ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c δ) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f c)) ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) D)) ε))

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), LRA.Analysis.Differentiation.IsDifferentiable f A c ↔ Exists fun D => (LRA.Analysis.Differentiation.LeftDerivative D f A c ∧ LRA.Analysis.Differentiation.RightDerivative D f A c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
  Prove
    LRA.Analysis.Differentiation.IsDifferentiable f A c ↔ Exists fun D => (LRA.Analysis.Differentiation.LeftDerivative D f A c ∧ LRA.Analysis.Differentiation.RightDerivative D f A c)

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
