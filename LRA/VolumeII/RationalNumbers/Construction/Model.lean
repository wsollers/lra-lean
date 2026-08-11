-- LRA/VolumeII/RationalNumbers/Construction/Model.lean
-- Rational-number models as Volume I first-order algebraic models.

import LRA.VolumeI.Algebra.Models

namespace LRA.VolumeII.RationalNumbers

open LRA.VolumeI.Algebra.Models

/-!
Volume II label: rational-number-model
Lean module: LRA.VolumeII.RationalNumbers.Construction.Model
Verification status: definitions accepted
-/


/-- A rational operation bundle as a first-order model of ordered fields.

Mathematical statement (Lean): `def rationalNumbersModel (rational_model : RationalModel) : LRA.VolumeI.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature`.


Logical form:

```lean
def rationalNumbersModel
    (rational_model : RationalModel) :
    LRA.VolumeI.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel rational_model.signature
```
-/
def rationalNumbersModel
    (rational_model : RationalModel) :
    LRA.VolumeI.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel rational_model.signature

end LRA.VolumeII.RationalNumbers
