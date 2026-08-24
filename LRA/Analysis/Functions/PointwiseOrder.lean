
import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Functions

/--
`PointwiseEq` TODO

Predicate logic:

  ∀ (f g : Real → Real) (A : Set Real) (x : Real), Set.instMembership.mem A x → f x = g x

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop) (x : Real), Set.instMembership.1 A x → f x = g x

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

  ∀ (f g : Real → Real) (A : Set Real) (x : Real), Set.instMembership.mem A x → Real.instLE.le (f x) (g x)

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop) (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (g x)

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

  ∀ (f g : Real → Real) (A : Set Real) (x : Real), Set.instMembership.mem A x → Real.instLT.lt (f x) (g x)

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop) (x : Real), Set.instMembership.1 A x → Real.instLT.1 (f x) (g x)

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

  ∀ f ∈ ℝ → ℝ, PointwiseLe f f A ∧ ∀ f g ∈ ℝ → ℝ, PointwiseLe f g A → PointwiseLe g f A → PointwiseEq f g A ∧ ∀ f g h ∈ ℝ → ℝ, PointwiseLe f g A → PointwiseLe g h A → PointwiseLe f h A

Predicate logic (unfolded):

  ∀ (A : Real → Prop), (∀ (f : Real → Real) (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (f x) ∧ (∀ (f g : Real → Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (g x)) → (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (g x) (f x)) → ∀ (x : Real), Set.instMembership.1 A x → f x = g x ∧ ∀ (f g h : Real → Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (g x)) → (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (g x) (h x)) → ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (h x)))

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

  PointwiseLe f g A

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop), (∀ (x : Real), Set.instMembership.1 A x → Real.instLT.1 (f x) (g x)) → ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (g x)

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

  PointwiseLe (fun x => f x + h x) (fun x => g x + h x) A ∧ PointwiseLe (fun x => -g x) (fun x => -f x) A ∧ ∀ lam ∈ ℝ, 0 ≤ lam → PointwiseLe (fun x => lam * f x (fun x => lam * g x) A) ∧ ∀ lam ∈ ℝ, lam ≤ 0 → PointwiseLe (fun x => lam * g x (fun x => lam * f x) A) ∧ PointwiseLe (fun x => f x + f₂ x) (fun x => g x + g₂ x) A

Predicate logic (unfolded):

  ∀ (f g h f₂ g₂ : Real → Real) (A : Real → Prop), (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f x) (g x) ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f₂ x) (g₂ x)) → (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 ((fun x => instHAdd.1 (f x) (h x)) x) ((fun x => instHAdd.1 (g x) (h x)) x) ∧ (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 ((fun x => Real.instNeg.1 (g x)) x) ((fun x => Real.instNeg.1 (f x)) x) ∧ (∀ (lam : Real), Real.instLE.1 Zero.toOfNat0.1 lam → ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 ((fun x => instHMul.1 lam (f x)) x) ((fun x => instHMul.1 lam (g x)) x) ∧ (∀ (lam : Real), Real.instLE.1 lam Zero.toOfNat0.1 → ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 ((fun x => instHMul.1 lam (g x)) x) ((fun x => instHMul.1 lam (f x)) x) ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 ((fun x => instHAdd.1 (f x) (f₂ x)) x) ((fun x => instHAdd.1 (g x) (g₂ x)) x)))))

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

  (∀ x ∈ A, 0 ≤ f₁ x ∧ f₁ x ≤ g₁ x ∧ ∀ x ∈ A, 0 ≤ f₂ x ∧ f₂ x ≤ g₂ x) → PointwiseLe (fun x => f₁ x * f₂ x) (fun x => g₁ x * g₂ x) A

Predicate logic (unfolded):

  ∀ (f₁ g₁ f₂ g₂ : Real → Real) (A : Real → Prop), (∀ (x : Real), Set.instMembership.1 A x → (Real.instLE.1 Zero.toOfNat0.1 (f₁ x) ∧ Real.instLE.1 (f₁ x) (g₁ x)) ∧ ∀ (x : Real), Set.instMembership.1 A x → (Real.instLE.1 Zero.toOfNat0.1 (f₂ x) ∧ Real.instLE.1 (f₂ x) (g₂ x))) → ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 ((fun x => instHMul.1 (f₁ x) (f₂ x)) x) ((fun x => instHMul.1 (g₁ x) (g₂ x)) x)

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

  (∀ x ∈ A, 0 < f x ∧ f x ≤ g x) → PointwiseLe (fun x => 1 / g x) (fun x => 1 / f x) A

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop), (∀ (x : Real), Set.instMembership.1 A x → (Real.instLT.1 Zero.toOfNat0.1 (f x) ∧ Real.instLE.1 (f x) (g x))) → ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 ((fun x => instHDiv.1 One.toOfNat1.1 (g x)) x) ((fun x => instHDiv.1 One.toOfNat1.1 (f x)) x)

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

  (∀ x ∈ A, 0 ≤ f₁ x ∧ f₁ x ≤ g₁ x ∧ ∀ x ∈ A, 0 < f₂ x ∧ f₂ x ≤ g₂ x) → PointwiseLe (fun x => f₁ x / g₂ x) (fun x => g₁ x / f₂ x) A

Predicate logic (unfolded):

  ∀ (f₁ g₁ f₂ g₂ : Real → Real) (A : Real → Prop), (∀ (x : Real), Set.instMembership.1 A x → (Real.instLE.1 Zero.toOfNat0.1 (f₁ x) ∧ Real.instLE.1 (f₁ x) (g₁ x)) ∧ ∀ (x : Real), Set.instMembership.1 A x → (Real.instLT.1 Zero.toOfNat0.1 (f₂ x) ∧ Real.instLE.1 (f₂ x) (g₂ x))) → ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 ((fun x => instHDiv.1 (f₁ x) (g₂ x)) x) ((fun x => instHDiv.1 (g₁ x) (f₂ x)) x)

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

  ¬ ∀ f₁ g₁ f₂ g₂ ∈ ℝ → ℝ A ∈ Set ℝ, PointwiseLe f₁ g₁ A → PointwiseLe f₂ g₂ A → PointwiseLe (fun x => f₁ x / f₂ x) (fun x => g₁ x / g₂ x) A

Predicate logic (unfolded):

  (∀ (f₁ g₁ f₂ g₂ : Real → Real) (A : Real → Prop), (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f₁ x) (g₁ x)) → (∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (f₂ x) (g₂ x)) → ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 ((fun x => instHDiv.1 (f₁ x) (f₂ x)) x) ((fun x => instHDiv.1 (g₁ x) (g₂ x)) x)) → False

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
