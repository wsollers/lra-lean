import LRA.Function.Properties

namespace LRA.Carrier

universe u

/--
`IsFinite` TODO

Predicate logic:

  ∀ (A : Type u), Exists fun n => Exists fun f => LRA.Function.Bijective f

Predicate logic (unfolded):

  ∀ (A : Type u), Exists fun n => Exists fun f => (∀ (y : Fin n) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : Fin n), Exists fun x => f x = y)

Logical form (Lean):

```lean
def IsFinite (A : Type u) : Prop :=
  ∃ n : Nat, ∃ f : A → Fin n, LRA.Function.Bijective f
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
def IsFinite (A : Type u) : Prop :=
  ∃ n : Nat, ∃ f : A → Fin n, LRA.Function.Bijective f

/--
`IsInfinite` TODO

Predicate logic:

  ∀ (A : Type u), LRA.Carrier.IsFinite A → False

Predicate logic (unfolded):

  ∀ (A : Type u), (Exists fun n => Exists fun f => (∀ (y : Fin n) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : Fin n), Exists fun x => f x = y)) → False

Logical form (Lean):

```lean
def IsInfinite (A : Type u) : Prop :=
  ¬ IsFinite A
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
def IsInfinite (A : Type u) : Prop :=
  ¬ IsFinite A

end LRA.Carrier
