
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Functions

/--
`PointwiseEq` TODO

Predicate logic:

  ∀ (f g : Real → Real) (A : Set Real) (x : Real), x ∈ A → f x = g x

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ A → f x = g x

Logical form (Lean):

```lean
def PointwiseEq (f g : ℝ → ℝ) (A : Set ℝ) : Prop := ∀ x ∈ A, f x = g x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PointwiseEq (f g : ℝ → ℝ) (A : Set ℝ) : Prop := ∀ x ∈ A, f x = g x

/--
`PointwiseLe` TODO

Predicate logic:

  ∀ (f g : Real → Real) (A : Set Real) (x : Real), x ∈ A → Real.instLE.le (f x) (g x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ A → Real.instLE.le (f x) (g x)

Logical form (Lean):

```lean
def PointwiseLe (f g : ℝ → ℝ) (A : Set ℝ) : Prop := ∀ x ∈ A, f x ≤ g x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PointwiseLe (f g : ℝ → ℝ) (A : Set ℝ) : Prop := ∀ x ∈ A, f x ≤ g x

/--
`PointwiseLt` TODO

Predicate logic:

  ∀ (f g : Real → Real) (A : Set Real) (x : Real), x ∈ A → Real.instLT.lt (f x) (g x)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    x ∈ A → Real.instLT.lt (f x) (g x)

Logical form (Lean):

```lean
def PointwiseLt (f g : ℝ → ℝ) (A : Set ℝ) : Prop := ∀ x ∈ A, f x < g x
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def PointwiseLt (f g : ℝ → ℝ) (A : Set ℝ) : Prop := ∀ x ∈ A, f x < g x

/--
`PointwiseOrderLaws` TODO

Predicate logic:

  ∀ (A : Set Real), ((∀ (f : Real → Real), LRA.Analysis.Functions.PointwiseLe f f A) ∧ ((∀ (f g : Real → Real), LRA.Analysis.Functions.PointwiseLe f g A → LRA.Analysis.Functions.PointwiseLe g f A → LRA.Analysis.Functions.Pointwisef = gA) ∧ (∀ (f g h : Real → Real), LRA.Analysis.Functions.PointwiseLe f g A → LRA.Analysis.Functions.PointwiseLe g h A → LRA.Analysis.Functions.PointwiseLe f h A)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
  Prove
    ((∀ (f : Real → Real) (x : Real), x ∈ A → Real.instLE.le (f x) (f x)) ∧ ((∀ (f g : Real → Real), (∀ (x : Real), x ∈ A → Real.instLE.le (f x) (g x)) → (∀ (x : Real), x ∈ A → Real.instLE.le (g x) (f x)) → ∀ (x : Real), x ∈ A → f x = g x) ∧ (∀ (f g h : Real → Real), (∀ (x : Real), x ∈ A → Real.instLE.le (f x) (g x)) → (∀ (x : Real), x ∈ A → Real.instLE.le (g x) (h x)) → ∀ (x : Real), x ∈ A → Real.instLE.le (f x) (h x))))

Logical form (Lean):

```lean
theorem PointwiseOrderLaws (A : Set ℝ) :
    (∀ f : ℝ → ℝ, PointwiseLe f f A) ∧
      (∀ f g : ℝ → ℝ, PointwiseLe f g A → PointwiseLe g f A → PointwiseEq f g A) ∧
      (∀ f g h : ℝ → ℝ, PointwiseLe f g A → PointwiseLe g h A → PointwiseLe f h A)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem PointwiseOrderLaws (A : Set ℝ) :
    (∀ f : ℝ → ℝ, PointwiseLe f f A) ∧
      (∀ f g : ℝ → ℝ, PointwiseLe f g A → PointwiseLe g f A → PointwiseEq f g A) ∧
      (∀ f g h : ℝ → ℝ, PointwiseLe f g A → PointwiseLe g h A → PointwiseLe f h A) := by
  sorry
/--
`StrictPointwiseOrderImpliesWeak` TODO

Predicate logic:

  ∀ (f g : Real → Real) (A : Set Real), LRA.Analysis.Functions.PointwiseLt f g A → LRA.Analysis.Functions.PointwiseLe f g A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
    h : PointwiseLt f g A
  Prove
    (∀ (x : Real), x ∈ A → Real.instLT.lt (f x) (g x)) → ∀ (x : Real), x ∈ A → Real.instLE.le (f x) (g x)

Logical form (Lean):

```lean
theorem StrictPointwiseOrderImpliesWeak (f g : ℝ → ℝ) (A : Set ℝ)
    (h : PointwiseLt f g A) : PointwiseLe f g A
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
theorem StrictPointwiseOrderImpliesWeak (f g : ℝ → ℝ) (A : Set ℝ)
    (h : PointwiseLt f g A) : PointwiseLe f g A := by
  sorry
/--
`PointwiseOrderArithmetic` TODO

Predicate logic:

  ∀ (f g h f₂ g₂ : Real → Real) (A : Set Real), (LRA.Analysis.Functions.PointwiseLe f g A ∧ LRA.Analysis.Functions.PointwiseLe f₂ g₂ A) → (LRA.Analysis.Functions.PointwiseLe (fun x => instHAdd.hAdd (f x) (h x)) (fun x => instHAdd.hAdd (g x) (h x)) A ∧ (LRA.Analysis.Functions.PointwiseLe (fun x => Real.instNeg.neg (g x)) (fun x => Real.instNeg.neg (f x)) A ∧ ((∀ (lam : Real), Real.instLE.le 0 lam → LRA.Analysis.Functions.PointwiseLe (fun x => instHMul.hMul lam (f x)) (fun x => instHMul.hMul lam (g x)) A) ∧ ((∀ (lam : Real), Real.instLE.le lam 0 → LRA.Analysis.Functions.PointwiseLe (fun x => instHMul.hMul lam (g x)) (fun x => instHMul.hMul lam (f x)) A) ∧ LRA.Analysis.Functions.PointwiseLe (fun x => instHAdd.hAdd (f x) (f₂ x)) (fun x => instHAdd.hAdd (g x) (g₂ x)) A))))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g h f₂ g₂ : ℝ → ℝ
    A : Set ℝ
    hfg : PointwiseLe f g A
    hf₂g₂ : PointwiseLe f₂ g₂ A
  Prove
    ((∀ (x : Real), x ∈ A → Real.instLE.le (f x) (g x)) ∧ (∀ (x : Real), x ∈ A → Real.instLE.le (f₂ x) (g₂ x))) → ((∀ (x : Real), x ∈ A → Real.instLE.le ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (h x)) x) ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (g x) (h x)) x)) ∧ ((∀ (x : Real), x ∈ A → Real.instLE.le ((fun x => Real.instNeg.neg (g x)) x) ((fun x => Real.instNeg.neg (f x)) x)) ∧ ((∀ (lam : Real), Real.instLE.le 0 lam → ∀ (x : Real), x ∈ A → Real.instLE.le ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul lam (f x)) x) ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul lam (g x)) x)) ∧ ((∀ (lam : Real), Real.instLE.le lam 0 → ∀ (x : Real), x ∈ A → Real.instLE.le ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul lam (g x)) x) ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul lam (f x)) x)) ∧ (∀ (x : Real), x ∈ A → Real.instLE.le ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (f x) (f₂ x)) x) ((fun x => { hAdd := fun a b => Real.instAdd.add a b }.hAdd (g x) (g₂ x)) x))))))

Logical form (Lean):

```lean
theorem PointwiseOrderArithmetic (f g h f₂ g₂ : ℝ → ℝ) (A : Set ℝ)
    (hfg : PointwiseLe f g A) (hf₂g₂ : PointwiseLe f₂ g₂ A) :
    PointwiseLe (fun x => f x + h x) (fun x => g x + h x) A ∧
      PointwiseLe (fun x => -g x) (fun x => -f x) A ∧
      (∀ lam : ℝ, 0 ≤ lam →
        PointwiseLe (fun x => lam * f x) (fun x => lam * g x) A) ∧
      (∀ lam : ℝ, lam ≤ 0 →
        PointwiseLe (fun x => lam * g x) (fun x => lam * f x) A) ∧
      PointwiseLe (fun x => f x + f₂ x) (fun x => g x + g₂ x) A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem PointwiseOrderArithmetic (f g h f₂ g₂ : ℝ → ℝ) (A : Set ℝ)
    (hfg : PointwiseLe f g A) (hf₂g₂ : PointwiseLe f₂ g₂ A) :
    PointwiseLe (fun x => f x + h x) (fun x => g x + h x) A ∧
      PointwiseLe (fun x => -g x) (fun x => -f x) A ∧
      (∀ lam : ℝ, 0 ≤ lam →
        PointwiseLe (fun x => lam * f x) (fun x => lam * g x) A) ∧
      (∀ lam : ℝ, lam ≤ 0 →
        PointwiseLe (fun x => lam * g x) (fun x => lam * f x) A) ∧
      PointwiseLe (fun x => f x + f₂ x) (fun x => g x + g₂ x) A := by
  sorry
/--
`PointwiseProductOrderNonnegative` TODO

Predicate logic:

  ∀ (f₁ g₁ f₂ g₂ : Real → Real) (A : Set Real), ((∀ (x : Real), x ∈ A → (Real.instLE.le 0 (f₁ x) ∧ Real.instLE.le (f₁ x) (g₁ x))) ∧ (∀ (x : Real), x ∈ A → (Real.instLE.le 0 (f₂ x) ∧ Real.instLE.le (f₂ x) (g₂ x)))) → LRA.Analysis.Functions.PointwiseLe (fun x => instHMul.hMul (f₁ x) (f₂ x)) (fun x => instHMul.hMul (g₁ x) (g₂ x)) A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f₁ g₁ f₂ g₂ : ℝ → ℝ
    A : Set ℝ
  Prove
    ((∀ (x : Real), x ∈ A → (Real.instLE.le 0 (f₁ x) ∧ Real.instLE.le (f₁ x) (g₁ x))) ∧ (∀ (x : Real), x ∈ A → (Real.instLE.le 0 (f₂ x) ∧ Real.instLE.le (f₂ x) (g₂ x)))) → ∀ (x : Real), x ∈ A → Real.instLE.le ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul (f₁ x) (f₂ x)) x) ((fun x => { hMul := fun a b => Real.instMul.mul a b }.hMul (g₁ x) (g₂ x)) x)

Logical form (Lean):

```lean
theorem PointwiseProductOrderNonnegative (f₁ g₁ f₂ g₂ : ℝ → ℝ) (A : Set ℝ)
    (h₁ : ∀ x ∈ A, 0 ≤ f₁ x ∧ f₁ x ≤ g₁ x)
    (h₂ : ∀ x ∈ A, 0 ≤ f₂ x ∧ f₂ x ≤ g₂ x) :
    PointwiseLe (fun x => f₁ x * f₂ x) (fun x => g₁ x * g₂ x) A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem PointwiseProductOrderNonnegative (f₁ g₁ f₂ g₂ : ℝ → ℝ) (A : Set ℝ)
    (h₁ : ∀ x ∈ A, 0 ≤ f₁ x ∧ f₁ x ≤ g₁ x)
    (h₂ : ∀ x ∈ A, 0 ≤ f₂ x ∧ f₂ x ≤ g₂ x) :
    PointwiseLe (fun x => f₁ x * f₂ x) (fun x => g₁ x * g₂ x) A := by
  sorry
/--
`ReciprocalOrderReversal` TODO

Predicate logic:

  ∀ (f g : Real → Real) (A : Set Real), (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (f x) ∧ Real.instLE.le (f x) (g x))) → LRA.Analysis.Functions.PointwiseLe (fun x => instHDiv.hDiv 1 (g x)) (fun x => instHDiv.hDiv 1 (f x)) A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    A : Set ℝ
  Prove
    (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (f x) ∧ Real.instLE.le (f x) (g x))) → ∀ (x : Real), x ∈ A → Real.instLE.le ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 (g x)) x) ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 (f x)) x)

Logical form (Lean):

```lean
theorem ReciprocalOrderReversal (f g : ℝ → ℝ) (A : Set ℝ)
    (h : ∀ x ∈ A, 0 < f x ∧ f x ≤ g x) :
    PointwiseLe (fun x => 1 / g x) (fun x => 1 / f x) A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem ReciprocalOrderReversal (f g : ℝ → ℝ) (A : Set ℝ)
    (h : ∀ x ∈ A, 0 < f x ∧ f x ≤ g x) :
    PointwiseLe (fun x => 1 / g x) (fun x => 1 / f x) A := by
  sorry
/--
`QuotientOrderSignControlled` TODO

Predicate logic:

  ∀ (f₁ g₁ f₂ g₂ : Real → Real) (A : Set Real), ((∀ (x : Real), x ∈ A → (Real.instLE.le 0 (f₁ x) ∧ Real.instLE.le (f₁ x) (g₁ x))) ∧ (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (f₂ x) ∧ Real.instLE.le (f₂ x) (g₂ x)))) → LRA.Analysis.Functions.PointwiseLe (fun x => instHDiv.hDiv (f₁ x) (g₂ x)) (fun x => instHDiv.hDiv (g₁ x) (f₂ x)) A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f₁ g₁ f₂ g₂ : ℝ → ℝ
    A : Set ℝ
  Prove
    ((∀ (x : Real), x ∈ A → (Real.instLE.le 0 (f₁ x) ∧ Real.instLE.le (f₁ x) (g₁ x))) ∧ (∀ (x : Real), x ∈ A → (Real.instLT.lt 0 (f₂ x) ∧ Real.instLE.le (f₂ x) (g₂ x)))) → ∀ (x : Real), x ∈ A → Real.instLE.le ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (f₁ x) (g₂ x)) x) ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (g₁ x) (f₂ x)) x)

Logical form (Lean):

```lean
theorem QuotientOrderSignControlled (f₁ g₁ f₂ g₂ : ℝ → ℝ) (A : Set ℝ)
    (h₁ : ∀ x ∈ A, 0 ≤ f₁ x ∧ f₁ x ≤ g₁ x)
    (h₂ : ∀ x ∈ A, 0 < f₂ x ∧ f₂ x ≤ g₂ x) :
    PointwiseLe (fun x => f₁ x / g₂ x) (fun x => g₁ x / f₂ x) A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem QuotientOrderSignControlled (f₁ g₁ f₂ g₂ : ℝ → ℝ) (A : Set ℝ)
    (h₁ : ∀ x ∈ A, 0 ≤ f₁ x ∧ f₁ x ≤ g₁ x)
    (h₂ : ∀ x ∈ A, 0 < f₂ x ∧ f₂ x ≤ g₂ x) :
    PointwiseLe (fun x => f₁ x / g₂ x) (fun x => g₁ x / f₂ x) A := by
  sorry
/--
`NoUnconditionalQuotientOrderLaw` TODO

Predicate logic:

  ¬ ∀ (f₁ g₁ f₂ g₂ : Real → Real) (A : Set Real), LRA.Analysis.Functions.PointwiseLe f₁ g₁ A → LRA.Analysis.Functions.PointwiseLe f₂ g₂ A → LRA.Analysis.Functions.PointwiseLe (fun x => instHDiv.hDiv (f₁ x) (f₂ x)) (fun x => instHDiv.hDiv (g₁ x) (g₂ x)) A

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (f₁ g₁ f₂ g₂ : Real → Real) (A : Real → Prop), (∀ (x : Real), x ∈ A → Real.instLE.le (f₁ x) (g₁ x)) → (∀ (x : Real), x ∈ A → Real.instLE.le (f₂ x) (g₂ x)) → ∀ (x : Real), x ∈ A → Real.instLE.le ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (f₁ x) (f₂ x)) x) ((fun x => { hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (g₁ x) (g₂ x)) x)) → False

Logical form (Lean):

```lean
theorem NoUnconditionalQuotientOrderLaw :
    ¬ ∀ (f₁ g₁ f₂ g₂ : ℝ → ℝ) (A : Set ℝ),
        PointwiseLe f₁ g₁ A → PointwiseLe f₂ g₂ A →
        PointwiseLe (fun x => f₁ x / f₂ x) (fun x => g₁ x / g₂ x) A
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
theorem NoUnconditionalQuotientOrderLaw :
    ¬ ∀ (f₁ g₁ f₂ g₂ : ℝ → ℝ) (A : Set ℝ),
        PointwiseLe f₁ g₁ A → PointwiseLe f₂ g₂ A →
        PointwiseLe (fun x => f₁ x / f₂ x) (fun x => g₁ x / g₂ x) A := by
  sorry
end LRA.Analysis.Functions
