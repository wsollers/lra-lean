import LRA.Logic.Model.Model

namespace LRA.NumberSystems.PresburgerArithmetic.Interface.Signature

inductive PresburgerArithmeticFunctionSymbol where
  | successor
  | add

inductive PresburgerArithmeticRelationSymbol where
  | lt

inductive PresburgerArithmeticConstantSymbol where
  | zero

def PresburgerArithmeticFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerArithmeticFunctionSymbol
  arity
    | .successor => 1
    | .add => 2

def PresburgerArithmeticFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerArithmeticRelationSymbol
  arity
    | .lt => 2

def PresburgerArithmeticFirstOrderSignature : LRA.Logic.Signature where
  Functions := PresburgerArithmeticFirstOrderFunctions
  Relations := PresburgerArithmeticFirstOrderRelations
  Constants := PresburgerArithmeticConstantSymbol

end LRA.NumberSystems.PresburgerArithmetic.Interface.Signature

