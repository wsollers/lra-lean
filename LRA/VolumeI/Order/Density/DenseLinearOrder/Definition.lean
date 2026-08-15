import LRA.VolumeI.Order.OrderedSets.StrictLinearOrder.Definition

namespace LRA.Order

universe u

/--
A dense linear order is a strict linear order whose strict relation is dense.

Logical form:

```lean
def DenseLinearOrder {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  StrictLinearOrder relation /\ LRA.Relation.Dense relation
```
-/
def DenseLinearOrder {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  StrictLinearOrder relation /\ LRA.Relation.Dense relation

end LRA.Order
