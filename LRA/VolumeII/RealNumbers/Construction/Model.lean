-- LRA/VolumeII/RealNumbers/Construction/Model.lean
-- Real-number models as Volume I first-order algebraic models.

import LRA.VolumeI.UniversalAlgebra.Models
import LRA.VolumeI.AlgebraicStructures.OrderedField.ModelTheory.All

namespace LRA.NumberSystems.RealNumbers

open LRA.UniversalAlgebra.Models
open LRA.AlgebraicStructures.OrderedField.ModelTheory

/-!
Volume II label: real-number-model
Lean module: LRA.NumberSystems.RealNumbers.Construction.Model
Verification status: definitions accepted
-/


/-- A real operation bundle as a first-order model of ordered fields.

Mathematical statement (Lean): `def realNumbersModel (real_model : RealModel) : LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature`.


Logical form:

```lean
def realNumbersModel
    (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel real_model.signature
```
-/
def realNumbersModel
    (real_model : RealModel) :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel real_model.signature

end LRA.NumberSystems.RealNumbers
