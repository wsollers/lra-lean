  
                                                             
                                                                  
                                        

                                                                          
                                                                        
                                               
                                                               
                                                                        
                                                                         
                                                                         
                                                                          
                                                                       
                                                                         
                                                                  
                                                             
  

import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.Basic

namespace LRA.Analysis.RealAnalysis

                                                                            

             

       
                                      
                                                 
   
  
theorem IoEvDichotomy (P : ℕ → Prop) :
    (∀ N, ∃ n ≥ N, P n) ↔ ¬ (∃ N, ∀ n ≥ N, ¬ P n) := by
  sorry

                             
                                                                                             

             

       
                                         
                                                                     
   
  
theorem MonotoneSubsequence (x : ℕ → ℝ) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧ (Monotone (x ∘ φ) ∨ Antitone (x ∘ φ)) := by
  sorry

                                                                                               
                                              

             

       
                                                              
                               
                                                           
   
  
theorem BwBisection (x : ℕ → ℝ) (hbdd : ∃ M, ∀ n, |x n| ≤ M) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ L : ℝ, Filter.Tendsto (x ∘ φ) Filter.atTop (nhds L) := by
  sorry

end LRA.Analysis.RealAnalysis
