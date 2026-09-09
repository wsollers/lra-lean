import LRA.NumberSystems.SuccessorArithmetic.Interface.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.UniversalAlgebra

open LRA.NumberSystems.SuccessorArithmetic.Interface.Signature

/--
`SuccessorArithmeticAlgebraicSignature` TODO

Predicate logic:

  def SuccessorArithmeticAlgebraicSignature : LRA.Identity.AlgebraicSignature where
    OperationSymbol := SuccessorArithmeticFunctionSymbol
    arity := SuccessorArithmeticFirstOrderFunctions.arity
    ConstantSymbol := SuccessorArithmeticConstantSymbol

Predicate logic (unfolded):

  def SuccessorArithmeticAlgebraicSignature : LRA.Identity.AlgebraicSignature where
    OperationSymbol := SuccessorArithmeticFunctionSymbol
    arity := SuccessorArithmeticFirstOrderFunctions.arity
    ConstantSymbol := SuccessorArithmeticConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SuccessorArithmeticAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := SuccessorArithmeticFunctionSymbol
  arity := SuccessorArithmeticFirstOrderFunctions.arity
  ConstantSymbol := SuccessorArithmeticConstantSymbol
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def SuccessorArithmeticAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := SuccessorArithmeticFunctionSymbol
  arity := SuccessorArithmeticFirstOrderFunctions.arity
  ConstantSymbol := SuccessorArithmeticConstantSymbol

end LRA.NumberSystems.SuccessorArithmetic.Interface.UniversalAlgebra
