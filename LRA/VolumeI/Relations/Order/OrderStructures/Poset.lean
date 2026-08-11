import LRA.VolumeI.Relations.Order.OrderStructures.PartialOrder

namespace LRA.VolumeI.Relations.Order

/--
A poset is a carrier equipped with a partial order.

Logical form:

```lean
structure Poset where
  Carrier : Type u
  Relation : LRA.VolumeI.Relations.Endorelation Carrier
  RelationIsPartialOrder : PartialOrder Relation
```
-/
structure Poset where
  Carrier : Type u
  Relation : LRA.VolumeI.Relations.Endorelation Carrier
  RelationIsPartialOrder : PartialOrder Relation

end LRA.VolumeI.Relations.Order
