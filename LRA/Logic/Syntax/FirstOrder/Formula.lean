import LRA.Identity
import LRA.Logic.Syntax.Term

namespace LRA.Logic.FirstOrder

   
                     

                                                          
                                                        
                                                               
                                                                        
                                                                       
                                                                        
                                                                          
                                                                     
                                                                         
                                                                       
                   

                                                                        
       

                                                                          
                                                                          
                                     
                                  
                                      
                                                   
                                                                   
                     

                                                                      
                                                                        
                                                                    
                                                    
                                                                    
                                                                            
                                                                      
       

                                                                        
                                                                             
                                                                           
                                                                             
                                                     

                                                                      
                                                                    
                                                                        
                                                                      
                                                                       
                                                                          
                    
  

   
                                                                 

             

       
                                                         
              
                               
                                                     
                        
                                                                    
                                                  
                                                                         
                                                                  
   
  
inductive Formula (S : Signature) (Variable : Type) where
  | relation :
      (r : S.RelationSymbol) ->
      (Fin (S.relationArity r) -> Term S Variable) ->
      Formula S Variable
  | equal : Term S Variable -> Term S Variable -> Formula S Variable
  | neg : Formula S Variable -> Formula S Variable
  | impl : Formula S Variable -> Formula S Variable -> Formula S Variable
  | forallQ : Variable -> Formula S Variable -> Formula S Variable

   
                    

                                                                       
                                                                         
                                                                      
                                                                          
                                                         
  

   
                                                   

             

       
                                                                              
                         
                                              
   
  
def Formula.and {S : Signature} {Variable : Type} (φ ψ : Formula S Variable) :
    Formula S Variable :=
  Formula.neg (Formula.impl φ (Formula.neg ψ))

                                                                 
                                         
                                                                           
                                                                         
                                                                    
                                                                      

             

       
                                                     
                                                                   
                                                 
   
  
def Formula.existsQ {S : Signature} {Variable : Type}
    (v : Variable) (φ : Formula S Variable) : Formula S Variable :=
  Formula.neg (Formula.forallQ v (Formula.neg φ))

end LRA.Logic.FirstOrder
