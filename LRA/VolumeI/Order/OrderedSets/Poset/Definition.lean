import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition

namespace LRA.VolumeI.Order

universe u

/--
A poset is a carrier equipped with a non-strict partial order.

Logical form:

```lean
structure Poset where
  Carrier : Type u
  NonStrictOrder : LRA.VolumeI.Relations.Endorelation Carrier
  NonStrictOrderIsPartialOrder : LRA.VolumeI.Order.PartialOrder NonStrictOrder
```
-/
structure Poset where
  Carrier : Type u
  NonStrictOrder : LRA.VolumeI.Relations.Endorelation Carrier
  NonStrictOrderIsPartialOrder : LRA.VolumeI.Order.PartialOrder NonStrictOrder

end LRA.VolumeI.Order
