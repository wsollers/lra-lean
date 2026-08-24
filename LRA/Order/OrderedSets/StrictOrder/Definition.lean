import LRA.Order.Relation.OrderRelation.Definition
import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u

/--
`StrictOrder` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation : LRA.Order.OrderedSets.OrderRelation Alpha), (LRA.Relation.Irreflexive relation ∧ LRA.Relation.Transitive relation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), (∀ (x : Alpha), relation x x → False ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)

Logical form (Lean):

```lean
def StrictOrder {Alpha : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Alpha) : Prop :=
  LRA.Relation.Irreflexive relation ∧
    LRA.Relation.Transitive relation
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
def StrictOrder {Alpha : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Alpha) : Prop :=
  LRA.Relation.Irreflexive relation ∧
    LRA.Relation.Transitive relation

end LRA.Order

namespace LRA.Order.OrderedSets.StrictOrder

universe u

/--
`StrictOrderRelation` TODO

Predicate logic:

  structure StrictOrderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  relationIsStrictOrder : LRA.Order.StrictOrder relation

Predicate logic (unfolded):

  structure StrictOrderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  relationIsStrictOrder : LRA.Order.StrictOrder relation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure StrictOrderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  relationIsStrictOrder : LRA.Order.StrictOrder relation
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
structure StrictOrderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  relationIsStrictOrder : LRA.Order.StrictOrder relation

end LRA.Order.OrderedSets.StrictOrder
