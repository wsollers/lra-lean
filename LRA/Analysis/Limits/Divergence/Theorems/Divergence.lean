import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Divergence.Definition

   
                                                                       
                                            
  

namespace LRA.Analysis.Limits

                                                                                                    
     

             

       
                                                                         
                           
                           
   
  
theorem HasJumpAtImpliesLimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : HasJumpAt f A c) :
    LimitDoesNotExist f A c := by
  sorry

                                                                                                     
     

             

       
                                                                          
                            
                           
   
  
theorem OscillatesImpliesLimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : Oscillates f A c) :
    LimitDoesNotExist f A c := by
  sorry

                                                                                                    
                                                                  

             

       
                                                                                 
                                                      
                                   
                           
   
  
theorem DivergesToInftyAtImpliesLimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hA : ∀ δ > 0, ∃ x ∈ A, 0 < |x - c| ∧ |x - c| < δ)
    (h : DivergesToInftyAt f A c) :
    LimitDoesNotExist f A c := by
  sorry

                                                                                          

             

       
                                   
                                                                    
   
  
theorem StepFunctionHasJumpAtZero :
    HasJumpAt (fun x : ℝ => if x < 0 then (0 : ℝ) else 1) Set.univ 0 := by
  sorry

                                                                                             
                                                             

             

       
                                         
                                                                
   
  
theorem SinOfReciprocalOscillatesAtZero :
    Oscillates (fun x : ℝ => Real.sin (1 / x)) {x : ℝ | x ≠ 0} 0 := by
  sorry

end LRA.Analysis.Limits
