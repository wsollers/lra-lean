-- LRA/VolumeII/RealNumbers/Construction/Model.lean
-- Real-number models as Volume I first-order algebraic models.

import LRA.VolumeI.Algebra.Models

namespace LRA.VolumeII.RealNumbers

open LRA.VolumeI.Algebra.Models

/-!
Volume II label: real-number-model
Lean module: LRA.VolumeII.RealNumbers.Construction.Model
Verification status: definitions accepted
-/


/-- A real operation bundle as a first-order model of ordered fields.

Mathematical statement (Lean): `def realNumbersModel (real_model : RealModel) : LRA.VolumeI.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature`.


Logical form:

```lean
def realNumbersModel
    (real_model : RealModel) :
    LRA.VolumeI.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel real_model.signature
```
-/
def realNumbersModel
    (real_model : RealModel) :
    LRA.VolumeI.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel real_model.signature

end LRA.VolumeII.RealNumbers
