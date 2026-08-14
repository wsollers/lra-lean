import LRA.VolumeI.Order.Relations.OrderRelation.Definition

namespace LRA.VolumeI.Order

universe u

/--
Strict-order laws for an endorelation.

Logical form:

```lean
def StrictOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Order.OrderedSets.OrderRelation Alpha) :
    Prop :=
  LRA.VolumeI.Relations.Irreflexive relation /\
    LRA.VolumeI.Relations.Transitive relation
```
-/
def StrictOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Order.OrderedSets.OrderRelation Alpha) :
    Prop :=
  LRA.VolumeI.Relations.Irreflexive relation /\
    LRA.VolumeI.Relations.Transitive relation

end LRA.VolumeI.Order

namespace LRA.VolumeI.Order.OrderedSets.StrictOrder

universe u

/--
A strict-order relation is an endorelation equipped with the theorem that it
satisfies the strict-order laws.

Logical form:

```lean
structure StrictOrderRelation (Carrier : Type u) where
  relation : LRA.VolumeI.Order.OrderedSets.OrderRelation Carrier
  relationIsStrictOrder : LRA.VolumeI.Order.StrictOrder relation
```
-/
structure StrictOrderRelation (Carrier : Type u) where
  relation : LRA.VolumeI.Order.OrderedSets.OrderRelation Carrier
  relationIsStrictOrder : LRA.VolumeI.Order.StrictOrder relation

end LRA.VolumeI.Order.OrderedSets.StrictOrder
