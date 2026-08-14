import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Order

universe u

/--
The cover relation induced by a strict order relation.

Logical form:

```lean
def CoverRelation {alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun lower upper =>
    strictRelation lower upper /\
      forall middle,
        Not (strictRelation lower middle /\ strictRelation middle upper)
```
-/
def CoverRelation {alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation alpha) :
    LRA.VolumeI.Relations.Endorelation alpha :=
  fun lower upper =>
    strictRelation lower upper /\
      forall middle,
        Not (strictRelation lower middle /\ strictRelation middle upper)

end LRA.VolumeI.Order
