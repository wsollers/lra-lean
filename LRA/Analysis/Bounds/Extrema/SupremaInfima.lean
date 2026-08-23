import Mathlib.Data.Real.Basic
import LRA.Analysis.Bounds.Extrema.UpperLowerBounds

   
                                        
  

namespace LRA.Analysis.Bounds.Extrema

variable {S : Type*}

                                                                        
                                                           

                                                                                                  
                   

             

       
                                                             
                                                            
   
  
theorem SupremumIsUpperBound [Preorder S] {A : Set S} {s : S}
    (supremumHypothesis : IsSupremum s A) : IsUpperBound s A := by
  sorry

                                                                                                
                   

             

       
                                                            
                                                          
   
  
theorem InfimumIsLowerBound [Preorder S] {A : Set S} {i : S}
    (infimumHypothesis : IsInfimum i A) : IsLowerBound i A := by
  sorry

                                                                                     
                                                                   

             

       
                                                                     
                                                                          
                    
   
  
theorem SubsetPreservesUpperBounds [Preorder S] {A B : Set S} {u : S}
    (subsetHypothesis : A ⊆ B) (upperBoundHypothesis : IsUpperBound u B) :
    IsUpperBound u A := by
  sorry

                                                                                     
                                                                   

             

       
                                                                     
                                                                          
                    
   
  
theorem SubsetPreservesLowerBounds [Preorder S] {A B : Set S} {l : S}
    (subsetHypothesis : A ⊆ B) (lowerBoundHypothesis : IsLowerBound l B) :
    IsLowerBound l A := by
  sorry

                                                                                         
                                                                                        

             

       
                                                                                 
                              
                                    
                                       
           
   
  
theorem SupremumMonotoneUnderInclusion [PartialOrder S] {A B : Set S} {sA sB : S}
    (subsetHypothesis : A ⊆ B)
    (leftSupremum : IsSupremum sA A)
    (rightSupremum : IsSupremum sB B) :
    sA ≤ sB := by
  sorry

                                                                                         
                                                                                    

             

       
                                                                                
                              
                                  
                                     
           
   
  
theorem InfimumAntitoneUnderInclusion [PartialOrder S] {A B : Set S} {iA iB : S}
    (subsetHypothesis : A ⊆ B)
    (leftInfimum : IsInfimum iA A)
    (rightInfimum : IsInfimum iB B) :
    iB ≤ iA := by
  sorry

                                                                                                   
                                

             

       
                                                                      
                                           
                            
   
  
theorem UpperBoundIffSupremumLe [PartialOrder S] {A : Set S} {s u : S}
    (supremumHypothesis : IsSupremum s A) :
    IsUpperBound u A ↔ s ≤ u := by
  sorry

                                                                                                 
                                

             

       
                                                                     
                                         
                            
   
  
theorem LowerBoundIffLeInfimum [PartialOrder S] {A : Set S} {i l : S}
    (infimumHypothesis : IsInfimum i A) :
    IsLowerBound l A ↔ l ≤ i := by
  sorry

                                                                                                  
                 

             

       
                                                               
                                           
                  
   
  
theorem EveryElementLeSupremum [Preorder S] {A : Set S} {s : S}
    (supremumHypothesis : IsSupremum s A) :
    ∀ x ∈ A, x ≤ s := by
  sorry

                                                                                                   
              

             

       
                                                              
                                         
                  
   
  
theorem InfimumLeEveryElement [Preorder S] {A : Set S} {i : S}
    (infimumHypothesis : IsInfimum i A) :
    ∀ x ∈ A, i ≤ x := by
  sorry

                                                                                                  
                                                    

             

       
                                                                
                                       
                                                 
   
  
theorem InfimumLeSupremum [PartialOrder S] {A : Set S} {i s : S}
    (infimumHypothesis : IsInfimum i A)
    (supremumHypothesis : IsSupremum s A) : i ≤ s := by
  sorry

                                                                                     

             

       
                                    
                                                              
   
  
theorem SupremumNeedNotBelongToSet :
    ∃ (A : Set ℝ) (s : ℝ), A.Nonempty ∧ IsSupremum s A ∧ s ∉ A := by
  sorry

                                                                                    

             

       
                                   
                                                             
   
  
theorem InfimumNeedNotBelongToSet :
    ∃ (A : Set ℝ) (i : ℝ), A.Nonempty ∧ IsInfimum i A ∧ i ∉ A := by
  sorry

                                                                                               
                                                                                             
          

             

       
                                                                                    
                                    
                                     
                                                              
   
  
theorem SupremumComparisonByDominatingSet [PartialOrder S] {A B : Set S} {sA sB : S}
    (leftSupremum : IsSupremum sA A)
    (rightSupremum : IsSupremum sB B)
    (dominationHypothesis : ∀ a ∈ A, ∃ b ∈ B, a ≤ b) : sA ≤ sB := by
  sorry

                                                                                            
                                                   

             

       
                                            
                                     
                                                      
                            
   
  
theorem LubPropertyGivesSupremum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u A) :
    ∃! s : ℝ, IsSupremum s A := by
  sorry

                                                                                            
                                                  

             

       
                                           
                                     
                                                      
                           
   
  
theorem GlbPropertyGivesInfimum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedBelowHypothesis : ∃ l, IsLowerBound l A) :
    ∃! i : ℝ, IsInfimum i A := by
  sorry

                                                                                                
                                                              

             

       
                                                   
                                     
                                       
                                                          
   
  
theorem BoundedSetHasSupremumAndInfimum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedHypothesis : IsBounded A) :
    (∃! s : ℝ, IsSupremum s A) ∧ (∃! i : ℝ, IsInfimum i A) := by
  sorry

end LRA.Analysis.Bounds.Extrema
