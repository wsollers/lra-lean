  
                                                             
                                                                           
                                        

                                                                     
                                                                 
                                                         
                                                                 
                                                                     
                                                                 
                                                                       
                                                                         
                                                      
                                                        
  

import Mathlib.Data.Real.Basic
import Mathlib.Topology.Order.Basic
import Mathlib.Topology.Instances.Real.Lemmas

namespace LRA.Analysis.RealAnalysis

                                 
                                                                                                   
                                       

             

       
                                            
                          
                                                      
                                   
   
  
theorem NestedIntervalProperty (a b : ℕ → ℝ)
    (hle : ∀ n, a n ≤ b n)
    (hnest : ∀ n, a n ≤ a (n + 1) ∧ b (n + 1) ≤ b n) :
    ∃ x : ℝ, ∀ n, a n ≤ x ∧ x ≤ b n := by
  sorry

                                                                                                  
                                                                              

             

       
                                                          
                                       
                                                      
                              
   
  
theorem IvtBisection (f : ℝ → ℝ) (a b L : ℝ) (hab : a < b)
    (hf : ContinuousOn f (Set.Icc a b))
    (hL : (f a < L ∧ L < f b) ∨ (f a > L ∧ L > f b)) :
    ∃ c ∈ Set.Ioo a b, f c = L := by
  sorry

                                                               

             

       
                                                           
   
  
theorem RUncountable : ¬ ∃ x : ℕ → ℝ, Function.Surjective x := by
  sorry

end LRA.Analysis.RealAnalysis
