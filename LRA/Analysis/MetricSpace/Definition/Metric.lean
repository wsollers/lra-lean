import Mathlib.Data.Real.Basic

   
                                                                       
                 
  

namespace LRA.Analysis.MetricSpace

universe u

                                                          

                                              

             

       
                               
                         
                           
                                                                     
                               
                                                    
                                 
                                                                    
   

                                                                              
                                                                       
                                      

                                                                         
  
structure MetricDefinition (X : Type u) where
                               
  distance : X → X → Real
                           
  positive : ∀ x y : X, 0 ≤ distance x y ∧ (distance x y = 0 ↔ x = y)
                               
  symmetric : ∀ x y : X, distance x y = distance y x
                                 
  triangle : ∀ x y z : X, distance x z ≤ distance x y + distance y z

end LRA.Analysis.MetricSpace
