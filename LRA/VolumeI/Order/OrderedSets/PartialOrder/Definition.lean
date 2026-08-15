import LRA.VolumeI.Order.OrderedSets.Preorder.Definition

namespace LRA.Order

universe u

/--
Partial-order laws for an endorelation.

Logical form:

```lean
def PartialOrder {Alpha : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Alpha) :
    Prop :=
  LRA.Relation.Reflexive relation /\
    LRA.Relation.Antisymmetric relation /\
      LRA.Relation.Transitive relation
```
-/
def PartialOrder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  LRA.Relation.Reflexive relation /\
    LRA.Relation.Antisymmetric relation /\
      LRA.Relation.Transitive relation

end LRA.Order

namespace LRA.Order.OrderedSets.PartialOrder

universe u

/--
A partial-order relation is an endorelation equipped with the theorem that it
satisfies the partial-order laws.

Logical form:

```lean
structure PartialOrderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  relationIsPartialOrder : LRA.Order.PartialOrder relation
```
-/
structure PartialOrderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  relationIsPartialOrder : LRA.Order.PartialOrder relation

end LRA.Order.OrderedSets.PartialOrder
