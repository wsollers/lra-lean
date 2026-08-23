import LRA.Logic.Model.Model

namespace LRA.NumberSystems.PeanoSystem.Interface.Signature

   
                                                                           

                                                                            
                                                                       
                                                                                 
                                                                      
                                                                    

                                                                           
                                                
                                                     
                                                                           
                                           
                                                                             
                                                                              
                                                                            
                                                                           
  

inductive PeanoFunctionSymbol where
  | successor

def PeanoRelationSymbol : Type := Empty

inductive PeanoConstantSymbol where
  | one

def PeanoFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoFunctionSymbol
  arity
    | .successor => 1

def PeanoFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := PeanoRelationSymbol
  arity := Empty.elim

def PeanoFirstOrderSignature : LRA.Logic.Signature where
  Functions := PeanoFirstOrderFunctions
  Relations := PeanoFirstOrderRelations
  Constants := PeanoConstantSymbol

end LRA.NumberSystems.PeanoSystem.Interface.Signature
