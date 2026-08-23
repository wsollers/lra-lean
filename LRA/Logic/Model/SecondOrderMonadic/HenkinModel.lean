import Mathlib.Data.Set.Defs
import LRA.Logic.Model.Model

namespace LRA.Logic.SecondOrderMonadic

   
              

                                                                   
                                                                         
                                                                      
                                                                      
                                                                        
                                                                 

                                                                          
                                                                         
                                                                         
                                                                    
                                                                       
                                                                          

                                                                     
                                                                        
                                                                     
                                                                   
                                                                       
                                                               
                          

                                                              
                                                                     
                                                                       
                                                                    
                                                                      
                                                                        
                                                                          
                                                                        
        
  

                                                                      
                                                               
                                       

             

       
                                                                      
                                      
   
  
structure HenkinModel (S : Signature) extends FirstOrder.Model S where
  SecondOrderDomain : Set (Set Domain)

                                                                      
                                                                 
                                                                   

             

       
                                                                             
                                                       
   
  
def HasFullSecondOrderSemantics {S : Signature} (M : HenkinModel S) : Prop :=
  ∀ subset : Set M.Domain, subset ∈ M.SecondOrderDomain

end LRA.Logic.SecondOrderMonadic
