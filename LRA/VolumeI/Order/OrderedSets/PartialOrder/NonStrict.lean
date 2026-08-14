import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

universe u

/--
A non-strict partial order is an endorelation satisfying reflexivity,
antisymmetry, and transitivity. This is the relation usually written `<=`.

Logical form:

```lean
LRA.VolumeI.Order.PartialOrder relation
```
-/
structure NonStrictPartialOrder (Carrier : Type u) where
  relation : Relation Carrier
  isPartialOrder : LRA.VolumeI.Order.PartialOrder relation

end LRA.VolumeI.Order.OrderedSets.PartialOrder
