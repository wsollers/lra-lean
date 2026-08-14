import LRA.VolumeI.Order.Relations.GreaterThan.Definition

namespace LRA.VolumeI.Order

universe u

/--
Greater-than-or-equal relation obtained from a strict relation.

Logical form:

```lean
def GreaterThanOrEqual {alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => GreaterThan strictRelation left right \/ left = right
```
-/
def GreaterThanOrEqual {alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => GreaterThan strictRelation left right \/ left = right

end LRA.VolumeI.Order
