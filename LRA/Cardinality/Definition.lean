
import LRA.Function.Properties.Definition

namespace LRA.Cardinality

universe u v

/--
`Equinumerous` TODO

Predicate logic:

  ∀ (A : Type u) (B : Type v), Exists fun f => LRA.Function.Bijective f

Predicate logic (unfolded):

  ∀ (A : Type u) (B : Type v), Exists fun f => (∀ (y : B) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : B), Exists fun x => f x = y)

Logical form (Lean):

```lean
def Equinumerous (A : Type u) (B : Type v) : Prop :=
  ∃ f : A → B, LRA.Function.Bijective f
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
def Equinumerous (A : Type u) (B : Type v) : Prop :=
  ∃ f : A → B, LRA.Function.Bijective f

/--
`Dominates` TODO

Predicate logic:

  ∀ (A : Type u) (B : Type v), Exists fun f => LRA.Function.Injective f

Predicate logic (unfolded):

  ∀ (A : Type u) (B : Type v), Exists fun f => ∀ (y : B) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂

Logical form (Lean):

```lean
def Dominates (A : Type u) (B : Type v) : Prop :=
  ∃ f : A → B, LRA.Function.Injective f
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
def Dominates (A : Type u) (B : Type v) : Prop :=
  ∃ f : A → B, LRA.Function.Injective f

/--
`StrictlyDominates` TODO

Predicate logic:

  ∀ (A : Type u) (B : Type v), (LRA.Cardinality.Dominates A B ∧ ¬ LRA.Cardinality.Equinumerous A B)

Predicate logic (unfolded):

  ∀ (A : Type u) (B : Type v), (Exists fun f => ∀ (y : B) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ (Exists fun f => (∀ (y : B) (x₁ x₂ : A), f x₁ = y → f x₂ = y → x₁ = x₂ ∧ ∀ (y : B), Exists fun x => f x = y)) → False)

Logical form (Lean):

```lean
def StrictlyDominates (A : Type u) (B : Type v) : Prop :=
  Dominates A B ∧ ¬ Equinumerous A B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def StrictlyDominates (A : Type u) (B : Type v) : Prop :=
  Dominates A B ∧ ¬ Equinumerous A B

end LRA.Cardinality
