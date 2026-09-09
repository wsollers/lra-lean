import LRA.Function.Definition

namespace LRA.Function

universe u v

/--
`Injective` TODO

Predicate logic:

  ∀ {α : Type u} {β : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation α β) (y : β) (x₁ x₂ : α), (R x₁ y ∧ R x₂ y) → x₁ = x₂

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (R x₁ y ∧ R x₂ y) → x₁ = x₂

Logical form (Lean):

```lean
def LeftUnique {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : Prop :=
  ∀ y x₁ x₂, R x₁ y → R x₂ y → x₁ = x₂
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

  ∀ {α : Type u} {β : Type v} (R : LRA.Relation.HeterogeneousBinaryRelation α β) (y : β), Exists fun x => R x y

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun x => R x y

Logical form (Lean):

```lean
def RightTotal {α : Type u} {β : Type v}
    (R : HeterogeneousBinaryRelation α β) : Prop :=
  ∀ y, ∃ x, R x y
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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (y : Codomain) (x₁ x₂ : Domain), function x₁ = y → function x₂ = y → x₁ = x₂) ∧ (∀ (y : Codomain), Exists fun x => function x = y))

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
