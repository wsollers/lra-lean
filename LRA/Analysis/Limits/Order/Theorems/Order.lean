import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

   
                                                                         
                                                                   
                                                                    
  

namespace LRA.Analysis.Limits

variable {f g : ℝ → ℝ} {A : Set ℝ} {c Lf Lg L : ℝ}

                                                                                                   
                                                                      
                                                             

             

       
                                                 
                                                     
           
   
  
theorem TendstoOrderLe (hfg : ∀ x ∈ A, f x ≤ g x)
    (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    Lf ≤ Lg := by
  sorry

                                                                                                 
                                                                                          
                                                                              

             

       
                                                                              
                      
                                                           
   
  
theorem TendstoStrictOrderNear (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg)
    (hLfg : Lf < Lg) :
    ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → f x < g x := by
  sorry

                                                       

             

       
                                                   
                                                                    
   
  
theorem TendstoBoundedNear (hf : TendsTo f A c L) :
    ∃ δ > 0, ∃ M : ℝ, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x| ≤ M := by
  sorry

                                                                                                   
                                                                                               
        

             

       
                                                                 
                                                             
   
  
theorem TendstoSameSignNear (hf : TendsTo f A c L) (hL : L ≠ 0) :
    ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → 0 < L * f x := by
  sorry

end LRA.Analysis.Limits
