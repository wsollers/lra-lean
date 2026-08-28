import LRA.NumberSystems.RationalNumbers.Interface.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.NumberSystems.RationalNumbers.Interface.UniversalAlgebra

open LRA.NumberSystems.RationalNumbers.Interface.Signature

/-- `RationalNumbersAlgebraicSignature` is ℚ's signature restated as a pure
`LRA.Identity.AlgebraicSignature`: the same `add`/`mul`/`neg`/`inv` operation
symbols and `zero`/`one` constant symbols as `RationalNumbersFirstOrderSignature`,
with no relation symbols — ℚ's order `<` is a first-order-only artifact, not
part of the universal-algebra signature.

Logical form:

```lean
def RationalNumbersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := RationalNumbersFunctionSymbol
  arity := RationalNumbersFirstOrderFunctions.arity
  ConstantSymbol := RationalNumbersConstantSymbol
```
-/
def RationalNumbersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := RationalNumbersFunctionSymbol
  arity := RationalNumbersFirstOrderFunctions.arity
  ConstantSymbol := RationalNumbersConstantSymbol

end LRA.NumberSystems.RationalNumbers.Interface.UniversalAlgebra
