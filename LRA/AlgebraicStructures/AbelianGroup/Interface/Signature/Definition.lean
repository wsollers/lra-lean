import LRA.Logic.Model.Model

namespace LRA.AlgebraicStructures.AbelianGroup.Interface.Signature

   
                                                              

                                                                       
                                                                  
  

inductive AbelianGroupFunctionSymbol where
  | add
  | neg

def AbelianGroupRelationSymbol : Type := Empty

inductive AbelianGroupConstantSymbol where
  | zero

def AbelianGroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := AbelianGroupFunctionSymbol
  arity
    | .add => 2
    | .neg => 1

def AbelianGroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := AbelianGroupRelationSymbol
  arity := Empty.elim

def AbelianGroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := AbelianGroupFirstOrderFunctions
  Relations := AbelianGroupFirstOrderRelations
  Constants := AbelianGroupConstantSymbol

end LRA.AlgebraicStructures.AbelianGroup.Interface.Signature
