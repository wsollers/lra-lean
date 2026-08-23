import Mathlib.Data.Rat.Cast.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Basic
import LRA.Analysis.Completeness.Density.Definition
import LRA.Order.Density

   
                                                                           
                                                 
  

namespace LRA.Analysis.Completeness

                                                                                              
                                                    

             

       
                                                                          
                               
                                              
                         
   
  
theorem IsOrderDenseSubsetMonotone {S : Type*} [Preorder S] {D D' : Set S}
    (subsetHypothesis : D ⊆ D')
    (denseHypothesis : IsOrderDenseSubset D) :
    IsOrderDenseSubset D' := by
  sorry

                                                                                           
                             

             

       
                                                                                
                                              
                              
   
  
theorem IsOrderDenseSubsetUnion {S : Type*} [Preorder S] {D : Set S} (E : Set S)
    (denseHypothesis : IsOrderDenseSubset D) :
    IsOrderDenseSubset (D ∪ E) := by
  sorry

                                                                                     
                           

             

       
                                                                         
                                                                     
   
  
theorem IsOrderDenseSubsetUnivIffDenseOrderLaw {S : Type*} [Preorder S] :
    IsOrderDenseSubset (Set.univ : Set S) ↔ LRA.Order.DenseOrderLaw S := by
  sorry

                                                                                              

             

       
                                           
                                  
                                      
   
  
theorem DensityOfRationalsInReals {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b := by
  sorry

                                                                                                   

             

       
                                             
                                  
                                           
   
  
theorem DensityOfIrrationalsInReals {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ s : ℝ, ¬ IsRational s ∧ a < s ∧ s < b := by
  sorry

                                                                                                     
                 

             

       
                                                  
                                          
                                                       
   
  
theorem IrrationalBetweenAnyTwoRationals {r s : ℚ}
    (rationalIntervalHypothesis : r < s) :
    ∃ x : ℝ, ¬ IsRational x ∧ (r : ℝ) < x ∧ x < (s : ℝ) := by
  sorry

                                                                                                 
                                                                                           

             

       
                                                  
                                               
                                                
                                  
                                      
   
  
theorem RationalBetweenAnyTwoIrrationals {x y : ℝ}
    (leftIrrationalHypothesis : ¬ IsRational x)
    (rightIrrationalHypothesis : ¬ IsRational y)
    (intervalHypothesis : x < y) :
    ∃ q : ℚ, x < (q : ℝ) ∧ (q : ℝ) < y := by
  sorry

                                                                                                    
     

             

       
                                             
                                           
                                           
   
  
theorem SmallIrrationalPositiveNumber {ε : ℝ}
    (positiveToleranceHypothesis : ε > 0) :
    ∃ η : ℝ, ¬ IsRational η ∧ 0 < η ∧ η < ε := by
  sorry

                                                                                  

             

       
                                       
                                  
                          
   
  
theorem NoAdjacentRealNumbers {a b : ℝ}
    (intervalHypothesis : a < b) :
    ∃ c : ℝ, a < c ∧ c < b := by
  sorry

                                                                  

             

       
                                              
                                             
   
  
theorem NoImmediateSuccessorsInReals (a : ℝ) :
    ¬ ∃ m : ℝ, a < m ∧ ∀ x : ℝ, a < x → m ≤ x := by
  sorry

                                                                  

             

       
                                                
                                             
   
  
theorem NoImmediatePredecessorsInReals (a : ℝ) :
    ¬ ∃ m : ℝ, m < a ∧ ∀ x : ℝ, x < a → x ≤ m := by
  sorry

                                                                                                    
                                     

             

       
                                                                
                                  
                                          
                                             
   
  
theorem EveryOpenIntervalContainsRationalAndIrrational {a b : ℝ}
    (intervalHypothesis : a < b) :
    (∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b) ∧
      ∃ s : ℝ, ¬ IsRational s ∧ a < s ∧ s < b := by
  sorry

                                                                                          
                                                                 

             

       
                                                                     
                                  
                                                  
                                                       
   
  
theorem InfinitelyManyRationalsAndIrrationalsInOpenInterval {a b : ℝ}
    (intervalHypothesis : a < b) :
    {q : ℚ | a < (q : ℝ) ∧ (q : ℝ) < b}.Infinite ∧
      {s : ℝ | ¬ IsRational s ∧ a < s ∧ s < b}.Infinite := by
  sorry

end LRA.Analysis.Completeness
