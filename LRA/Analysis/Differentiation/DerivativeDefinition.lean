
import LRA.Analysis.Limits
import LRA.Analysis.Continuity.PointContinuity

namespace LRA.Analysis.Differentiation

/--
`Derivative` TODO

Predicate logic:

  ∀ (D : Real) (f : Real → Real) (A : Set Real) (c ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (h : Real), instHAdd.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (instHAdd.hAdd c h)) (f c)) h) D)) ε))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) D)) ε))

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

  ∀ (D : Real) (f : Real → Real) (A : Set Real) (c : Real), Exists fun α => (LRA.Analysis.Limits.TendsTo α A c 0 ∧ (∀ (x : Real), x ∈ A → f x = instHAdd.hAdd (instHAdd.hAdd (f c) (instHMul.hMul D (instHSub.hSub x c))) (instHMul.hMul (α x) (instHSub.hSub x c))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun α => ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (α x) 0)) ε))) ∧ (∀ (x : Real), x ∈ A → f x = { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd (f c) ({ hMul := fun a b => Real.instMul.mul a b }.hMul D ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c))) ({ hMul := fun a b => Real.instMul.mul a b }.hMul (α x) ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c))))

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun D => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) D)) ε))

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

  ∀ (D : Real) (f : Real → Real) (A : Set Real) (c ε : Real), GT.gt ε 0 → Exists fun U => ((Exists fun δ => (GT.gt δ 0 ∧ U = LRA.Analysis.Continuity.RelativeNeighborhood A c δ)) ∧ (∀ (x : Real), x ∈ U → Ne x c → Real.instLT.lt (abs (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D)) ε))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Real.instLT.lt 0 ε → Exists fun U => ((Exists fun δ => (Real.instLT.lt 0 δ ∧ (U = funx => (x ∈ A ∧ Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ)))) ∧ (∀ (x : Real), x ∈ U → (x = c → False) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f c)) ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) D)) ε))

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

  ∀ (D : Real) (f : Real → Real) (A : Set Real) (c : Real) (xs : Nat → Real), ((∀ (n : Nat), xs n ∈ A) ∧ ((∀ (n : Nat), Ne (xs n) c) ∧ (∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (xs n) c)) ε))) → ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f (xs n)) (f c)) (instHSub.hSub (xs n) c)) D)) ε

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (n : Nat), xs n ∈ A) ∧ ((∀ (n : Nat), xs n = c → False) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (xs n) c)) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f (xs n)) (f c)) ({ hSub := fun a b => Real.instSub.sub a b }.hSub (xs n) c)) D)) ε

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

  ∀ (D : Real) (f : Real → Real) (A : Set Real) (c : Real), LRA.Analysis.Differentiation.Derivative D f A c ↔ (LRA.Analysis.Differentiation.DerivativeNeighborhood D f A c ∧ LRA.Analysis.Differentiation.DerivativeSequential D f A c)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    D : ℝ
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
  Prove
    LRA.Analysis.Differentiation.Derivative D f A c ↔ (LRA.Analysis.Differentiation.DerivativeNeighborhood D f A c ∧ LRA.Analysis.Differentiation.DerivativeSequential D f A c)

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

  ∀ (D : Real) (f : Real → Real) (A : Set Real) (c : Real), LRA.Analysis.Differentiation.Derivative D f A c ↔ ∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs (instHSub.hSub x c)) → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLT.lt (abs (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D)) ε))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    D : ℝ
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
  Prove
    LRA.Analysis.Differentiation.Derivative D f A c ↔ ∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs (instHSub.hSub x c)) → Real.instLT.lt (abs (instHSub.hSub x c)) δ → Real.instLT.lt (abs (instHSub.hSub (instHDiv.hDiv (instHSub.hSub (f x) (f c)) (instHSub.hSub x c)) D)) ε))

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

  ∀ (f : Real → Real) (A : Set Real) (c : Real), LRA.Analysis.Differentiation.IsDifferentiable f A c → LRA.Analysis.Continuity.ContinuousAtPoint f A c

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c : ℝ
  Prove
    (Exists fun D => ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) D)) ε))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (f c))) ε))

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

  ∀ (f : Real → Real) (A : Set Real) (c D₁ D₂ : Real), (Exists fun xs => LRA.Analysis.Limits.ApproachesButNotEqual xs A c ∧ (LRA.Analysis.Differentiation.Derivative D₁ f A c ∧ LRA.Analysis.Differentiation.Derivative D₂ f A c)) → D₁ = D₂

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    A : Set ℝ
    c D₁ D₂ : ℝ
    h₁ : Derivative D₁ f A c
    h₂ : Derivative D₂ f A c
  Prove
    ((Exists fun xs => ((∀ (n : Nat), xs n ∈ A) ∧ ((∀ (n : Nat), xs n = c → False) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun N => ∀ (n : Nat), instLENat.le N n → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (xs n) c)) ε)))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) D₁)) ε))) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (h : Real), { hAdd := fun a b => Real.instAdd.add a b }.hAdd c h ∈ A → Real.instLT.lt 0 (abs h) → Real.instLT.lt (abs h) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd c h)) (f c)) h) D₂)) ε))))) → D₁ = D₂

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
