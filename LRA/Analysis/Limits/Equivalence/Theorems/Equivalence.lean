import Mathlib.Data.List.TFAE
import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

   
                                                                      
                                                                          
                                                                       
  

namespace LRA.Analysis.Limits

                                                      
                                                                                                
                      

             

       
                                                                   
                                                                
   
  
theorem TendstoIffOneSidedAgree (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔ TendsToLeft f A c L ∧ TendsToRight f A c L := by
  sorry

                                                                                        
                                                                              

             

       
                                                                      
                     
                                                  
                                                     
   
  
theorem SequentialCriterionTendsto (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔
      ∀ xs : ℕ → ℝ, ApproachesButNotEqual xs A c →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε := by
  sorry

                                                                              
                                                                        
                                                                          
                                                                          
                                                                 

             

       
                                                                   
                     
                                                                   
                        
                                                            
                                        
   
  
theorem TendstoIffNeighbourhood (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    TendsTo f A c L ↔
      ∀ εNbhd : Set ℝ, (∃ ε > 0, εNbhd = Set.Ioo (L - ε) (L + ε)) →
        ∃ δNbhd : Set ℝ,
          (∃ δ > 0, δNbhd = Set.Ioo (c - δ) (c + δ) \ {c}) ∧
            ∀ x ∈ δNbhd ∩ A, f x ∈ εNbhd := by
  sorry

                                                                                         
                                                                                 
                                       

             

       
                                                                        
                     
                                                 
                                                  
                                                      
                                                                   
                        
                                                            
                                              
   
  
theorem TendstoCharacterizationsTFAE (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    [TendsTo f A c L,
      TendsToLeft f A c L ∧ TendsToRight f A c L,
      ∀ xs : ℕ → ℝ, ApproachesButNotEqual xs A c →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε,
      ∀ εNbhd : Set ℝ, (∃ ε > 0, εNbhd = Set.Ioo (L - ε) (L + ε)) →
        ∃ δNbhd : Set ℝ,
          (∃ δ > 0, δNbhd = Set.Ioo (c - δ) (c + δ) \ {c}) ∧
            ∀ x ∈ δNbhd ∩ A, f x ∈ εNbhd].TFAE := by
  sorry

end LRA.Analysis.Limits
