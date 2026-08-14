import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

universe u

/--
Compatibility name: a non-strict partial order is a partial-order relation,
usually written `<=`.

Logical form:

```lean
PartialOrderRelation Carrier
```
-/
abbrev NonStrictPartialOrder (Carrier : Type u) :=
  PartialOrderRelation Carrier

end LRA.VolumeI.Order.OrderedSets.PartialOrder
