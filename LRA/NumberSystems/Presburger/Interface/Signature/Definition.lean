import LRA.Logic.Model.Model

namespace LRA.NumberSystems.Presburger.Interface.Signature

inductive PresburgerFunctionSymbol where
  | successor
  | addition

inductive PresburgerRelationSymbol where
  | lessThan

inductive PresburgerConstantSymbol where
  | zero

def PresburgerFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerFunctionSymbol
  arity
    | .successor => 1
    | .addition => 2

def PresburgerFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PresburgerRelationSymbol
  arity
    | .lessThan => 2

def PresburgerFirstOrderSignature : LRA.Logic.Signature where
  Functions := PresburgerFirstOrderFunctions
  Relations := PresburgerFirstOrderRelations
  Constants := PresburgerConstantSymbol

end LRA.NumberSystems.Presburger.Interface.Signature
