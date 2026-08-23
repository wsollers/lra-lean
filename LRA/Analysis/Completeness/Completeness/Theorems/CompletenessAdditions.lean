import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt
import LRA.Analysis.Completeness.Completeness.Definition

   
                                                                            

                                          
  

namespace LRA.Analysis.Completeness

                                                                     

             

       
                                                     
                               
   
  
theorem ExistsUniqueNonnegSqrt (a : ℝ) (ha : 0 ≤ a) :
    ∃! b : ℝ, 0 ≤ b ∧ b ^ 2 = a := by
  sorry

                                                                                              
                                                                                      

             

       
                                          
                                                                         
                                          
                                                   
   
  
theorem RealDedekindCutAtSqrtTwoHasNoGap :
    (¬ ∃ m ∈ RealCutLowerAtSqrtTwo, ∀ x ∈ RealCutLowerAtSqrtTwo, x ≤ m) ∧
    (Real.sqrt 2 ∈ RealCutUpperAtSqrtTwo ∧
      ∀ x ∈ RealCutUpperAtSqrtTwo, Real.sqrt 2 ≤ x) := by
  sorry

                                                                                            
                                                                   

             

       
                                     
                                             
                                                 
                                                 
   
  
theorem BisectionStepsTowardSqrtTwo :
    (1 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 2 ∧
    (1.4 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.5 ∧
    (1.41 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 1.42 := by
  sorry

end LRA.Analysis.Completeness
