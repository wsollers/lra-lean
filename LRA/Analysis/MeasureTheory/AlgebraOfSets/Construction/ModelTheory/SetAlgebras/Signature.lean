import LRA.Logic

namespace LRA.Logic.ModelTheory.SetAlgebras

   
                                           
  

                                                                             

             

       
                                        
        
        
              
   
  
inductive SetAlgebraFunctionSymbol where
  | join
  | meet
  | complement

                                                                     

             

       
                                            
   
  
def SetAlgebraRelationSymbol : Type := Empty

                                                  

             

       
                                        
        
       
   
  
inductive SetAlgebraConstantSymbol where
  | zero
  | one

                                                      

             

       
                                                                       
                                    
       
                
                
                      
   
  
def SetAlgebraFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetAlgebraFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .complement => 1

                                                      

             

       
                                                                       
                                    
                     
   
  
def SetAlgebraFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetAlgebraRelationSymbol
  arity := Empty.elim

                                                                     

             

       
                                                             
                                            
                                            
                                       
   
  
def SetAlgebraFirstOrderSignature : LRA.Logic.Signature where
  Functions := SetAlgebraFirstOrderFunctions
  Relations := SetAlgebraFirstOrderRelations
  Constants := SetAlgebraConstantSymbol

end LRA.Logic.ModelTheory.SetAlgebras
