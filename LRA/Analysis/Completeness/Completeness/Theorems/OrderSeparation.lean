import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.Analysis.Bounds.Extrema.MaximaMinima
import LRA.Analysis.Bounds.Extrema.SupremaInfima

   
                                              
  

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

                                                                                           
                                                                                                
                                                                                         

             

       
                                               
                                         
                                          
                                                      
                                                       
                                                                 
   
  
theorem OrderSeparationBySupremum {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    (separationHypothesis : ∀ a ∈ A, ∀ b ∈ B, a ≤ b) :
    (∃ u, IsUpperBound u A) ∧ (∃ l, IsLowerBound l B) ∧
      ∃ c : ℝ, IsSupremum c A ∧ (∀ a ∈ A, ∀ b ∈ B, a ≤ c ∧ c ≤ b) := by
  sorry

                                                                              
                                                                                         
                                                                                             

             

       
                                                           
                                         
                                          
                                                    
             
                                         
                                         
         
   
  
theorem SupremumLeInfimumOfOrderSeparatedSets {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    (separationHypothesis : ∀ a ∈ A, ∀ b ∈ B, a ≤ b)
    {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i B) :
    s ≤ i := by
  sorry

                                                                                                  
                                                                                        
                                                                                          
                

             

       
                                         
                                             
                                             
                                    
                                        
                                                            
                                               
   
  
theorem DedekindCutProperty {L U : Set ℝ}
    (lowerSetNonemptyHypothesis : L.Nonempty)
    (upperSetNonemptyHypothesis : U.Nonempty)
    (disjointHypothesis : L ∩ U = ∅)
    (coverHypothesis : L ∪ U = Set.univ)
    (strictSeparationHypothesis : ∀ l ∈ L, ∀ u ∈ U, l < u) :
    (∃ m, IsMaximum m L) ∨ (∃ n, IsMinimum n U) := by
  sorry

                                                                                                  
                                                                                        
                                                                                                
                                                                  

             

       
                                   
                                             
                                             
                                    
                                        
                                                            
                                                           
                                                 
   
  
theorem NoGapsInReals {L U : Set ℝ}
    (lowerSetNonemptyHypothesis : L.Nonempty)
    (upperSetNonemptyHypothesis : U.Nonempty)
    (disjointHypothesis : L ∩ U = ∅)
    (coverHypothesis : L ∪ U = Set.univ)
    (strictSeparationHypothesis : ∀ l ∈ L, ∀ u ∈ U, l < u) :
    ∃! c : ℝ, (L = {x : ℝ | x < c} ∧ U = {x : ℝ | c ≤ x}) ∨
      (L = {x : ℝ | x ≤ c} ∧ U = {x : ℝ | c < x}) := by
  sorry

end LRA.Analysis.Completeness
