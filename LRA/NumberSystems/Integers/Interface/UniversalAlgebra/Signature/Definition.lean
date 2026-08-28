import LRA.NumberSystems.Integers.Interface.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.NumberSystems.Integers.Interface.UniversalAlgebra

open LRA.NumberSystems.Integers.Interface.Signature

/-- `IntegersAlgebraicSignature` is ℤ's signature restated as a pure
`LRA.Identity.AlgebraicSignature`: the same `add`/`mul`/`neg` operation
symbols and `zero`/`one` constant symbols as `IntegersFirstOrderSignature`,
with no relation symbols — ℤ's order `<` is a first-order-only artifact, not
part of the universal-algebra signature.

Logical form:

```lean
def IntegersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := IntegersFunctionSymbol
  arity := IntegersFirstOrderFunctions.arity
  ConstantSymbol := IntegersConstantSymbol
```
-/
def IntegersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := IntegersFunctionSymbol
  arity := IntegersFirstOrderFunctions.arity
  ConstantSymbol := IntegersConstantSymbol

end LRA.NumberSystems.Integers.Interface.UniversalAlgebra
