import LRA.VolumeI.Order.OrderStructures.StrictPartialOrder

namespace LRA.VolumeI.Order

/--
A strict poset is a carrier equipped with a strict partial order.

Logical form:

```lean
structure StrictPoset where
  Carrier : Type u
  StrictOrder : LRA.VolumeI.Relations.Endorelation Carrier
  StrictOrderIsStrictPartialOrder : StrictPartialOrder StrictOrder
```
-/
structure StrictPoset where
  Carrier : Type u
  StrictOrder : LRA.VolumeI.Relations.Endorelation Carrier
  StrictOrderIsStrictPartialOrder : StrictPartialOrder StrictOrder

end LRA.VolumeI.Order
