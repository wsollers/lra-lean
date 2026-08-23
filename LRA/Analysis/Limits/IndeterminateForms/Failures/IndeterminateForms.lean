import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition
import LRA.Analysis.Limits.LimitsAtInfinity.Definition

   
                                                                        
                                                                         
                                                                       
                                                                      
                        
  

namespace LRA.Analysis.Limits

                                                                                               
                                                                             

             

       
                                     
                                                
                                                                     
                                                                       
                                                        
                                                         
   
  
theorem ZeroOverZeroIsIndeterminate :
    ∃ (f g f' g' : ℝ → ℝ) (c L L' : ℝ), L ≠ L' ∧
      TendsTo f {x : ℝ | x ≠ c} c 0 ∧ TendsTo g {x : ℝ | x ≠ c} c 0 ∧
      TendsTo f' {x : ℝ | x ≠ c} c 0 ∧ TendsTo g' {x : ℝ | x ≠ c} c 0 ∧
      TendsTo (fun x => f x / g x) {x : ℝ | x ≠ c} c L ∧
      TendsTo (fun x => f' x / g' x) {x : ℝ | x ≠ c} c L' := by
  sorry

                                                                                               
                                                                     

             

       
                                      
                                                     
                                                
                                             
                                             
   
  
theorem OneToTheInftyIsIndeterminate :
    ∃ (f f' : ℝ → ℝ) (X : Set ℝ) (L L' : ℝ), L ≠ L' ∧
      TendsToInfty f X 1 ∧ TendsToInfty f' X 1 ∧
      TendsToInfty (fun x => (f x) ^ x) X L ∧
      TendsToInfty (fun x => (f' x) ^ x) X L' := by
  sorry

end LRA.Analysis.Limits
