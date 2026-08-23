                                                        
                                                                

import LRA.Cardinality.Properties.Countability.Definition
import LRA.Cardinality.Properties.Finiteness.Definition

namespace LRA.Cardinality

universe u v

   
                                                 
                                                             
                                                        
  

                                          

                               

             

       
                                           
                                         
   
  
theorem FiniteImpliesCountable (A : Type u)
    (finite : IsFinite A) : IsCountable A := by
  sorry

                                                     

                                           

             

       
                                                      
                                                               
   
  
theorem CountablyInfiniteImpliesCountable (A : Type u)
    (countablyInfinite : IsCountablyInfinite A) : IsCountable A := by
  sorry

                                                    

                                                           
                                           

             

       
                                                     
                                                              
   
  
theorem CountablyInfiniteImpliesInfinite (A : Type u)
    (countablyInfinite : IsCountablyInfinite A) : IsInfinite A := by
  sorry

                                    

                                             

             

       
                                                  
                                                                     
   
  
theorem IsCountableCongr (A : Type u) (B : Type v)
    (equinumerous : Equinumerous A B) : IsCountable A ↔ IsCountable B := by
  sorry

                                                 

                                                             
                                                  

             

       
                                                               
                                                               
                 
   
  
theorem DominatesCountableIsCountable (A : Type u) (B : Type v)
    (dominatesB : Dominates A B) (countableB : IsCountable B) :
    IsCountable A := by
  sorry

                                                                 

                                                             
                                                                    
                             

                                                                      
                                         

             

       
                                                     
                                              
                                        
                                                                     
                              
   
  
theorem CountableSigmaOfCountableIndexCountableFibers
    {Index : Type u} (family : Index → Type v)
    (countableIndex : IsCountable Index)
    (countableFibers : ∀ index : Index, IsCountable (family index)) :
    IsCountable (Sigma family) := by
  sorry

end LRA.Cardinality
