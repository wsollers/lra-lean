import LRA.VolumeI.Order.OrderedSets.StrictOrder.Definition

namespace LRA.VolumeI.Order

universe u

/--
A dense order is a strict order with a point strictly between every related
pair. Density is intentionally imposed on the strict relation; imposing it on
a reflexive relation would be vacuous.

Logical form:

```lean
def DenseOrder {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  StrictOrder relation /\ LRA.VolumeI.Relations.Dense relation
```
-/
def DenseOrder {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  StrictOrder relation /\ LRA.VolumeI.Relations.Dense relation

end LRA.VolumeI.Order
