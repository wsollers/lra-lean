import LRA.NumberSystems.WholeNumbers.Interface.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.NumberSystems.WholeNumbers.Interface.UniversalAlgebra

open LRA.NumberSystems.WholeNumbers.Interface.Signature

/-- `WholeNumbersAlgebraicSignature` is 𝕎's signature restated as a pure
`LRA.Identity.AlgebraicSignature`: the same `add`/`mul` operation symbols and
`zero`/`one` constant symbols as `WholeNumbersFirstOrderSignature`, with no
relation symbols — 𝕎's order `<` is a first-order-only artifact, not part of
the universal-algebra signature.

Logical form:

```lean
def WholeNumbersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := WholeNumbersFunctionSymbol
  arity := WholeNumbersFirstOrderFunctions.arity
  ConstantSymbol := WholeNumbersConstantSymbol
```
-/
def WholeNumbersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := WholeNumbersFunctionSymbol
  arity := WholeNumbersFirstOrderFunctions.arity
  ConstantSymbol := WholeNumbersConstantSymbol

end LRA.NumberSystems.WholeNumbers.Interface.UniversalAlgebra
