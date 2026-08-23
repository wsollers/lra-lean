import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

   
                                                                       
  

namespace LRA.Analysis.Limits

                                                                                               
                                                                                                
                            

             

       
                                                      
                                              
                                                                          
   
  
theorem PointwiseStrictOrderNeedNotPersistInTheLimit :
    ∃ (f g : ℝ → ℝ) (A : Set ℝ) (c Lf Lg : ℝ),
      (∀ x ∈ A, f x < g x) ∧ TendsTo f A c Lf ∧ TendsTo g A c Lg ∧ Lf = Lg := by
  sorry

end LRA.Analysis.Limits
