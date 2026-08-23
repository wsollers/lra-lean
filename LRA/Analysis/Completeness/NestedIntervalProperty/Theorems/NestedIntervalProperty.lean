import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Bounds.Extrema.SupremaInfima
import LRA.Analysis.Completeness.NestedIntervalProperty.Definition

   
                                                                   
                                                                   
                   
  

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

variable (a b : ℕ → ℝ)

                                                                                                    
                                                                                               
                             

             

       
                                                 
                                                
                                                                                   
             
                                    
                                     
   
  
theorem NestedClosedIntervalsHaveOrderedEndpoints
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {m n : ℕ}
    (indexOrderHypothesis : n ≤ m) :
    a n ≤ a m ∧ a m ≤ b m ∧ b m ≤ b n := by
  sorry

                                                                                                    
                                                                

             

       
                                              
                                                
                                                                                     
                        
   
  
theorem LeftEndpointsOfNestedIntervalsIncrease
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ n, a n ≤ a (n + 1) := by
  sorry

                                                                                                    
                                                                

             

       
                                               
                                                
                                                                                     
                        
   
  
theorem RightEndpointsOfNestedIntervalsDecrease
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ n, b (n + 1) ≤ b n := by
  sorry

                                                                                                    
                                                            

             

       
                                                    
                                                
                                                                                     
                    
   
  
theorem LeftEndpointsAreBoundedAboveByRightEndpoints
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ m n, a n ≤ b m := by
  sorry

                                                                                                    
                                                                                
                                                                          
                                                                                                
                    

             

       
                                         
                                                
                                                                                   
                                              
                                                                         
                                                                           
                                          
   
  
theorem EndpointSupremumLeEndpointInfimum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit rightEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a))
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    leftEndpointLimit ≤ rightEndpointLimit := by
  sorry

                                                                                                    
                                                                                
                                                                          
                                                                                                
                                                                                            

             

       
                             
                                                
                                                                                   
                                              
                                                                         
                                                                           
                                            
                                           
                                       
   
  
theorem NestedIntervalTheorem
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit rightEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a))
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    leftEndpointLimit ≤ rightEndpointLimit ∧
      (⋂ n, Set.Icc (a n) (b n)).Nonempty ∧
        ∃ x : ℝ, ∀ n, a n ≤ x ∧ x ≤ b n := by
  sorry

                                                                                                   
                                                                                            
                                                                                  
                                                                         

             

       
                                                          
                                                
                                                                                   
                           
                                                                           
                                                              
                                                  
   
  
theorem NestedIntervalIntersectionContainsEndpointSupremum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a)) :
    (∀ n, a n ≤ leftEndpointLimit ∧ leftEndpointLimit ≤ b n) ∧
      leftEndpointLimit ∈ ⋂ n, Set.Icc (a n) (b n) := by
  sorry

                                                                                                    
                                                                                            
                                                                                   
                                                                           

             

       
                                                         
                                                
                                                                                   
                            
                                                                           
                                                                
                                                   
   
  
theorem NestedIntervalIntersectionContainsEndpointInfimum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {rightEndpointLimit : ℝ}
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    (∀ n, a n ≤ rightEndpointLimit ∧ rightEndpointLimit ≤ b n) ∧
      rightEndpointLimit ∈ ⋂ n, Set.Icc (a n) (b n) := by
  sorry

                                                                                                    
                                                                                                
                                                                                               
                           

             

       
                                                         
                                                
                                                                                   
                                
                                                             
                                        
                                                            
   
  
theorem NestedIntervalsWithVanishingLengthHaveUniquePoint
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (vanishingLengthHypothesis :
      ∀ ε > 0, ∃ N, ∀ n ≥ N, 0 ≤ b n - a n ∧ b n - a n < ε) :
    ∃! x : ℝ, (∀ n, a n ≤ x ∧ x ≤ b n) ∧
      IsSupremum x (Set.range a) ∧ IsInfimum x (Set.range b) := by
  sorry

                                                                                                    
                                                                                                
                                                                                             
          

             

       
                                                                 
                                                
                                                                                   
                                                                        
                                                     
                                            
   
  
theorem NestedIntervalsWithVanishingLengthHaveEqualEndpointLimits
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (vanishingLengthHypothesis : ∀ ε > 0, ∃ N, ∀ n ≥ N, b n - a n < ε) :
    ∃ x : ℝ, Filter.Tendsto a Filter.atTop (nhds x) ∧
      Filter.Tendsto b Filter.atTop (nhds x) := by
  sorry

                                                                                                  
                                                                                            
                                                                                            
                       

             

       
                                                   
                                                
                                                                                   
           
                                                                          
                                            
                                            
   
  
theorem UniquePointInNestedIntervalsIsEndpointLimit
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {x : ℝ}
    (singletonIntersectionHypothesis : (⋂ n, Set.Icc (a n) (b n)) = {x}) :
    Filter.Tendsto a Filter.atTop (nhds x) ∧
      Filter.Tendsto b Filter.atTop (nhds x) := by
  sorry

                                                                                                  
       

             

       
                                                                       
                                                                               
   
  
theorem IsNestedClosedIntervalFamilyIffMonotoneAntitone (a b : ℕ → ℝ) :
    IsNestedClosedIntervalFamily a b ↔ Monotone a ∧ Antitone b ∧ ∀ n, a n ≤ b n := by
  sorry

                                                   

             

       
                                                                     
   
  
theorem RealsSatisfyNestedIntervalProperty : NestedIntervalProperty ℝ := by
  sorry

end LRA.Analysis.Completeness
