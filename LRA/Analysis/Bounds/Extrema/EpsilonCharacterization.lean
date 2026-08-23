import LRA.Analysis.Bounds.Extrema.SupremaInfima

   
                                                                 
  

namespace LRA.Analysis.Bounds.Extrema

                                                                                                    
           

             

       
                                                             
                    
                                                            
   
  
theorem SupremumEpsilonCharacterization {A : Set ℝ} {s : ℝ} :
    IsSupremum s A ↔
      IsUpperBound s A ∧ ∀ ε : ℝ, 0 < ε → ∃ a ∈ A, s - ε < a := by
  sorry

                                                                                                   
           

             

       
                                                            
                   
                                                            
   
  
theorem InfimumEpsilonCharacterization {A : Set ℝ} {i : ℝ} :
    IsInfimum i A ↔
      IsLowerBound i A ∧ ∀ ε : ℝ, 0 < ε → ∃ a ∈ A, a < i + ε := by
  sorry

                                                                                                    
                                

             

       
                                                              
                                         
                                   
                  
   
  
theorem SupremumStrictUpperApproximation {A : Set ℝ} {s u : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (strictApproximation : u < s) :
    ∃ a ∈ A, u < a := by
  sorry

                                                                                                    
                              

             

       
                                                             
                                       
                                   
                  
   
  
theorem InfimumStrictLowerApproximation {A : Set ℝ} {i l : ℝ}
    (infimumHypothesis : IsInfimum i A)
    (strictApproximation : i < l) :
    ∃ a ∈ A, a < l := by
  sorry

end LRA.Analysis.Bounds.Extrema
