  
                                                             
                                                                      
                                        

                                                                      
                                                                       
                                                                        
                                                                         
                                                                         
                                                                         
                                                             
                                                                       
                                                                   
                                                                        
                                                            
                                                    
  

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.RealAnalysis

                                                                                                  
                                                                        

             

       
                                         
                                     
                                     
                                     
                                        
   
  
theorem OrderArithmetic (a b c d y : ℝ) :
    (a ≤ b ∧ c ≤ d → a + c ≤ b + d) ∧
    (a ≤ b ∧ c > 0 → a * c ≤ b * c) ∧
    (a ≤ b ∧ c < 0 → a * c ≥ b * c) ∧
    (y ≥ 0 → (|a| ≤ y ↔ -y ≤ a ∧ a ≤ y)) := by
  sorry

end LRA.Analysis.RealAnalysis
