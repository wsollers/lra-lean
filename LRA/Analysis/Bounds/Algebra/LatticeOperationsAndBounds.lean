import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.Analysis.Bounds.Extrema.SupremaInfima

   
                                                 
  

namespace LRA.Analysis.Bounds.Algebra

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

                                                            

             

       
                                        
                                     
   
  
def PairwiseMax (A B : Set ℝ) : Set ℝ :=
  {x | ∃ a ∈ A, ∃ b ∈ B, x = max a b}

                                                            

             

       
                                        
                                     
   
  
def PairwiseMin (A B : Set ℝ) : Set ℝ :=
  {x | ∃ a ∈ A, ∃ b ∈ B, x = min a b}

                                                                                
                                                                                       
                                                                                             

             

       
                                                  
                                         
                                          
               
                                              
                                                 
                                            
   
  
theorem SupremumOfPairwiseMaximumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsSupremum (max sA sB) (PairwiseMax A B) := by
  sorry

                                                                                
                                                                                     
                                                                                          

             

       
                                                 
                                         
                                          
               
                                            
                                               
                                           
   
  
theorem InfimumOfPairwiseMaximumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA iB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum (max iA iB) (PairwiseMax A B) := by
  sorry

                                                                                
                                                                                       
                                                                                             

             

       
                                                  
                                         
                                          
               
                                              
                                                 
                                            
   
  
theorem SupremumOfPairwiseMinimumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {sA sB : ℝ}
    (leftSupremumHypothesis : IsSupremum sA A)
    (rightSupremumHypothesis : IsSupremum sB B) :
    IsSupremum (min sA sB) (PairwiseMin A B) := by
  sorry

                                                                                
                                                                                     
                                                                                          

             

       
                                                 
                                         
                                          
               
                                            
                                               
                                           
   
  
theorem InfimumOfPairwiseMinimumSet {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    {iA iB : ℝ}
    (leftInfimumHypothesis : IsInfimum iA A)
    (rightInfimumHypothesis : IsInfimum iB B) :
    IsInfimum (min iA iB) (PairwiseMin A B) := by
  sorry

end LRA.Analysis.Bounds.Algebra
