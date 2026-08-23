import LRA.Analysis.Bounds.Extrema.SupremaInfima

   
                                              
  

namespace LRA.Analysis.Bounds.Extrema

variable {S : Type*}

                                                                      
                                   

                                                                                               
                                                

             

       
                                                              
                                                                            
   
  
theorem MaximumUnique [PartialOrder S] {A : Set S} {m₁ m₂ : S}
    (leftMaximum : IsMaximum m₁ A) (rightMaximum : IsMaximum m₂ A) : m₁ = m₂ := by
  sorry

                                                                                               
                                                

             

       
                                                              
                                                                            
   
  
theorem MinimumUnique [PartialOrder S] {A : Set S} {m₁ m₂ : S}
    (leftMinimum : IsMinimum m₁ A) (rightMinimum : IsMinimum m₂ A) : m₁ = m₂ := by
  sorry

                                                                                                    
                 

             

       
                                                              
                                                        
   
  
theorem MaximumIsSupremum [PartialOrder S] {A : Set S} {m : S}
    (maximumHypothesis : IsMaximum m A) : IsSupremum m A := by
  sorry

                                                                                                    
                

             

       
                                                             
                                                       
   
  
theorem MinimumIsInfimum [PartialOrder S] {A : Set S} {m : S}
    (minimumHypothesis : IsMinimum m A) : IsInfimum m A := by
  sorry

                                                                                              
                                                     

             

       
                                                               
                                         
                                                  
   
  
theorem SupremumInSetIsMaximum [Preorder S] {A : Set S} {s : S}
    (supremumHypothesis : IsSupremum s A)
    (membershipHypothesis : s ∈ A) : IsMaximum s A := by
  sorry

                                                                                            
                                                     

             

       
                                                              
                                       
                                                  
   
  
theorem InfimumInSetIsMinimum [Preorder S] {A : Set S} {i : S}
    (infimumHypothesis : IsInfimum i A)
    (membershipHypothesis : i ∈ A) : IsMinimum i A := by
  sorry

                                                                                                  
   

             

       
                                                                              
                                          
   
  
theorem MaximumIffSupremumAndMembership [PartialOrder S] {A : Set S} {s : S} :
    IsMaximum s A ↔ IsSupremum s A ∧ s ∈ A := by
  sorry

end LRA.Analysis.Bounds.Extrema
