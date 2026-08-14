import LRA.VolumeI.Operations.Operations
import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.VolumeI.Order

universe u

/--
Strict order is preserved by right translation under a binary operation.

Logical form:

```lean
def StrictlyPreservesRightTranslation {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (operation : LRA.VolumeI.Operations.BinaryOperation alpha) : Prop :=
  forall first second translation,
    relation first second ->
    relation (operation first translation) (operation second translation)
```
-/
def StrictlyPreservesRightTranslation {alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation alpha)
    (operation : LRA.VolumeI.Operations.BinaryOperation alpha) : Prop :=
  forall first second translation,
    relation first second ->
    relation (operation first translation) (operation second translation)

end LRA.VolumeI.Order
