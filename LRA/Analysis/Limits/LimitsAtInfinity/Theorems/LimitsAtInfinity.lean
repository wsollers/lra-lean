import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.LimitsAtInfinity.Definition

namespace LRA.Analysis.Limits

/--
`TendstoInftyUnique` TODO

Predicate logic:

  (ℝ → ℝ) → L₁ = L₂

Predicate logic (unfolded):

  ∀ (f : Real → Real) (X : Real → Prop) (L₁ L₂ : Real), (∀ (M : Real), Exists fun x => (Set.instMembership.1 X x ∧ Real.instLT.1 M x) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₁))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₂))) ε)) → L₁ = L₂

Logical form (Lean):

```lean
theorem TendstoInftyUnique (f : ℝ → ℝ) (X : Set ℝ) (L₁ L₂ : ℝ)
    (hX : PlusInftyAdherent X)
    (h₁ : TendsToInfty f X L₁) (h₂ : TendsToInfty f X L₂) : L₁ = L₂
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
theorem TendstoInftyUnique (f : ℝ → ℝ) (X : Set ℝ) (L₁ L₂ : ℝ)
    (hX : PlusInftyAdherent X)
    (h₁ : TendsToInfty f X L₁) (h₂ : TendsToInfty f X L₂) : L₁ = L₂ := by
  sorry
/--
`TendstoNegInftyUnique` TODO

Predicate logic:

  (ℝ → ℝ) → L₁ = L₂

Predicate logic (unfolded):

  ∀ (f : Real → Real) (X : Real → Prop) (L₁ L₂ : Real), (∀ (M : Real), Exists fun x => (Set.instMembership.1 X x ∧ Real.instLT.1 x M) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 x M → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₁) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₁))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 x M → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L₂) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L₂))) ε)) → L₁ = L₂

Logical form (Lean):

```lean
theorem TendstoNegInftyUnique (f : ℝ → ℝ) (X : Set ℝ) (L₁ L₂ : ℝ)
    (hX : MinusInftyAdherent X)
    (h₁ : TendsToNegInfty f X L₁) (h₂ : TendsToNegInfty f X L₂) : L₁ = L₂
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
theorem TendstoNegInftyUnique (f : ℝ → ℝ) (X : Set ℝ) (L₁ L₂ : ℝ)
    (hX : MinusInftyAdherent X)
    (h₁ : TendsToNegInfty f X L₁) (h₂ : TendsToNegInfty f X L₂) : L₁ = L₂ := by
  sorry
/--
`LimitAtNegInfinityIffReflection` TODO

Predicate logic:

  (ℝ → ℝ) → TendsToNegInfty f X L ↔ TendsToInfty (fun x => f (-x)) {x : ℝ | -x ∈ X} L

Predicate logic (unfolded):

  ∀ (f : Real → Real) (X : Real → Prop) (L : Real), ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 x M → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε ↔ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 (fun x => Set.instMembership.1 X (Real.instNeg.1 x)) x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => f (Real.instNeg.1 x)) x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => f (Real.instNeg.neg x)) x) L))) ε

Logical form (Lean):

```lean
theorem LimitAtNegInfinityIffReflection (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) :
    TendsToNegInfty f X L ↔ TendsToInfty (fun x => f (-x)) {x : ℝ | -x ∈ X} L
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem LimitAtNegInfinityIffReflection (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) :
    TendsToNegInfty f X L ↔ TendsToInfty (fun x => f (-x)) {x : ℝ | -x ∈ X} L := by
  sorry
section AlgebraOfLimitsAtInfinity

variable {f g : ℝ → ℝ} {X : Set ℝ} {Lf Lg c : ℝ}

/--
`TendstoInftyAdd` TODO

Predicate logic:

  TendsToInfty (fun x => f x + g x) X (Lf + Lg)

Predicate logic (unfolded):

  ∀ {f g : Real → Real} {X : Real → Prop} {Lf Lg : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) Lf) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) Lf))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (g x) Lg) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (g x) Lg))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHAdd.1 (f x) (g x)) x) (instHAdd.1 Lf Lg)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHAdd.hAdd (f x) (g x)) x) (instHAdd.hAdd Lf Lg)))) ε

Logical form (Lean):

```lean
theorem TendstoInftyAdd (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg) :
    TendsToInfty (fun x => f x + g x) X (Lf + Lg)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem TendstoInftyAdd (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg) :
    TendsToInfty (fun x => f x + g x) X (Lf + Lg) := by
  sorry
/--
`TendstoInftySub` TODO

Predicate logic:

  TendsToInfty (fun x => f x - g x) X (Lf - Lg)

Predicate logic (unfolded):

  ∀ {f g : Real → Real} {X : Real → Prop} {Lf Lg : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) Lf) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) Lf))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (g x) Lg) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (g x) Lg))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHSub.1 (f x) (g x)) x) (instHSub.1 Lf Lg)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHSub.hSub (f x) (g x)) x) (instHSub.hSub Lf Lg)))) ε

Logical form (Lean):

```lean
theorem TendstoInftySub (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg) :
    TendsToInfty (fun x => f x - g x) X (Lf - Lg)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem TendstoInftySub (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg) :
    TendsToInfty (fun x => f x - g x) X (Lf - Lg) := by
  sorry
/--
`TendstoInftyScalar` TODO

Predicate logic:

  TendsToInfty (fun x => c * f x) X (c * Lf)

Predicate logic (unfolded):

  ∀ {f : Real → Real} {X : Real → Prop} {Lf : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) Lf) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) Lf))) ε) → ∀ (c ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHMul.1 c (f x)) x) (instHMul.1 c Lf)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHMul.hMul c (f x)) x) (instHMul.hMul c Lf)))) ε

Logical form (Lean):

```lean
theorem TendstoInftyScalar (hf : TendsToInfty f X Lf) (c : ℝ) :
    TendsToInfty (fun x => c * f x) X (c * Lf)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem TendstoInftyScalar (hf : TendsToInfty f X Lf) (c : ℝ) :
    TendsToInfty (fun x => c * f x) X (c * Lf) := by
  sorry
/--
`TendstoInftyMul` TODO

Predicate logic:

  TendsToInfty (fun x => f x * g x) X (Lf * Lg)

Predicate logic (unfolded):

  ∀ {f g : Real → Real} {X : Real → Prop} {Lf Lg : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) Lf) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) Lf))) ε ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (g x) Lg) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (g x) Lg))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHMul.1 (f x) (g x)) x) (instHMul.1 Lf Lg)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHMul.hMul (f x) (g x)) x) (instHMul.hMul Lf Lg)))) ε

Logical form (Lean):

```lean
theorem TendstoInftyMul (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg) :
    TendsToInfty (fun x => f x * g x) X (Lf * Lg)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem TendstoInftyMul (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg) :
    TendsToInfty (fun x => f x * g x) X (Lf * Lg) := by
  sorry
/--
`TendstoInftyDiv` TODO

Predicate logic:

  TendsToInfty (fun x => f x / g x) X (Lf / Lg)

Predicate logic (unfolded):

  ∀ {f g : Real → Real} {X : Real → Prop} {Lf Lg : Real}, (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) Lf) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) Lf))) ε ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (g x) Lg) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (g x) Lg))) ε ∧ Lg = Zero.toOfNat0.1 → False)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHDiv.1 (f x) (g x)) x) (instHDiv.1 Lf Lg)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHDiv.hDiv (f x) (g x)) x) (instHDiv.hDiv Lf Lg)))) ε

Logical form (Lean):

```lean
theorem TendstoInftyDiv (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg)
    (hLg : Lg ≠ 0) :
    TendsToInfty (fun x => f x / g x) X (Lf / Lg)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem TendstoInftyDiv (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg)
    (hLg : Lg ≠ 0) :
    TendsToInfty (fun x => f x / g x) X (Lf / Lg) := by
  sorry
end AlgebraOfLimitsAtInfinity

/--
`SequentialCriterionTendstoInfty` TODO

Predicate logic:

  (ℝ → ℝ ∧ ∀ M : ℝ, ∃ x ∈ X, x > M) → TendsToInfty f X L ↔ ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ X) → EscapesToInfty xs → ∀ ε > 0, ∃ N ∈ ℕ, ∀ n ≥ N, |f (xs n) - L| < ε

Predicate logic (unfolded):

  ∀ (f : Real → Real) (X : Real → Prop) (L : Real), (∀ (M : Real), Exists fun x => (Set.instMembership.1 X x ∧ Real.instLT.1 M x)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun M => ∀ (x : Real), Set.instMembership.1 X x → Real.instLT.1 M x → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) L))) ε ↔ ∀ (xs : Nat → Real), (∀ (n : Nat), Set.instMembership.1 X (xs n)) → (∀ (M : Real), Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 M (xs n)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f (xs n)) L) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f (xs n)) L))) ε

Logical form (Lean):

```lean
theorem SequentialCriterionTendstoInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ)
    (hX : ∀ M : ℝ, ∃ x ∈ X, x > M) :
    TendsToInfty f X L ↔
      ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ X) → EscapesToInfty xs →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε
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
theorem SequentialCriterionTendstoInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ)
    (hX : ∀ M : ℝ, ∃ x ∈ X, x > M) :
    TendsToInfty f X L ↔
      ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ X) → EscapesToInfty xs →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε := by
  sorry
end LRA.Analysis.Limits
