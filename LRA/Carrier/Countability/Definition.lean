import LRA.Function.Properties

namespace LRA.Carrier

universe u

/--
`IsCountable` TODO

Predicate logic:

  ∀ (A : Type u), Exists fun f => LRA.Function.Injective f

Predicate logic (unfolded):

  ∀ (A : Type u), Exists fun f => ∀ (y : Nat) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂

Logical form (Lean):

```lean
def IsCountable (A : Type u) : Prop :=
  ∃ f : A → Nat, LRA.Function.Injective f
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
def IsCountable (A : Type u) : Prop :=
  ∃ f : A → Nat, LRA.Function.Injective f

/--
`IsCountablyInfinite` TODO

Predicate logic:

  ∀ (A : Type u), Exists fun f => LRA.Function.Bijective f

Predicate logic (unfolded):

  ∀ (A : Type u), Exists fun f => (∀ (y : Nat) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : Nat), Exists fun x => f x = y)

Logical form (Lean):

```lean
def IsCountablyInfinite (A : Type u) : Prop :=
  ∃ f : A → Nat, LRA.Function.Bijective f
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
def IsCountablyInfinite (A : Type u) : Prop :=
  ∃ f : A → Nat, LRA.Function.Bijective f

/--
`IsUncountable` TODO

Predicate logic:

  ∀ (A : Type u), LRA.Carrier.IsCountable A → False

Predicate logic (unfolded):

  ∀ (A : Type u), (Exists fun f => ∀ (y : Nat) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂) → False

Logical form (Lean):

```lean
def IsUncountable (A : Type u) : Prop :=
  ¬ IsCountable A
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def IsUncountable (A : Type u) : Prop :=
  ¬ IsCountable A

end LRA.Carrier
