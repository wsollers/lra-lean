import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition

namespace LRA.VolumeI.Order

universe u

/--
A join of two elements is their least upper bound.

Logical form:

```lean
def Join {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (left right join : alpha) : Prop :=
  relation left join /\ relation right join /\
    forall upper,
      relation left upper -> relation right upper -> relation join upper
```
-/
def Join {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (left right join : alpha) : Prop :=
  relation left join /\ relation right join /\
    forall upper,
      relation left upper -> relation right upper -> relation join upper

end LRA.VolumeI.Order
