import LRA.Logic.Model.Model

namespace LRA.NumberSystems.FirstOrderArithmetic.Interface.Signature

inductive FirstOrderArithmeticFunctionSymbol where
  | successor
  | add
  | mul

inductive FirstOrderArithmeticRelationSymbol where
  | lt

inductive FirstOrderArithmeticConstantSymbol where
  | zero

def FirstOrderArithmeticFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := FirstOrderArithmeticFunctionSymbol
  arity
    | .successor => 1
    | .add => 2
    | .mul => 2

def FirstOrderArithmeticFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := FirstOrderArithmeticRelationSymbol
  arity
    | .lt => 2

def FirstOrderArithmeticFirstOrderSignature : LRA.Logic.Signature where
  Functions := FirstOrderArithmeticFirstOrderFunctions
  Relations := FirstOrderArithmeticFirstOrderRelations
  Constants := FirstOrderArithmeticConstantSymbol

end LRA.NumberSystems.FirstOrderArithmetic.Interface.Signature

