                                  
                                                                     
                                     

import LRA.Function.Properties.Definition

namespace LRA.Cardinality

universe u v

   
                                      
                                       
                                        

                                                                      
                                                                      
                                                                      
                                                                       
                                                                  
                                                                     
                                                             

                                                                 
                                                                   
                                           
                                                               
                                               
  

                                   

                                                                    
     

             

       
                                                    
                                       
   
  
def Equinumerous (A : Type u) (B : Type v) : Prop :=
  ∃ f : A → B, LRA.Function.Bijective f

                                

                                                                   
                                                  

             

       
                                                 
                                       
   
  
def Dominates (A : Type u) (B : Type v) : Prop :=
  ∃ f : A → B, LRA.Function.Injective f

                                        

                                                                 
                                                              

             

       
                                                         
                                    
   
  
def StrictlyDominates (A : Type u) (B : Type v) : Prop :=
  Dominates A B ∧ ¬ Equinumerous A B

end LRA.Cardinality
