import LRA.Order.Relation.OrderRelation.Definition
import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u

/--
`Preorder` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), (LRA.Relation.Reflexive relation ∧ LRA.Relation.Transitive relation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), (∀ (x : Alpha), relation x x ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)

Logical form (Lean):

```lean
def Preorder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  LRA.Relation.Reflexive relation ∧
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
def Preorder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  LRA.Relation.Reflexive relation ∧
    LRA.Relation.Transitive relation

end LRA.Order

namespace LRA.Order.OrderedSets.Preorder

universe u

/--
`PreorderRelation` TODO

Predicate logic:

  structure PreorderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  isPreorder : LRA.Order.Preorder relation

Predicate logic (unfolded):

  structure PreorderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  isPreorder : LRA.Order.Preorder relation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure PreorderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  isPreorder : LRA.Order.Preorder relation
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
structure PreorderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  isPreorder : LRA.Order.Preorder relation

end LRA.Order.OrderedSets.Preorder
