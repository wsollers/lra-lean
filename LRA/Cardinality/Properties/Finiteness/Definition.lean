
import LRA.Carrier.Finiteness

namespace LRA.Cardinality

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
  LRA.Carrier.IsFinite A
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
def IsFinite (A : Type u) : Prop :=
  LRA.Carrier.IsFinite A

/--
`IsInfinite` TODO

Predicate logic:

  ∀ (A : Type u), LRA.Carrier.IsFinite A → False

Predicate logic (unfolded):

  ∀ (A : Type u), (Exists fun n => Exists fun f => (∀ (y : Fin n) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : Fin n), Exists fun x => f x = y)) → False

Logical form (Lean):

```lean
def IsInfinite (A : Type u) : Prop :=
  LRA.Carrier.IsInfinite A
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
  LRA.Carrier.IsInfinite A

/--
`IsDedekindInfinite` TODO

Predicate logic:

  ∀ (A : Type u), Exists fun f => (LRA.Function.Injective f ∧ ¬ LRA.Function.Surjective f)

Predicate logic (unfolded):

  ∀ (A : Type u), Exists fun f => (∀ (y x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ (∀ (y : A), Exists fun x => f x = y) → False)

Logical form (Lean):

```lean
def IsDedekindInfinite (A : Type u) : Prop :=
  ∃ f : A → A, LRA.Function.Injective f ∧ ¬ LRA.Function.Surjective f
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
def IsDedekindInfinite (A : Type u) : Prop :=
  ∃ f : A → A, LRA.Function.Injective f ∧ ¬ LRA.Function.Surjective f

/--
`IsDedekindFinite` TODO

Predicate logic:

  ∀ (A : Type u), LRA.Cardinality.IsDedekindInfinite A → False

Predicate logic (unfolded):

  ∀ (A : Type u), (Exists fun f => (∀ (y x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ (∀ (y : A), Exists fun x => f x = y) → False)) → False

Logical form (Lean):

```lean
def IsDedekindFinite (A : Type u) : Prop :=
  ¬ IsDedekindInfinite A
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
def IsDedekindFinite (A : Type u) : Prop :=
  ¬ IsDedekindInfinite A

end LRA.Cardinality
