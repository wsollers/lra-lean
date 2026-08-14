import LRA.VolumeI.Order.OrderedSets.Preorder.Definition

namespace LRA.VolumeI.Order

universe u

/--
Partial-order laws for an endorelation.

Logical form:

```lean
def PartialOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Order.OrderedSets.OrderRelation.Relation Alpha) :
    Prop :=
  LRA.VolumeI.Relations.Reflexive relation /\
    LRA.VolumeI.Relations.Antisymmetric relation /\
      LRA.VolumeI.Relations.Transitive relation
```
-/
def PartialOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  LRA.VolumeI.Relations.Reflexive relation /\
    LRA.VolumeI.Relations.Antisymmetric relation /\
      LRA.VolumeI.Relations.Transitive relation

end LRA.VolumeI.Order

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

universe u

/--
A partial-order relation is an endorelation equipped with the theorem that it
satisfies the partial-order laws.

Logical form:

```lean
structure PartialOrderRelation (Carrier : Type u) where
  relation : LRA.VolumeI.Order.OrderedSets.OrderRelation.Relation Carrier
  relationIsPartialOrder : LRA.VolumeI.Order.PartialOrder relation
```
-/
structure PartialOrderRelation (Carrier : Type u) where
  relation : LRA.VolumeI.Order.OrderedSets.OrderRelation.Relation Carrier
  relationIsPartialOrder : LRA.VolumeI.Order.PartialOrder relation

end LRA.VolumeI.Order.OrderedSets.PartialOrder
