import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Order

universe u

/--
The strict part of a non-strict order relation.

Logical form:

```lean
def StrictPart {alpha : Type u}
    (nonStrictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => nonStrictRelation left right /\ left ≠ right
```
-/
def StrictPart {alpha : Type u}
    (nonStrictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun left right => nonStrictRelation left right /\ left ≠ right

end LRA.VolumeI.Order
