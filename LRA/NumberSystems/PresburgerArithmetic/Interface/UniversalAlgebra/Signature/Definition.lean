import LRA.NumberSystems.PresburgerArithmetic.Interface.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.NumberSystems.PresburgerArithmetic.Interface.UniversalAlgebra

open LRA.NumberSystems.PresburgerArithmetic.Interface.Signature

def PresburgerArithmeticAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := PresburgerArithmeticFunctionSymbol
  arity := PresburgerArithmeticFirstOrderFunctions.arity
  ConstantSymbol := PresburgerArithmeticConstantSymbol

end LRA.NumberSystems.PresburgerArithmetic.Interface.UniversalAlgebra

