import LRA.Logic.Syntax.Propositional.Formula

namespace LRA.Logic.Propositional

   
                     

                                                                     
                                                                
                                                                         
                                                                     
                                                                     
                                                                            
                                                                          
                                                                      
                                                                      
                                                                          
                                                                           
                                                               

                                                                         
                                                                          
                                                                           
                                                                        
                                                                         
                                                                         
                                                                     
                                                                          
                                                                          
                                                           
  

                                                                        
                                         

             

       
                                                              
                             
   
  
structure PropositionalModel (L : PropositionalLanguage) where
  valuation : L.Atoms -> Bool

   
             

                                                                    
                                                                           
                                                                 
                    
  

                                                                      
                             

             

       
                                
                                                                                    
                               
   
  
def PropositionalModel.satisfies
    {L : PropositionalLanguage} (M : PropositionalModel L) (φ : Formula L) : Prop :=
  evaluate M.valuation φ = true

                                                   
scoped notation:50 M " ⊨ₚ " φ => PropositionalModel.satisfies M φ

end LRA.Logic.Propositional
