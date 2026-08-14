import LRA.VolumeI.Order.OrderStructures.PartialOrder

namespace LRA.VolumeI.Order

/--
A poset is a carrier equipped with a partial order.

Logical form:

```lean
structure Poset where
  Carrier : Type u
  NonStrictOrder : LRA.VolumeI.Relations.Endorelation Carrier
  NonStrictOrderIsPartialOrder : PartialOrder NonStrictOrder
```
-/
structure Poset where
  Carrier : Type u
  NonStrictOrder : LRA.VolumeI.Relations.Endorelation Carrier
  NonStrictOrderIsPartialOrder : PartialOrder NonStrictOrder

end LRA.VolumeI.Order
