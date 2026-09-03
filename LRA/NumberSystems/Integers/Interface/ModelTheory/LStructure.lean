import LRA.NumberSystems.Integers.Interface.ModelTheory.Model
import LRA.NumberSystems.Integers.Interface.Signature.Definition
import LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory.Model

namespace LRA.NumberSystems.Integers.Interface.ModelTheory

open LRA.NumberSystems.Integers.Interface.Signature
open LRA.AlgebraicStructures.OrderedRing.Interface.ModelTheory

/-- The first-order model of `IntegersFirstOrderSignature` induced by an
`IntegerModel`'s own signature.

Logical form:

```lean
def integersModel (integer_model : IntegerModel) :
    LRA.ModelTheory.FirstOrder.Model IntegersFirstOrderSignature :=
  BuildOrderedRingModel integer_model.signature
```
-/
def integersModel (integer_model : IntegerModel) :
    LRA.ModelTheory.FirstOrder.Model IntegersFirstOrderSignature :=
  BuildOrderedRingModel integer_model.signature

end LRA.NumberSystems.Integers.Interface.ModelTheory
