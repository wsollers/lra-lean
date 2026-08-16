import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.Order

universe u

/--
The strict part of a non-strict order relation.

Logical form:

```lean
def StrictPart {alpha : Type u}
    (nonStrictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  fun left right => nonStrictRelation left right /\ left ≠ right
```
-/
def StrictPart {alpha : Type u}
    (nonStrictRelation : LRA.Relation.Endorelation alpha) :
    LRA.Relation.Endorelation alpha :=
  fun left right => nonStrictRelation left right /\ left ≠ right

end LRA.Order
