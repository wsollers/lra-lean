import LRA.Order.OrderedSets.Preorder.Definition

namespace LRA.Order

universe u

/--
`PartialOrder` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), (LRA.Relation.Reflexive relation ∧ (LRA.Relation.Antisymmetric relation ∧ LRA.Relation.Transitive relation))

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), (∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x → x = y ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z))

Logical form (Lean):

```lean
def PartialOrder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  LRA.Relation.Reflexive relation ∧
    LRA.Relation.Antisymmetric relation ∧
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
def PartialOrder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  LRA.Relation.Reflexive relation ∧
    LRA.Relation.Antisymmetric relation ∧
      LRA.Relation.Transitive relation

end LRA.Order

namespace LRA.Order.OrderedSets.PartialOrder

universe u

/--
`PartialOrderRelation` TODO

Predicate logic:

  structure PartialOrderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  relationIsPartialOrder : LRA.Order.PartialOrder relation

Predicate logic (unfolded):

  structure PartialOrderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  relationIsPartialOrder : LRA.Order.PartialOrder relation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure PartialOrderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  relationIsPartialOrder : LRA.Order.PartialOrder relation
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
structure PartialOrderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  relationIsPartialOrder : LRA.Order.PartialOrder relation

end LRA.Order.OrderedSets.PartialOrder
