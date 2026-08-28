import LRA.NumberSystems.RealNumbers.Interface.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.NumberSystems.RealNumbers.Interface.UniversalAlgebra

open LRA.NumberSystems.RealNumbers.Interface.Signature

/-- `RealNumbersAlgebraicSignature` is ℝ's signature restated as a pure
`LRA.Identity.AlgebraicSignature`: the same `add`/`mul`/`neg`/`inv` operation
symbols and `zero`/`one` constant symbols as `RealNumbersFirstOrderSignature`,
with no relation symbols — ℝ's order `<` and completeness are first-order
(and second-order, for completeness) artifacts, not part of the
universal-algebra signature.

Logical form:

```lean
def RealNumbersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := RealNumbersFunctionSymbol
  arity := RealNumbersFirstOrderFunctions.arity
  ConstantSymbol := RealNumbersConstantSymbol
```
-/
def RealNumbersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := RealNumbersFunctionSymbol
  arity := RealNumbersFirstOrderFunctions.arity
  ConstantSymbol := RealNumbersConstantSymbol

end LRA.NumberSystems.RealNumbers.Interface.UniversalAlgebra
