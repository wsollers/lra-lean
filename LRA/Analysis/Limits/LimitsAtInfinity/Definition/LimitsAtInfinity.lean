
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Limits

/--
`PlusInftyAdherent` TODO

Predicate logic:

  ∀ (A : Set Real) (M : Real), Exists fun x => (Set.instMembership.mem A x ∧ GT.gt x M)

Predicate logic (unfolded):

  ∀ (A : Real → Prop) (M : Real), Exists fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 M x)

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

  ∀ (A : Set Real) (M : Real), Exists fun x => (Set.instMembership.mem A x ∧ Real.instLT.lt x M)

Predicate logic (unfolded):

  ∀ (A : Real → Prop) (M : Real), Exists fun x => (Set.instMembership.1 A x ∧ Real.instLT.1 x M)

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

  ∀ (f : Real → Real) (X : Set Real) (L ε : Real), GT.gt ε 0 → Exists fun M => ∀ (x : Real), Set.instMembership.mem X x → GT.gt x M → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε

Predicate logic (unfolded):

  ∀ (f : Real → Real) (X : Real → Prop) (L ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε

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

  ∀ (f : Real → Real) (X : Set Real) (L ε : Real), GT.gt ε 0 → Exists fun M => ∀ (x : Real), Set.instMembership.mem X x → Real.instLT.lt x M → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε

Predicate logic (unfolded):

  ∀ (f : Real → Real) (X : Real → Prop) (L ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 x M → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε

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

  ∀ (xs : Nat → Real) (M : Real), Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 M (xs n)

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
