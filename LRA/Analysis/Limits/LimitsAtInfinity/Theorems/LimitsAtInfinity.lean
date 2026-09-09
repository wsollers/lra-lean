import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.LimitsAtInfinity.Definition

namespace LRA.Analysis.Limits

/--
`TendstoInftyUnique` TODO

Predicate logic:

  ∀ (f : Real → Real) (X : Set Real) (L₁ L₂ : Real), (LRA.Analysis.Limits.PlusInftyAdherent X ∧ (LRA.Analysis.Limits.TendsToInfty f X L₁ ∧ LRA.Analysis.Limits.TendsToInfty f X L₂)) → L₁ = L₂

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    X : Set ℝ
    L₁ L₂ : ℝ
    hX : PlusInftyAdherent X
    h₁ : TendsToInfty f X L₁
    h₂ : TendsToInfty f X L₂
  Prove
    ((∀ (M : Real), Exists fun x => (x ∈ X ∧ Real.instLT.lt M x)) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₁)) ε) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₂)) ε))) → L₁ = L₂

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

  ∀ (f : Real → Real) (X : Set Real) (L₁ L₂ : Real), (LRA.Analysis.Limits.MinusInftyAdherent X ∧ (LRA.Analysis.Limits.TendsToNegInfty f X L₁ ∧ LRA.Analysis.Limits.TendsToNegInfty f X L₂)) → L₁ = L₂

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    X : Set ℝ
    L₁ L₂ : ℝ
    hX : MinusInftyAdherent X
    h₁ : TendsToNegInfty f X L₁
    h₂ : TendsToNegInfty f X L₂
  Prove
    ((∀ (M : Real), Exists fun x => (x ∈ X ∧ Real.instLT.lt x M)) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt x M → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₁)) ε) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt x M → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) L₂)) ε))) → L₁ = L₂

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

  ∀ (f : Real → Real) (X : Set Real) (L : Real), LRA.Analysis.Limits.TendsToNegInfty f X L ↔ LRA.Analysis.Limits.TendsToInfty (fun x => f (Real.instNeg.neg x)) (setOf fun x => Real.instNeg.neg x ∈ X) L

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f : ℝ → ℝ
    X : Set ℝ
    L : ℝ
  Prove
    LRA.Analysis.Limits.TendsToNegInfty f X L ↔ LRA.Analysis.Limits.TendsToInfty (fun x => f (Real.instNeg.neg x)) (setOf fun x => Real.instNeg.neg x ∈ X) L

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

  ∀ {f g : Real → Real} {X : Set Real} {Lf Lg : Real}, (LRA.Analysis.Limits.TendsToInfty f X Lf ∧ LRA.Analysis.Limits.TendsToInfty g X Lg) → LRA.Analysis.Limits.TendsToInfty (fun x => instHAdd.hAdd (f x) (g x)) X (instHAdd.hAdd Lf Lg)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    X : Set ℝ
    Lf Lg c : ℝ
    hf : TendsToInfty f X Lf
    hg : TendsToInfty g X Lg
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) Lf)) ε) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) Lg)) ε)) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (g x)) x) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd Lf Lg))) ε

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

  ∀ {f g : Real → Real} {X : Set Real} {Lf Lg : Real}, (LRA.Analysis.Limits.TendsToInfty f X Lf ∧ LRA.Analysis.Limits.TendsToInfty g X Lg) → LRA.Analysis.Limits.TendsToInfty (fun x => instHSub.hSub (f x) (g x)) X (instHSub.hSub Lf Lg)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    X : Set ℝ
    Lf Lg c : ℝ
    hf : TendsToInfty f X Lf
    hg : TendsToInfty g X Lg
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) Lf)) ε) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) Lg)) ε)) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hSub := fun a b => Real.instSub.sub a b }.hSub (f x) (g x)) x) ({ hSub := fun a b => Real.instSub.sub a b }.hSub Lf Lg))) ε

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

  ∀ {f : Real → Real} {X : Set Real} {Lf : Real}, LRA.Analysis.Limits.TendsToInfty f X Lf → ∀ (c : Real), LRA.Analysis.Limits.TendsToInfty (fun x => instHMul.hMul c (f x)) X (instHMul.hMul c Lf)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    X : Set ℝ
    Lf Lg c : ℝ
    hf : TendsToInfty f X Lf
    c : ℝ
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) Lf)) ε) → ∀ (c ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul c (f x)) x) ({ hMul := fun a b => Real.instMul.mul a b }.hMul c Lf))) ε

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

  ∀ {f g : Real → Real} {X : Set Real} {Lf Lg : Real}, (LRA.Analysis.Limits.TendsToInfty f X Lf ∧ LRA.Analysis.Limits.TendsToInfty g X Lg) → LRA.Analysis.Limits.TendsToInfty (fun x => instHMul.hMul (f x) (g x)) X (instHMul.hMul Lf Lg)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    X : Set ℝ
    Lf Lg c : ℝ
    hf : TendsToInfty f X Lf
    hg : TendsToInfty g X Lg
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) Lf)) ε) ∧ (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) Lg)) ε)) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul (f x) (g x)) x) ({ hMul := fun a b => Real.instMul.mul a b }.hMul Lf Lg))) ε

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

  ∀ {f g : Real → Real} {X : Set Real} {Lf Lg : Real}, (LRA.Analysis.Limits.TendsToInfty f X Lf ∧ (LRA.Analysis.Limits.TendsToInfty g X Lg ∧ Ne Lg 0)) → LRA.Analysis.Limits.TendsToInfty (fun x => instHDiv.hDiv (f x) (g x)) X (instHDiv.hDiv Lf Lg)

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    X : Set ℝ
    Lf Lg c : ℝ
    hf : TendsToInfty f X Lf
    hg : TendsToInfty g X Lg
    hLg : Lg ≠ 0
  Prove
    ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) Lf)) ε) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) Lg)) ε) ∧ (Lg = 0 → False))) → ∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun M => ∀ (x : Real), x ∈ X → Real.instLT.lt M x → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (f x) (g x)) x) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv Lf Lg))) ε

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

  ∀ (f : Real → Real) (X : Set Real) (L : Real), (∀ (M : Real), Exists fun x => (x ∈ X ∧ GT.gt x M)) → LRA.Analysis.Limits.TendsToInfty f X L ↔ ∀ (xs : Nat → Real), (∀ (n : Nat), xs n ∈ X) → LRA.Analysis.Limits.EscapesToInfty xs → ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (f (xs n)) L)) ε

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    X : Set ℝ
    Lf Lg c : ℝ
    f : ℝ → ℝ
    X : Set ℝ
    L : ℝ
  Prove
    (∀ (M : Real), Exists fun x => (x ∈ X ∧ GT.gt x M)) → LRA.Analysis.Limits.TendsToInfty f X L ↔ ∀ (xs : Nat → Real), (∀ (n : Nat), xs n ∈ X) → LRA.Analysis.Limits.EscapesToInfty xs → ∀ (ε : Real), GT.gt ε 0 → Exists fun N => ∀ (n : Nat), GE.ge n N → Real.instLT.lt (abs (instHSub.hSub (f (xs n)) L)) ε

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
