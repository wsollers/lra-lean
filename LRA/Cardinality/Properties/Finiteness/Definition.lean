                                                        
                                                                  
                                                              
                                                                

import LRA.Cardinality.Theorems
import LRA.Carrier.Finiteness

namespace LRA.Cardinality

universe u

   
                                                 
                                                             
                                        

                                                                   
                                                                       
                                                                     
                                                                  
                                                                    
                                                                 
                                                                       
                                                                      
                

                                                                 
                                                                     
                                                                 
                                                             
                                                                   
                                                                      
                                                  
  

                               

                                                                    
                       

             

       
                                   
                        
   
  
def IsFinite (A : Type u) : Prop :=
  LRA.Carrier.IsFinite A

                                 

                                                                    

             

       
                                     
                          
   
  
def IsInfinite (A : Type u) : Prop :=
  LRA.Carrier.IsInfinite A

                                         

                                                                     
                                                                   
                                                        

             

       
                                             
                                                                     
   
  
def IsDedekindInfinite (A : Type u) : Prop :=
  ∃ f : A → A, LRA.Function.Injective f ∧ ¬ LRA.Function.Surjective f

                                       

                                                        

             

       
                                           
                        
   
  
def IsDedekindFinite (A : Type u) : Prop :=
  ¬ IsDedekindInfinite A

end LRA.Cardinality
