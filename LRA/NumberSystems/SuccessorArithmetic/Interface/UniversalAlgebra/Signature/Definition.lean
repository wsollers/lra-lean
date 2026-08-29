import LRA.NumberSystems.SuccessorArithmetic.Interface.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.UniversalAlgebra

open LRA.NumberSystems.SuccessorArithmetic.Interface.Signature

def SuccessorArithmeticAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := SuccessorArithmeticFunctionSymbol
  arity := SuccessorArithmeticFirstOrderFunctions.arity
  ConstantSymbol := SuccessorArithmeticConstantSymbol

end LRA.NumberSystems.SuccessorArithmetic.Interface.UniversalAlgebra

