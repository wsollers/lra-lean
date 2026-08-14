import LRA.VolumeI.Operations.Operations
import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Order

universe u

/--
Positive right multiplication preserves strict order.

Logical form:

```lean
def PreservesPositiveRightMultiplication {alpha : Type u}
    (strictOrderRelation : LRA.VolumeI.Relations.Endorelation alpha)
    (mul : LRA.VolumeI.Operations.BinaryOperation alpha)
    (zero : alpha) : Prop :=
  forall first second positive,
    strictOrderRelation zero positive ->
    strictOrderRelation first second ->
    strictOrderRelation (mul first positive) (mul second positive)
```
-/
def PreservesPositiveRightMultiplication {alpha : Type u}
    (strictOrderRelation : LRA.VolumeI.Relations.Endorelation alpha)
    (mul : LRA.VolumeI.Operations.BinaryOperation alpha)
    (zero : alpha) : Prop :=
  forall first second positive,
    strictOrderRelation zero positive ->
    strictOrderRelation first second ->
    strictOrderRelation (mul first positive) (mul second positive)

end LRA.VolumeI.Order
