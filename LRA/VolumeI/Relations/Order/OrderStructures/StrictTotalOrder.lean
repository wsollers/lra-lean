import LRA.VolumeI.Relations.Order.OrderStructures.StrictLinearOrder

namespace LRA.VolumeI.Relations.Order

universe u

/--
Compatibility synonym for strict linear order.

Logical form:

```lean
def StrictTotalOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  StrictLinearOrder relation
```
-/
def StrictTotalOrder {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  StrictLinearOrder relation

end LRA.VolumeI.Relations.Order
