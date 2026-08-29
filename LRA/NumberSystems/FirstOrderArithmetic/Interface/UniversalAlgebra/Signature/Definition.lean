import LRA.NumberSystems.FirstOrderArithmetic.Interface.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.NumberSystems.FirstOrderArithmetic.Interface.UniversalAlgebra

open LRA.NumberSystems.FirstOrderArithmetic.Interface.Signature

def FirstOrderArithmeticAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := FirstOrderArithmeticFunctionSymbol
  arity := FirstOrderArithmeticFirstOrderFunctions.arity
  ConstantSymbol := FirstOrderArithmeticConstantSymbol

end LRA.NumberSystems.FirstOrderArithmetic.Interface.UniversalAlgebra

