                                                                         
                                                                     
                                                                       

import LRA.Logic.Model.Model

namespace LRA.NumberSystems.IntegerStructure.Interface.Signature

   
                                                                         
                                                                    
                                                               
                                                                       
                                                   
                                         
  

inductive IntegerFunctionSymbol where
  | successor
  | predecessor

def IntegerRelationSymbol : Type := Empty

inductive IntegerConstantSymbol where
  | zero
  | one
  | negativeOne

def IntegerFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := IntegerFunctionSymbol
  arity
    | .successor => 1
    | .predecessor => 1

def IntegerFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := IntegerRelationSymbol
  arity := Empty.elim

def IntegerFirstOrderSignature : LRA.Logic.Signature where
  Functions := IntegerFirstOrderFunctions
  Relations := IntegerFirstOrderRelations
  Constants := IntegerConstantSymbol

end LRA.NumberSystems.IntegerStructure.Interface.Signature
