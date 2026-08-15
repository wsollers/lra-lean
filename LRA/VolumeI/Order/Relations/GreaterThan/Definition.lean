import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.Order

universe u

/--
Greater-than relation derived by reversing a strict order relation.

Logical form:

```lean
def GreaterThan {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  LRA.Relation.Converse strictRelation
```
-/
def GreaterThan {alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  fun left right => strictRelation right left

end LRA.Order
