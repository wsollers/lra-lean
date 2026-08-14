import LRA.VolumeI.Relations.Order.OrderStructures.PartialOrder

namespace LRA.VolumeI.Relations.Order

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

end LRA.VolumeI.Relations.Order
