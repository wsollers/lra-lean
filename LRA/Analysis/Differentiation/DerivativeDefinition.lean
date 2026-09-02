
import LRA.Analysis.Limits
import LRA.Analysis.Continuity.PointContinuity

namespace LRA.Analysis.Differentiation

/--
`Derivative` TODO

Predicate logic:

  ∀ (D : Real) (f : Real → Real) (A : Set Real) (c ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (h : Real), Set.instMembership.mem A (instHAdd.hAdd c h) → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D)) ε)

Predicate logic (unfolded):

  ∀ (D : Real) (f : Real → Real) (A : Real → Prop) (c ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.1 (f (instHAdd.hAdd c h)) (f c)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D))) ε)

Logical form (Lean):

```lean
def Derivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ h : ℝ, c + h ∈ A → 0 < |h| → |h| < δ →
    |(f (c + h) - f c) / h - D| < ε
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
def Derivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ h : ℝ, c + h ∈ A → 0 < |h| → |h| < δ →
    |(f (c + h) - f c) / h - D| < ε

/--
`ZorichDerivative` TODO

Predicate logic:

  ∀ (D : Real) (f : Real → Real) (A : Set Real) (c : Real), Exists fun α => (LRA.Analysis.Limits.TendsTo α A c 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → f x = instHAdd.hAdd (instHAdd.hAdd (f c) (instHMul.hMul D (instHSub.hSub x c))) (instHMul.hMul (α x) (instHSub.hSub x c)))

Predicate logic (unfolded):

  ∀ (D : Real) (f : Real → Real) (A : Real → Prop) (c : Real), Exists fun α => (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (α x) Zero.toOfNat0.1) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (α x) 0))) ε) ∧ ∀ (x : Real), Set.instMembership.1 A x → f x = instHAdd.1 (instHAdd.1 (f c) (instHMul.1 D (instHSub.1 x c))) (instHMul.1 (α x) (instHSub.1 x c)))

Logical form (Lean):

```lean
def ZorichDerivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ α : ℝ → ℝ,
    LRA.Analysis.Limits.TendsTo α A c 0 ∧
      ∀ x ∈ A, f x = f c + D * (x - c) + α x * (x - c)
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
def ZorichDerivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ α : ℝ → ℝ,
    LRA.Analysis.Limits.TendsTo α A c 0 ∧
      ∀ x ∈ A, f x = f c + D * (x - c) + α x * (x - c)

/--
`IsDifferentiable` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (c : Real), Exists fun D => LRA.Analysis.Differentiation.Derivative D f A c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D))) ε)

Logical form (Lean):

```lean
def IsDifferentiable (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ D, Derivative D f A c
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
def IsDifferentiable (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ D, Derivative D f A c

/--
`DerivativeNeighborhood` TODO

Predicate logic:

  ∀ (D : Real) (f : Real → Real) (A : Set Real) (c ε : Real), GT.gt ε 0 → Exists fun U => (Exists fun δ => (GT.gt δ 0 ∧ U = LRA.Analysis.Continuity.RelativeNeighborhood A c δ) ∧ ∀ (x : Real), Set.instMembership.mem U x → Ne x c → Real.instLT.lt (abs (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D)) ε)

Predicate logic (unfolded):

  ∀ (D : Real) (f : Real → Real) (A : Real → Prop) (c ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun U => (Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ U = funx => (Set.instMembership.1 A x ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x c))) δ)) ∧ ∀ (x : Real), Set.instMembership.1 U x → (x = c → False) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.1 (f x) (f c)) (instHSub.1 x c)) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D))) ε)

Logical form (Lean):

```lean
def DerivativeNeighborhood (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ U : Set ℝ, (∃ δ > 0, U = LRA.Analysis.Continuity.RelativeNeighborhood A c δ) ∧
    ∀ x ∈ U, x ≠ c → |(f x - f c) / (x - c) - D| < ε
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
def DerivativeNeighborhood (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ U : Set ℝ, (∃ δ > 0, U = LRA.Analysis.Continuity.RelativeNeighborhood A c δ) ∧
    ∀ x ∈ U, x ≠ c → |(f x - f c) / (x - c) - D| < ε

/--
`DerivativeSequential` TODO

Predicate logic:

  ∀ (D : Real) (f : Real → Real) (A : Set Real) (c : Real) (xs : Nat → Real), (∀ (n : Nat), Set.instMembership.mem A (xs n) ∧ (∀ (n : Nat), Ne (xs n) c ∧ ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (xs n) c)) ε)) → ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (xs n)) (f c)) (instHSub.hSub (xs n) c)) D)) ε

Predicate logic (unfolded):

  ∀ (D : Real) (f : Real → Real) (A : Real → Prop) (c : Real) (xs : Nat → Real), (∀ (n : Nat), Set.instMembership.1 A (xs n) ∧ (∀ (n : Nat), xs n = c → False ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (xs n) c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (xs n) c))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.1 (f (xs n)) (f c)) (instHSub.1 (xs n) c)) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (xs n)) (f c)) (instHSub.hSub (xs n) c)) D))) ε

Logical form (Lean):

```lean
def DerivativeSequential (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ A) → (∀ n, xs n ≠ c) →
    (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε) →
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |(f (xs n) - f c) / (xs n - c) - D| < ε
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
def DerivativeSequential (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ A) → (∀ n, xs n ≠ c) →
    (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε) →
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |(f (xs n) - f c) / (xs n - c) - D| < ε

/--
`DerivativeEquivalence` TODO

Predicate logic:

  (ℝ → ℝ) → Derivative D f A c ↔ DerivativeNeighborhood D f A c ∧ DerivativeSequential D f A c

Predicate logic (unfolded):

  ∀ (D : Real) (f : Real → Real) (A : Real → Prop) (c : Real), ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D))) ε) ↔ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun U => (Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ U = funx => (Set.instMembership.1 A x ∧ Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.hSub x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x c))) δ)) ∧ ∀ (x : Real), Set.instMembership.1 U x → (x = c → False) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D))) ε) ∧ ∀ (xs : Nat → Real), (∀ (n : Nat), Set.instMembership.1 A (xs n)) → (∀ (n : Nat), xs n = c → False) → (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (xs n) c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (xs n) c))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (xs n)) (f c)) (instHSub.hSub (xs n) c)) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (xs n)) (f c)) (instHSub.hSub (xs n) c)) D))) ε)

Logical form (Lean):

```lean
theorem DerivativeEquivalence (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    Derivative D f A c ↔ DerivativeNeighborhood D f A c ∧ DerivativeSequential D f A c
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem DerivativeEquivalence (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    Derivative D f A c ↔ DerivativeNeighborhood D f A c ∧ DerivativeSequential D f A c := by
  sorry
/--
`DerivativeHFormEquivalence` TODO

Predicate logic:

  (ℝ → ℝ) → Derivative D f A c ↔ (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |(f x - f c) / (x - c) - D| < ε)

Predicate logic (unfolded):

  ∀ (D : Real) (f : Real → Real) (A : Real → Prop) (c : Real), ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D))) ε) ↔ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.1 (f x) (f c)) (instHSub.1 x c)) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D))) ε)

Logical form (Lean):

```lean
theorem DerivativeHFormEquivalence (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    Derivative D f A c ↔
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ →
        |(f x - f c) / (x - c) - D| < ε)
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
theorem DerivativeHFormEquivalence (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    Derivative D f A c ↔
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ →
        |(f x - f c) / (x - c) - D| < ε) := by
  sorry
/--
`DifferentiableImpliesContinuous` TODO

Predicate logic:

  (ℝ → ℝ ∧ IsDifferentiable f A c) → LRA.Analysis.Continuity.ContinuousAtPoint f A c

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c : Real), (Exists fun D => ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x c))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f c)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f c)))) ε)

Logical form (Lean):

```lean
theorem DifferentiableImpliesContinuous (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : IsDifferentiable f A c) :
    LRA.Analysis.Continuity.ContinuousAtPoint f A c
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
theorem DifferentiableImpliesContinuous (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : IsDifferentiable f A c) :
    LRA.Analysis.Continuity.ContinuousAtPoint f A c := by
  sorry
/--
`DerivativeUnique` TODO

Predicate logic:

  (ℝ → ℝ ∧ ∃ xs ∈ ℕ → ℝ, LRA.Analysis.Limits.ApproachesButNotEqual xs A c) → D₁ = D₂

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (c D₁ D₂ : Real), (Exists fun xs => (∀ (n : Nat), Set.instMembership.1 A (xs n) ∧ (∀ (n : Nat), xs n = c → False ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (xs n) c) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (xs n) c))) ε)) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D₁))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (h : Real), Set.instMembership.1 A (instHAdd.1 c h) → Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) → Real.instLT.1 (SemilatticeSup.toMax.1 h (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 h)) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (instHDiv.1 (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D₂))) ε))) → D₁ = D₂

Logical form (Lean):

```lean
theorem DerivativeUnique (f : ℝ → ℝ) (A : Set ℝ) (c D₁ D₂ : ℝ)
    (hacc : ∃ xs : ℕ → ℝ, LRA.Analysis.Limits.ApproachesButNotEqual xs A c)
    (h₁ : Derivative D₁ f A c) (h₂ : Derivative D₂ f A c) : D₁ = D₂
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem DerivativeUnique (f : ℝ → ℝ) (A : Set ℝ) (c D₁ D₂ : ℝ)
    (hacc : ∃ xs : ℕ → ℝ, LRA.Analysis.Limits.ApproachesButNotEqual xs A c)
    (h₁ : Derivative D₁ f A c) (h₂ : Derivative D₂ f A c) : D₁ = D₂ := by
  sorry
end LRA.Analysis.Differentiation
