import LRA.Function.Definition

namespace LRA.Function

universe u v

/--
`Injective` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (y : Codomain) (x₁ x₂ : Domain), (function.Graph x₁ y ∧ function.Graph x₂ y) → x₁ = x₂

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (y : Codomain) (x₁ x₂ : Domain), (function x₁ = y ∧ function x₂ = y) → x₁ = x₂

Logical form (Lean):

```lean
abbrev Injective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  LRA.Relation.LeftUnique (Graph function)
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
abbrev Injective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  LRA.Relation.LeftUnique (Graph function)

/--
`Surjective` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (y : Codomain), Exists fun x => function.Graph x y

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (y : Codomain), Exists fun x => function x = y

Logical form (Lean):

```lean
abbrev Surjective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  LRA.Relation.RightTotal (Graph function)
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
abbrev Surjective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  LRA.Relation.RightTotal (Graph function)

/--
`Bijective` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), (function.Injective ∧ function.Surjective)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), (∀ (y : Codomain) (x₁ x₂ : Domain), function x₁ = y → function x₂ = y → x₁ = x₂ ∧ ∀ (y : Codomain), Exists fun x => function x = y)

Logical form (Lean):

```lean
def Bijective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  Injective function ∧ Surjective function
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
def Bijective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  Injective function ∧ Surjective function

end LRA.Function
