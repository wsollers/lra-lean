
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Limits

/--
`TendsTo` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c L ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt 0 (abs (instHSub.hSub x c)) → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c L ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε)

Logical form (Lean):

```lean
def TendsTo (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x - L| < ε
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
def TendsTo (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x - L| < ε

/--
`TendsToRight` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c L ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt c x → Real.instLT.lt x (instHAdd.hAdd c δ) → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c L ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 c x → Real.instLT.1 x (instHAdd.1 c δ) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε)

Logical form (Lean):

```lean
def TendsToRight (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L| < ε
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
def TendsToRight (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L| < ε

/--
`TendsToLeft` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c L ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → Real.instLT.lt (instHSub.hSub c δ) x → Real.instLT.lt x c → Real.instLT.lt (abs (instHSub.hSub (f x) L)) ε)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c L ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (instHSub.1 c δ) x → Real.instLT.1 x c → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε)

Logical form (Lean):

```lean
def TendsToLeft (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L| < ε
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
def TendsToLeft (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L| < ε

/--
`ApproachesButNotEqual` TODO

Predicate logic:

  ∀ (xs : Nat → Real) (A : Set Real) (c : Real), (∀ (n : Nat), Set.instMembership.mem A (xs n) ∧ (∀ (n : Nat), Ne (xs n) c ∧ ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (xs n) c)) ε))

Predicate logic (unfolded):

  ∀ (xs : Nat → Real) (A : Real → Prop) (c : Real), (∀ (n : Nat), Set.instMembership.1 A (xs n) ∧ (∀ (n : Nat), xs n = c → False ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (xs n) c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (xs n) c))) ε))

Logical form (Lean):

```lean
def ApproachesButNotEqual (xs : ℕ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  (∀ n, xs n ∈ A) ∧ (∀ n, xs n ≠ c) ∧
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def ApproachesButNotEqual (xs : ℕ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  (∀ n, xs n ∈ A) ∧ (∀ n, xs n ≠ c) ∧
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε

end LRA.Analysis.Limits
