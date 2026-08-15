import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u

/--
A poset is a carrier equipped with a non-strict partial order.

Logical form:

```lean
structure Poset where
  Carrier : Type u
  NonStrictOrder : LRA.Relation.Endorelation Carrier
  NonStrictOrderIsPartialOrder : LRA.Order.PartialOrder NonStrictOrder
```
-/
structure Poset where
  Carrier : Type u
  NonStrictOrder : LRA.Relation.Endorelation Carrier
  NonStrictOrderIsPartialOrder : LRA.Order.PartialOrder NonStrictOrder

end LRA.Order
