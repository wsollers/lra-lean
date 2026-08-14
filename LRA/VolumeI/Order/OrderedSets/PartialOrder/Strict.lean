import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

universe u

/--
A strict partial order is an endorelation satisfying irreflexivity and
transitivity. This is the relation usually written `<`.

Logical form:

```lean
LRA.VolumeI.Order.StrictPartialOrder relation
```
-/
structure StrictPartialOrder (Carrier : Type u) where
  relation : Relation Carrier
  isStrictPartialOrder : LRA.VolumeI.Order.StrictPartialOrder relation

end LRA.VolumeI.Order.OrderedSets.PartialOrder
