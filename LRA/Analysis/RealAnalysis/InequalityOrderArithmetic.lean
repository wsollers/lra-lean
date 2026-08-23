  
                                                             
                                                                        
                                                                     
                                                                      
                                                    
                                                                       
                                                                     
                                
  

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.RealAnalysis

                              
                                                                                                   
          

             

       
                                       
                                                             
                             
   
  
theorem RealOrderTrichotomy (a b : ℝ) :
    (a < b ∧ a ≠ b ∧ ¬ a > b) ∨ (a = b ∧ ¬ a < b ∧ ¬ a > b) ∨
    (a > b ∧ a ≠ b ∧ ¬ a < b) := by
  sorry

                            
                                                  

             

       
                                                            
   
  
theorem IneqAddBothSides (a b c : ℝ) : a < b → a + c < b + c := by
  sorry

                                      
                                                  

             

       
                                                                     
   
  
theorem IneqNonstrictAddBothSides (a b c : ℝ) : a ≤ b → a + c ≤ b + c := by
  sorry

                              
                                                            

             

       
                                           
                                 
   
  
theorem IneqAddInequalities (a b c d : ℝ) :
    a < b ∧ c < d → a + c < b + d := by
  sorry

                                        
                                                            

             

       
                                                    
                                 
   
  
theorem IneqNonstrictAddInequalities (a b c d : ℝ) :
    a ≤ b ∧ c ≤ d → a + c ≤ b + d := by
  sorry

                     
                                                    

             

       
                                                         
   
  
theorem PositiveSum (a b : ℝ) : a > 0 → b > 0 → a + b > 0 := by
  sorry

                                                                                               

             

       
                                           
                                                                        
   
  
theorem SubtractionOfInequalitiesNotValid :
    ∃ a b c d : ℝ, a > b ∧ c > d ∧ ¬ (a - c > b - d) ∧ ¬ (c - a > d - b) := by
  sorry

                       
                                                            

             

       
                                                                  
   
  
theorem IneqMixedAdd (a b c d : ℝ) : a ≤ b ∧ c < d → a + c < b + d := by
  sorry

                               
                                                          

             

       
                                                                        
   
  
theorem IneqMultiplyPositive (a b c : ℝ) : a < b ∧ 0 < c → a * c < b * c := by
  sorry

                               
                                                          

             

       
                                                                        
   
  
theorem IneqMultiplyNegative (a b c : ℝ) : a < b ∧ c < 0 → a * c > b * c := by
  sorry

                                         
                                                          

             

       
                                                   
                                 
   
  
theorem IneqNonstrictMultiplyPositive (a b c : ℝ) :
    a ≤ b ∧ 0 < c → a * c ≤ b * c := by
  sorry

                                       
                                                          

             

       
                                                 
                                 
   
  
theorem IneqNonstrictMultiplyNonneg (a b c : ℝ) :
    a ≤ b ∧ 0 ≤ c → a * c ≤ b * c := by
  sorry

                         
                                                    

             

       
                                                             
   
  
theorem PositiveProduct (a b : ℝ) : a > 0 → b > 0 → a * b > 0 := by
  sorry

                                            
                                                    

             

       
                                                   
                             
   
  
theorem NegativeTimesNegativeIsPositive (a b : ℝ) :
    a < 0 → b < 0 → a * b > 0 := by
  sorry

                                            
                                                    

             

       
                                                   
                             
   
  
theorem PositiveTimesNegativeIsNegative (a b : ℝ) :
    a > 0 → b < 0 → a * b < 0 := by
  sorry

                                            
                                                    

             

       
                                                   
                             
   
  
theorem NegativeTimesPositiveIsNegative (a b : ℝ) :
    a < 0 → b > 0 → a * b < 0 := by
  sorry

                              
                                            

             

       
                                                         
   
  
theorem OrderAndSubtraction (a b : ℝ) : a < b ↔ b - a > 0 := by
  sorry

                                         
                                            

             

       
                                                                  
   
  
theorem NonStrictOrderAndSubtraction (a b : ℝ) : a ≤ b ↔ b - a ≥ 0 := by
  sorry

                                             
                                                          

             

       
                                                      
                                 
   
  
theorem DivisionByPositivePreservesOrder (a b c : ℝ) :
    a < b → c > 0 → a / c < b / c := by
  sorry

                                            
                                                          

             

       
                                                     
                                 
   
  
theorem DivisionByNegativeReversesOrder (a b c : ℝ) :
    a < b → c < 0 → b / c < a / c := by
  sorry

                                             
                                                          

             

       
                                                        
                                 
   
  
theorem PositiveMultiplicationCancellation (a b c : ℝ) :
    c > 0 → a * c < b * c → a < b := by
  sorry

                                                                                                    
                          

             

       
                                        
                                                                  
                                           
   
  
theorem DivisionOfInequalitiesNotValid :
    ∃ a b c d : ℝ, a ≠ 0 ∧ b ≠ 0 ∧ c ≠ 0 ∧ d ≠ 0 ∧ a > b ∧ c > d ∧
      ¬ (a / c > b / d) ∧ ¬ (c / a > d / b) := by
  sorry

                     
                                                          

             

       
                                                               
   
  
theorem IneqSqueeze (a b c : ℝ) : a ≤ b ∧ b ≤ c ∧ a = c → b = a := by
  sorry

                                 
                                                  

             

       
                                                                  
   
  
theorem IneqTransitivityStrict (a b c : ℝ) : a < b ∧ b < c → a < c := by
  sorry

                                
                                                  

             

       
                                                                 
   
  
theorem IneqTransitivityMixed (a b c : ℝ) : a ≤ b ∧ b < c → a < c := by
  sorry

                                 
                                                                    

             

       
                                          
                                             
   
  
theorem IneqReciprocalPositive (a b : ℝ) :
    0 < a ∧ a < b → 0 < 1 / b ∧ 1 / b < 1 / a := by
  sorry

                             
                                                                                  

             

       
                                                                
                         
   
  
theorem IneqReciprocalFlip (a b : ℝ) (ha : a > 0) (hb : b > 0) :
    a < b ↔ 1 / b < 1 / a := by
  sorry

end LRA.Analysis.RealAnalysis
