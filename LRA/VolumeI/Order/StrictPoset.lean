import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition

namespace LRA.VolumeI.Order

/--
A strict poset is a carrier equipped with a strict order.

Logical form:

```lean
structure StrictPoset where
  Carrier : Type u
  StrictOrder : LRA.VolumeI.Relations.Endorelation Carrier
  StrictOrderIsStrictOrder : LRA.VolumeI.Order.StrictOrder StrictOrder
```
-/
structure StrictPoset where
  Carrier : Type u
  StrictOrder : LRA.VolumeI.Relations.Endorelation Carrier
  StrictOrderIsStrictOrder : LRA.VolumeI.Order.StrictOrder StrictOrder

end LRA.VolumeI.Order
