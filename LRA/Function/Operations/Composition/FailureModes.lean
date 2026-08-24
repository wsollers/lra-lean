import LRA.Function.Operations.Composition.Definition
import LRA.Function.Properties.Definition

namespace LRA.Function

universe u v w

variable {Domain : Type u} {Middle : Type v} {Codomain : Type w}

/--
`ComposeInjectiveOuterNotInjective` TODO

Predicate logic:

  ∀ {Domain : Type u} {Middle : Type v} {Codomain : Type w} (inner : LRA.Function Domain Middle) (outer : LRA.Function Middle Codomain), (outer.Compose inner ∧ .Injective)(¬ outer.Injective)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Middle : Type v} {Codomain : Type w} (inner : Domain → Middle) (outer : Middle → Codomain), (∀ (y : Codomain) (x₁ x₂ : Domain), outer (inner x₁) = y → outer (inner x₂) = y → x₁ = x₂ ∧ (∀ (y : Codomain) (x₁ x₂ : Middle), outer x₁ = y → outer x₂ = y → x₁ = x₂) → False)

Logical form (Lean):

```lean
def ComposeInjectiveOuterNotInjective
    (inner : LRA.Function Domain Middle)
    (outer : LRA.Function Middle Codomain) : Prop :=
  Injective (Compose outer inner) ∧ ¬ Injective outer
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
def ComposeInjectiveOuterNotInjective
    (inner : LRA.Function Domain Middle)
    (outer : LRA.Function Middle Codomain) : Prop :=
  Injective (Compose outer inner) ∧ ¬ Injective outer

/--
`ComposeSurjectiveInnerNotSurjective` TODO

Predicate logic:

  ∀ {Domain : Type u} {Middle : Type v} {Codomain : Type w} (inner : LRA.Function Domain Middle) (outer : LRA.Function Middle Codomain), (outer.Compose inner ∧ .Surjective)(¬ inner.Surjective)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Middle : Type v} {Codomain : Type w} (inner : Domain → Middle) (outer : Middle → Codomain), (∀ (y : Codomain), Exists fun x => outer (inner x) = y ∧ (∀ (y : Middle), Exists fun x => inner x = y) → False)

Logical form (Lean):

```lean
def ComposeSurjectiveInnerNotSurjective
    (inner : LRA.Function Domain Middle)
    (outer : LRA.Function Middle Codomain) : Prop :=
  Surjective (Compose outer inner) ∧ ¬ Surjective inner
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
def ComposeSurjectiveInnerNotSurjective
    (inner : LRA.Function Domain Middle)
    (outer : LRA.Function Middle Codomain) : Prop :=
  Surjective (Compose outer inner) ∧ ¬ Surjective inner

/--
`ComposeBijectiveWithSlackMiddle` TODO

Predicate logic:

  ∀ {Domain : Type u} {Middle : Type v} {Codomain : Type w} (inner : LRA.Function Domain Middle) (outer : LRA.Function Middle Codomain), (outer.Compose inner ∧ .Bijective)(Or (¬ inner.Surjective)(¬ outer.Injective))

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Middle : Type v} {Codomain : Type w} (inner : Domain → Middle) (outer : Middle → Codomain), ((∀ (y : Codomain) (x₁ x₂ : Domain), outer (inner x₁) = y → outer (inner x₂) = y → x₁ = x₂ ∧ ∀ (y : Codomain), Exists fun x => outer (inner x) = y) ∧ Or ((∀ (y : Middle), Exists fun x => inner x = y) → False) ((∀ (y : Codomain) (x₁ x₂ : Middle), outer x₁ = y → outer x₂ = y → x₁ = x₂) → False))

Logical form (Lean):

```lean
def ComposeBijectiveWithSlackMiddle
    (inner : LRA.Function Domain Middle)
    (outer : LRA.Function Middle Codomain) : Prop :=
  Bijective (Compose outer inner) ∧
    (¬ Surjective inner ∨ ¬ Injective outer)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, Or.inl, Or.inr, unfold

-/
def ComposeBijectiveWithSlackMiddle
    (inner : LRA.Function Domain Middle)
    (outer : LRA.Function Middle Codomain) : Prop :=
  Bijective (Compose outer inner) ∧
    (¬ Surjective inner ∨ ¬ Injective outer)

end LRA.Function
