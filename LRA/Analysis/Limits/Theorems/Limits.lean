import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

   
                                                                        
                                                                    
                                             
  

namespace LRA.Analysis.Limits

                     
                                                                                                    
                                                                           

             

       
                                                           
                                                      
                                                             
   
  
theorem TendstoUnique (f : ℝ → ℝ) (A : Set ℝ) (c L₁ L₂ : ℝ)
    (hc : ∀ δ > 0, ∃ x ∈ A, 0 < |x - c| ∧ |x - c| < δ)
    (h₁ : TendsTo f A c L₁) (h₂ : TendsTo f A c L₂) : L₁ = L₂ := by
  sorry

                              
                                                                                                  
                                                                                                
       

             

       
                                                              
                                                     
                                                
                                      
   
  
theorem TendstoComp (f g : ℝ → ℝ) (A B : Set ℝ) (c₁ c₂ L₂ : ℝ)
    (hf : TendsTo f A c₁ c₂) (hfA : ∀ x ∈ A, f x ∈ B)
    (hg : TendsTo g B c₂ L₂) (hgc : g c₂ = L₂) :
    TendsTo (fun x => g (f x)) A c₁ L₂ := by
  sorry

end LRA.Analysis.Limits
