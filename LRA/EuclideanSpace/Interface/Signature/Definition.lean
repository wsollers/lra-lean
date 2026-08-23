import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.EuclideanSpace

   
                                                                        
                                                                
                                                                   
                                                               
                                                                       
              

                                                                      
                                                                       
                                                                   
                                                                      
                                                                      
                                          

                                                                     
                                                                    
                                                                        
     
  

                                                                    

             

       
                                    
           
             
   
  
inductive TarskiRelationSymbol where
  | between
  | congruent

                                                                        
           

             

       
                                                                   
                                
       
                   
                     
   
  
def TarskiFirstOrderRelations : LRA.Logic.ArityIndexedSymbols where
  Symbol := TarskiRelationSymbol
  arity
    | .between => 3
    | .congruent => 4

                                                                      
                                                  

             

       
                                                         
                                  
                                        
                    
   
  
def TarskiFirstOrderSignature : LRA.Logic.Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := TarskiFirstOrderRelations
  Constants := Empty

end LRA.EuclideanSpace
