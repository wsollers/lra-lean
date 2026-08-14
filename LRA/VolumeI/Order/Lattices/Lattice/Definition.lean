import LRA.VolumeI.Order.Lattices.Join.Definition
import LRA.VolumeI.Order.Lattices.Meet.Definition

namespace LRA.VolumeI.Order

universe u

/--
Lattice laws: every pair has a join and a meet.

Logical form:

```lean
def Lattice {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  PartialOrder relation /\
    forall left right : alpha,
      (exists join, Join relation left right join) /\
        (exists meet, Meet relation left right meet)
```
-/
def Lattice {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha) : Prop :=
  PartialOrder relation /\
    forall left right : alpha,
      (exists join, Join relation left right join) /\
        (exists meet, Meet relation left right meet)

end LRA.VolumeI.Order
