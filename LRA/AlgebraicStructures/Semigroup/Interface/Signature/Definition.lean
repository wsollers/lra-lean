import LRA.Logic.Model.Model

namespace LRA.AlgebraicStructures.Semigroup.Interface.Signature

   
                                     

                                                                            
                    
  

inductive SemigroupFunctionSymbol where
  | mul

def SemigroupRelationSymbol : Type := Empty
def SemigroupConstantSymbol : Type := Empty

def SemigroupFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SemigroupFunctionSymbol
  arity
    | .mul => 2

def SemigroupFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SemigroupRelationSymbol
  arity := Empty.elim

def SemigroupFirstOrderSignature : LRA.Logic.Signature where
  Functions := SemigroupFirstOrderFunctions
  Relations := SemigroupFirstOrderRelations
  Constants := SemigroupConstantSymbol

end LRA.AlgebraicStructures.Semigroup.Interface.Signature
