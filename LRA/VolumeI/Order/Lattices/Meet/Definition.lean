import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition

namespace LRA.VolumeI.Order

universe u

/--
A meet of two elements is their greatest lower bound.

Logical form:

```lean
def Meet {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (left right meet : alpha) : Prop :=
  relation meet left /\ relation meet right /\
    forall lower,
      relation lower left -> relation lower right -> relation lower meet
```
-/
def Meet {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (left right meet : alpha) : Prop :=
  relation meet left /\ relation meet right /\
    forall lower,
      relation lower left -> relation lower right -> relation lower meet

end LRA.VolumeI.Order
