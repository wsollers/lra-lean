                                                      
                                                                      

import LRA.Cardinality.Properties.Finiteness.Definition

namespace LRA.Cardinality

universe u v

   
                                               
                                                           
                                                        
  

                                 

                                                                  
                                     

             

       
                                               
                                                               
   
  
theorem IsFiniteCongr (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : IsFinite A ↔ IsFinite B := by
  sorry

                                            

                                                                      
                        

             

       
                                               
                                 
   
  
theorem NotBothFiniteAndInfinite (A : Type u) :
    ¬ (IsFinite A ∧ IsInfinite A) := by
  sorry

                                               

                                                                      
                                                            

             

       
                                                
                                              
   
  
theorem FiniteImpliesDedekindFinite (A : Type u)
    (finite : IsFinite A) : IsDedekindFinite A := by
  sorry

                                                   

                                                                 
                                                                    
                       

             

       
                                                    
                                                            
   
  
theorem DedekindInfiniteImpliesInfinite (A : Type u)
    (dedekindInfinite : IsDedekindInfinite A) : IsInfinite A := by
  sorry

                                             

                                                                
                                                              

             

       
                                                           
                                                                     
   
  
theorem DominatesOfFiniteInfinite (A : Type u) (B : Type v)
    (finiteA : IsFinite A) (infiniteB : IsInfinite B) : Dominates A B := by
  sorry

end LRA.Cardinality
