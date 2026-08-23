import LRA.Logic.Model.Model

namespace LRA.AlgebraicStructures.OrderedRing.Interface.Signature

   
                                        

                                                                          
                                                                            
               
  

inductive OrderedRingFunctionSymbol where
  | add
  | mul
  | neg

inductive OrderedRingRelationSymbol where
  | lt

inductive OrderedRingConstantSymbol where
  | zero
  | one

def OrderedRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1

def OrderedRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2

def OrderedRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := OrderedRingFirstOrderFunctions
  Relations := OrderedRingFirstOrderRelations
  Constants := OrderedRingConstantSymbol

end LRA.AlgebraicStructures.OrderedRing.Interface.Signature
