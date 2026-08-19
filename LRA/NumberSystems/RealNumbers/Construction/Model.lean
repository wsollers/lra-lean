-- LRA/NumberSystems/RealNumbers/Construction/Model.lean
-- Real-number models as Volume I first-order algebraic models.

import LRA.VolumeII.NumberSystems.Models
import LRA.AlgebraicStructures.OrderedField.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers

open LRA.NumberSystems.Models
open LRA.AlgebraicStructures.OrderedField.Interface.Signature
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory

/-!
Volume II label: real-number-model
Lean module: LRA.NumberSystems.RealNumbers.Construction.Model
Verification status: definitions accepted

Moved from `LRA.VolumeII.RealNumbers.Construction.Model`, content
unchanged. Like Rational's `Construction/Model.lean`, there is no switch
here -- `realNumbersModel` takes its `RealModel` as an explicit parameter
rather than selecting one globally.
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
