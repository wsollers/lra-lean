import LRA.Logic.Language.Symbols.Signature
import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.Logic

   
                               

                                                                           
                                                                            
                                                                     
                                                                          
                                                                          
                                                                         
             

                                                                          
                                                                           
                                                   
  

   
                                                                    
  

                                                                   

             

       
                                    
       
   
  
inductive MonoidFunctionSymbol where
  | mul

                                       

             

       
                                        
   
  
def MonoidRelationSymbol : Type := Empty

                                                                       

             

       
                                    
       
   
  
inductive MonoidConstantSymbol where
  | one

   
                                                                    

             

       
                                               
                                
       
               
   
  
def monoidFunctions : ArityIndexedSymbols where
  Symbol := MonoidFunctionSymbol
  arity
    | .mul => 2

   
                                                                    

             

       
                                               
                                
                     
   
  
def monoidRelations : ArityIndexedSymbols where
  Symbol := MonoidRelationSymbol
  arity := Empty.elim

                                      

             

       
                                     
                              
                              
                                   
   
  
def monoidSignature : Signature where
  Functions := monoidFunctions
  Relations := monoidRelations
  Constants := MonoidConstantSymbol

   
                                                   

             

       
                                     
                                               
   
  
theorem monoidSignature.mulIsBinary :
    monoidSignature.IsBinaryFunctionSymbol .mul := rfl

   
                                                                      

                                                                          
                                                                           
                                                                      
  

                                                                     

             

       
                                            
       
   
  
inductive AdditiveMonoidFunctionSymbol where
  | add

                                               

             

       
                                                
   
  
def AdditiveMonoidRelationSymbol : Type := Empty

                                                                         

             

       
                                            
        
   
  
inductive AdditiveMonoidConstantSymbol where
  | zero

   
                                                                                     

             

       
                                                       
                                        
       
               
   
  
def additiveMonoidFunctions : ArityIndexedSymbols where
  Symbol := AdditiveMonoidFunctionSymbol
  arity
    | .add => 2

   
                                                                                     

             

       
                                                       
                                        
                     
   
  
def additiveMonoidRelations : ArityIndexedSymbols where
  Symbol := AdditiveMonoidRelationSymbol
  arity := Empty.elim

                                              

             

       
                                             
                                      
                                      
                                           
   
  
def additiveMonoidSignature : Signature where
  Functions := additiveMonoidFunctions
  Relations := additiveMonoidRelations
  Constants := AdditiveMonoidConstantSymbol

   
                                                           

             

       
                                             
                                                       
   
  
theorem additiveMonoidSignature.addIsBinary :
    additiveMonoidSignature.IsBinaryFunctionSymbol .add := rfl

   
                                                                       

                                                                       
                                                                           
                                                                           
                                                                      
                                                                   
                                                                   
                    
  

                                                                        
                                   

             

       
                                         
       
       
       
   
  
inductive OrderedRingFunctionSymbol where
  | add
  | mul
  | neg

                                                                     
        

             

       
                                         
      
   
  
inductive OrderedRingRelationSymbol where
  | lt

                                                                          
                                

             

       
                                         
        
       
   
  
inductive OrderedRingConstantSymbol where
  | zero
  | one

   
                                                                               

             

       
                                                    
                                     
       
               
               
               
   
  
def orderedRingFunctions : ArityIndexedSymbols where
  Symbol := OrderedRingFunctionSymbol
  arity
    | .add => 2
    | .mul => 2
    | .neg => 1

   
                                                                               

             

       
                                                    
                                     
       
              
   
  
def orderedRingRelations : ArityIndexedSymbols where
  Symbol := OrderedRingRelationSymbol
  arity
    | .lt => 2

                                                       

             

       
                                          
                                   
                                   
                                        
   
  
def orderedRingSignature : Signature where
  Functions := orderedRingFunctions
  Relations := orderedRingRelations
  Constants := OrderedRingConstantSymbol

   
                                                        

             

       
                                          
                                                    
   
  
theorem orderedRingSignature.addIsBinary :
    orderedRingSignature.IsBinaryFunctionSymbol .add := rfl

   
                                                        

             

       
                                          
                                                    
   
  
theorem orderedRingSignature.mulIsBinary :
    orderedRingSignature.IsBinaryFunctionSymbol .mul := rfl

   
                                                      

             

       
                                         
                                                   
   
  
theorem orderedRingSignature.negIsUnary :
    orderedRingSignature.IsUnaryFunctionSymbol .neg := rfl

   
                                                      

             

       
                                         
                                                   
   
  
theorem orderedRingSignature.ltIsBinary :
    orderedRingSignature.IsBinaryRelationSymbol .lt := rfl

end LRA.Logic
