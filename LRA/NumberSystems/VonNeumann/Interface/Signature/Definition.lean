import LRA.ModelTheory.Model

namespace LRA.NumberSystems.VonNeumann.Interface.Signature

inductive VonNeumannFunctionSymbol where
  | successor
  | addition
  | multiplication

inductive VonNeumannRelationSymbol where
  | lessThan

inductive VonNeumannConstantSymbol where
  | zero
  | one

def VonNeumannFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := VonNeumannFunctionSymbol
  arity
    | .successor => 1
    | .addition => 2
    | .multiplication => 2

def VonNeumannFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := VonNeumannRelationSymbol
  arity
    | .lessThan => 2

def VonNeumannFirstOrderSignature : LRA.Logic.Signature where
  Functions := VonNeumannFirstOrderFunctions
  Relations := VonNeumannFirstOrderRelations
  Constants := VonNeumannConstantSymbol

end LRA.NumberSystems.VonNeumann.Interface.Signature
