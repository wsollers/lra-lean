import LRA.Logic

namespace LRA.Logic.ModelTheory.SetRings

   
                                        
  

                                                              

             

       
                                     
        
        
              
   
  
inductive SetRingFunctionSymbol where
  | join
  | meet
  | difference

                                                                  

             

       
                                         
   
  
def SetRingRelationSymbol : Type := Empty

                                               

             

       
                                     
        
   
  
inductive SetRingConstantSymbol where
  | zero

                                                   

             

       
                                                                    
                                 
       
                
                
                      
   
  
def SetRingFirstOrderFunctions : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetRingFunctionSymbol
  arity
    | .join => 2
    | .meet => 2
    | .difference => 2

                                                   

             

       
                                                                    
                                 
                     
   
  
def SetRingFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := SetRingRelationSymbol
  arity := Empty.elim

                                                      

             

       
                                                          
                                         
                                         
                                    
   
  
def SetRingFirstOrderSignature : LRA.Logic.Signature where
  Functions := SetRingFirstOrderFunctions
  Relations := SetRingFirstOrderRelations
  Constants := SetRingConstantSymbol

end LRA.Logic.ModelTheory.SetRings
