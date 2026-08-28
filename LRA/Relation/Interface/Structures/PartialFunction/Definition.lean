import LRA.Relation.Interface.Laws.Definition

namespace LRA.Relation

universe u v

/--
`PartialFunctionRelation` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (relation : LRA.Relation.HeterogeneousBinaryRelation Domain Codomain) (x : Domain) (y₁ y₂ : Codomain), (relation x y₁ ∧ relation x y₂) → y₁ = y₂

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (relation : Domain → Codomain → Prop) (x : Domain) (y₁ y₂ : Codomain), (relation x y₁ ∧ relation x y₂) → y₁ = y₂

Logical form (Lean):

```lean
def PartialFunctionRelation
    {Domain : Type u} {Codomain : Type v}
    (relation : HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  RightUnique relation
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
def PartialFunctionRelation
    {Domain : Type u} {Codomain : Type v}
    (relation : HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  RightUnique relation

/--
`PartialFunction` TODO

Predicate logic:

  structure PartialFunction
    (Domain : Type u) (Codomain : Type v) where
  graph : HeterogeneousBinaryRelation Domain Codomain
  rightUnique : RightUnique graph

Predicate logic (unfolded):

  structure PartialFunction
    (Domain : Type u) (Codomain : Type v) where
  graph : HeterogeneousBinaryRelation Domain Codomain
  rightUnique : RightUnique graph (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure PartialFunction
    (Domain : Type u) (Codomain : Type v) where
  graph : HeterogeneousBinaryRelation Domain Codomain
  rightUnique : RightUnique graph
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
structure PartialFunction
    (Domain : Type u) (Codomain : Type v) where
  graph : HeterogeneousBinaryRelation Domain Codomain
  rightUnique : RightUnique graph

/--
`PartialEndofunction` TODO

Predicate logic:

  abbrev PartialEndofunction (Carrier : Type u) :=
  PartialFunction Carrier Carrier

Predicate logic (unfolded):

  abbrev PartialEndofunction (Carrier : Type u) :=
  PartialFunction Carrier Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev PartialEndofunction (Carrier : Type u) :=
  PartialFunction Carrier Carrier
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
abbrev PartialEndofunction (Carrier : Type u) :=
  PartialFunction Carrier Carrier

end LRA.Relation
