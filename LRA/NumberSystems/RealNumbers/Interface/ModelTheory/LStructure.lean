import LRA.NumberSystems.RealNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.RealNumbers.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RealNumbers.Interface.ModelTheory

open LRA.NumberSystems.RealNumbers.Interface.Signature
open LRA.AlgebraicStructures.OrderedField.Interface.ModelTheory

/-- The first-order model of `RealNumbersFirstOrderSignature` induced by a
`RealModel`'s own signature.

Logical form:

```lean
def realNumbersModel (real_model : RealModel) :
    LRA.ModelTheory.FirstOrder.Model RealNumbersFirstOrderSignature :=
  BuildOrderedFieldModel real_model.signature
```
-/
def realNumbersModel (real_model : RealModel) :
    LRA.ModelTheory.FirstOrder.Model RealNumbersFirstOrderSignature :=
  BuildOrderedFieldModel real_model.signature

end LRA.NumberSystems.RealNumbers.Interface.ModelTheory
