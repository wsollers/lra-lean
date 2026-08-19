-- LRA/NumberSystems/RationalNumbers/Construction/Model.lean
-- Rational-number models as Volume I first-order algebraic models.

import LRA.VolumeII.NumberSystems.Models
import LRA.AlgebraicStructures.OrderedField.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RationalNumbers

open LRA.NumberSystems.Models
open LRA.AlgebraicStructures.OrderedField.Interface.Signature
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory

/-!
Volume II label: rational-number-model
Lean module: LRA.NumberSystems.RationalNumbers.Construction.Model
Verification status: definitions accepted

Moved from `LRA.VolumeII.RationalNumbers.Construction.Model`, content
unchanged. Unlike Integer's `Construction/Model.lean`, there is no
switch here -- `rationalNumbersModel` takes its `RationalModel` as an
explicit parameter rather than selecting one globally.
-/


/-- A rational operation bundle as a first-order model of ordered fields.

Logical form:

```lean
def rationalNumbersModel
    (rational_model : RationalModel) :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel rational_model.signature
```
-/
def rationalNumbersModel
    (rational_model : RationalModel) :
    LRA.Logic.FirstOrder.Model OrderedFieldFirstOrderSignature :=
  BuildOrderedFieldModel rational_model.signature

end LRA.NumberSystems.RationalNumbers
