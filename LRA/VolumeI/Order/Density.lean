import LRA.VolumeI.Order.LinearOrder

namespace LRA.VolumeI.Order

universe u

/--
A dense order is an order whose comparison relation is dense.

Logical form:

```lean
def DenseOrder {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  PartialOrder relation /\ LRA.VolumeI.Relations.Dense relation
```
-/
def DenseOrder {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  PartialOrder relation /\ LRA.VolumeI.Relations.Dense relation

/--
A dense linear order is both linear and dense.

Logical form:

```lean
def DenseLinearOrder {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  LinearOrder relation /\ LRA.VolumeI.Relations.Dense relation
```
-/
def DenseLinearOrder {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  LinearOrder relation /\ LRA.VolumeI.Relations.Dense relation

end LRA.VolumeI.Order
