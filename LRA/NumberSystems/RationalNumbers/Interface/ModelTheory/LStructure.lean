import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.RationalNumbers.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RationalNumbers.Interface.ModelTheory

open LRA.NumberSystems.RationalNumbers.Interface.Signature
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory

/-- The first-order model of `RationalNumbersFirstOrderSignature` induced by
a `RationalModel`'s own signature.

Logical form:

```lean
def rationalNumbersModel (rational_model : RationalModel) :
    LRA.ModelTheory.FirstOrder.Model RationalNumbersFirstOrderSignature :=
  BuildOrderedFieldModel rational_model.signature
```
-/
def rationalNumbersModel (rational_model : RationalModel) :
    LRA.ModelTheory.FirstOrder.Model RationalNumbersFirstOrderSignature :=
  BuildOrderedFieldModel rational_model.signature

end LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
