import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Order

universe u

/--
Greater-than relation derived by reversing a strict order relation.

Logical form:

```lean
def GreaterThan {alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  LRA.VolumeI.Relations.Converse strictRelation
```
-/
def GreaterThan {alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => strictRelation right left

end LRA.VolumeI.Order
