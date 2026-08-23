  
                                                             
                                                                        
                                                                      
                                                                   
                                                                      
                                                                         
                                                                     
                                                        
  

import Mathlib.Data.Real.Basic
import Mathlib.Data.Fintype.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

namespace LRA.Analysis.RealAnalysis

                         

             

       
                                                             
   
  
noncomputable def AbsR (a : ℝ) : ℝ := if a ≥ 0 then a else -a

                              
                                   

             

       
                                                
   
  
theorem AbsoluteValueNonneg (a : ℝ) : AbsR a ≥ 0 := by
  sorry

                                     
                                           

             

       
                                                             
   
  
theorem AbsoluteValueZeroIffZero (a : ℝ) : AbsR a = 0 ↔ a = 0 := by
  sorry

                                   
                                                 

             

       
                                                                 
   
  
theorem AbsoluteValueSelfOrNeg (a : ℝ) : AbsR a = a ∨ AbsR a = -a := by
  sorry

                                 
                                           

             

       
                                                           
   
  
theorem AbsoluteValueSymmetric (a : ℝ) : AbsR (-a) = AbsR a := by
  sorry

                               
                                                         

             

       
                                                                       
   
  
theorem AbsoluteValueProduct (a b : ℝ) : AbsR (a * b) = AbsR a * AbsR b := by
  sorry

                                
                                                                          

             

       
                                                      
                                  
   
  
theorem AbsoluteValueQuotient (a b : ℝ) (hb : b ≠ 0) :
    AbsR (a / b) = AbsR a / AbsR b := by
  sorry

                              
                                                 

             

       
                                                              
   
  
theorem AbsoluteValueBounds (a : ℝ) : -AbsR a ≤ a ∧ a ≤ AbsR a := by
  sorry

                              
                                                                       

             

       
                                                   
                               
   
  
theorem AbsoluteValueLeIff (a r : ℝ) (hr : r ≥ 0) :
    AbsR a ≤ r ↔ -r ≤ a ∧ a ≤ r := by
  sorry

                              
                                                                       

             

       
                                                   
                               
   
  
theorem AbsoluteValueLtIff (a r : ℝ) (hr : r > 0) :
    AbsR a < r ↔ -r < a ∧ a < r := by
  sorry

                                    
                                                                

             

       
                                             
                                         
   
  
theorem ReverseTriangleInequality (a b : ℝ) :
    AbsR (AbsR a - AbsR b) ≤ AbsR (a - b) := by
  sorry

                                 
                                                                                                    
        

             

       
                                                       
                                                                    
   
  
theorem AbsoluteValueSumBound (n : ℕ) (a : Fin n → ℝ) :
    AbsR (Finset.univ.sum a) ≤ Finset.univ.sum (fun i => AbsR (a i)) := by
  sorry

end LRA.Analysis.RealAnalysis
