import LRA.VolumeI.Order.StrictLinearOrder

namespace LRA.VolumeI.Order

universe u

/--
A dense linear order is a strict linear order whose strict relation is dense.

Logical form:

```lean
def DenseLinearOrder {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  StrictLinearOrder relation /\ LRA.VolumeI.Relations.Dense relation
```
-/
def DenseLinearOrder {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  StrictLinearOrder relation /\ LRA.VolumeI.Relations.Dense relation

end LRA.VolumeI.Order
