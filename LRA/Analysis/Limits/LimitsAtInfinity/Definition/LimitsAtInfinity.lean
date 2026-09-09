
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Limits

/--
`PlusInftyAdherent` TODO

Predicate logic:

  ∀ (A : Set Real) (M : Real), Exists fun x => (x ∈ A ∧ GT.gt x M)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun x => (x ∈ A ∧ Real.instLT.lt M x)

Logical form (Lean):

```lean
def PlusInftyAdherent (A : Set ℝ) : Prop := ∀ M : ℝ, ∃ x ∈ A, x > M
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
def PlusInftyAdherent (A : Set ℝ) : Prop := ∀ M : ℝ, ∃ x ∈ A, x > M

/--
`MinusInftyAdherent` TODO

Predicate logic:

  ∀ (A : Set Real) (M : Real), Exists fun x => (x ∈ A ∧ Real.instLT.lt x M)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun x => (x ∈ A ∧ Real.instLT.lt x M)

Logical form (Lean):

```lean
def MinusInftyAdherent (A : Set ℝ) : Prop := ∀ M : ℝ, ∃ x ∈ A, x < M
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
def MinusInftyAdherent (A : Set ℝ) : Prop := ∀ M : ℝ, ∃ x ∈ A, x < M

/--
`TendsToInfty` TODO

Predicate logic:

  ∀ (f : Real → Real) (X : Set Real) (L ε : Real), GT.gt ε 0 → Exists fun M => ∀ (x : Real), x ∈ X → GT.gt x M → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε

Logical form (Lean):

```lean
def TendsToInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ M : ℝ, ∀ x ∈ X, x > M → |f x - L| < ε
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
def TendsToInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ M : ℝ, ∀ x ∈ X, x > M → |f x - L| < ε

/--
`TendsToNegInfty` TODO

Predicate logic:

  ∀ (f : Real → Real) (X : Set Real) (L ε : Real), GT.gt ε 0 → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt x M → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt x M → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L)) ε

Logical form (Lean):

```lean
def TendsToNegInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ M : ℝ, ∀ x ∈ X, x < M → |f x - L| < ε
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
def TendsToNegInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ M : ℝ, ∀ x ∈ X, x < M → |f x - L| < ε

/--
`EscapesToInfty` TODO

Predicate logic:

  ∀ (xs : Nat → Real) (M : Real), Exists fun N => ∀ (n : Nat), GE.ge n N → GT.gt (xs n) M

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt M (xs n)

Logical form (Lean):

```lean
def EscapesToInfty (xs : ℕ → ℝ) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, xs n > M
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
def EscapesToInfty (xs : ℕ → ℝ) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, xs n > M

end LRA.Analysis.Limits
