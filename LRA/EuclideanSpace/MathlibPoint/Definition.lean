import Mathlib.Analysis.InnerProductSpace.PiL2
import LRA.EuclideanSpace.Interface.Relations

namespace LRA.EuclideanSpace

   
                                                                   
                                                                
                                                                        
                                                                     
                                                                       
                                                                      
                                                                   
                                                                      
              
  

                                                                        
                                       
abbrev MathlibPoint (n : ℕ) := EuclideanSpace ℝ (Fin n)

variable {n : ℕ}

                                                                       
                                                             

             

       
                                                       
                                                                   
   
  
noncomputable instance : Between (MathlibPoint n) where
  between x y z := ∃ t : ℝ, 0 ≤ t ∧ t ≤ 1 ∧ y = (1 - t) • x + t • z

                                                                      
          

             

       
                                                         
                                          
   
  
noncomputable instance : Congruent (MathlibPoint n) where
  congruent x y z w := dist x y = dist z w

end LRA.EuclideanSpace
