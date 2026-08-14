import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Order

universe u

/--
Non-strict relation obtained by adjoining equality to a strict relation.

Logical form:

```lean
def LessThanOrEqual {alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => strictRelation left right \/ left = right
```
-/
def LessThanOrEqual {alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => strictRelation left right \/ left = right

end LRA.VolumeI.Order
