import LRA.Logic.Syntax.FirstOrder.FreeVariables

namespace LRA.Logic.FirstOrder

   
                 

                                                                   
                                                                 
                                                                         
                                                                   
                                                                         
                                                                        
                                                                        
                                                                   

                                                                          
                                                             
                

                                                                   
                                                                       
                                                                          
                                      
                                                                         
                                                                          
                                                                          
                                                                      
                                                                      
                                                                        
                                                                         
                                                                        
                                                     

                                                                          
                                                                      
                                                                         
                                                                        
                                                                     
                                                                  
  

                                                                          
                           

             

       
                   
                                                              
                                                             
                               
                            
                                         
                                                                    
                         
                                                                              
                             
   
  
def IsSubstitutable
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Formula S Variable -> Variable -> Term S Variable -> Prop
  | .relation _ _, _, _ => True
  | .equal _ _, _, _ => True
  | .neg φ, x, t => IsSubstitutable φ x t
  | .impl φ ψ, x, t => IsSubstitutable φ x t ∧ IsSubstitutable ψ x t
  | .forallQ v φ, x, t =>
      (x ∈ freeVariables (Formula.forallQ v φ) -> v ∉ freeVariablesInTerm t) ∧
        IsSubstitutable φ x t

end LRA.Logic.FirstOrder
