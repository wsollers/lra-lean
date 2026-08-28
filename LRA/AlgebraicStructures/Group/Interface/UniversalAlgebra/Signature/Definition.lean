import LRA.AlgebraicStructures.Group.Interface.Definitions.Signature
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.AlgebraicStructures.Group.Interface.UniversalAlgebra

open LRA.AlgebraicStructures.Group.Interface.Signature

/-- `GroupAlgebraicSignature` is a group's signature restated as a pure
`LRA.Identity.AlgebraicSignature`: the same `mul`/`inv` operation symbols and
`one` constant symbol as `GroupFirstOrderSignature`, with no relation symbols.

Logical form:

```lean
def GroupAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := GroupFunctionSymbol
  arity := GroupFirstOrderFunctions.arity
  ConstantSymbol := GroupConstantSymbol
```
-/
def GroupAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := GroupFunctionSymbol
  arity := GroupFirstOrderFunctions.arity
  ConstantSymbol := GroupConstantSymbol

end LRA.AlgebraicStructures.Group.Interface.UniversalAlgebra
