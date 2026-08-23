import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic

   
                                                                      
                                                                
  

namespace LRA.Analysis.Completeness

                                                                                                  
                                                       

             

       
                                                            
                                     
                                                                    
                                      
   
  
theorem OpenNestedIntervalsNeedNotHaveNonemptyIntersection :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioo (a (n + 1)) (b (n + 1)) ⊆ Set.Ioo (a n) (b n)) ∧
        (⋂ n, Set.Ioo (a n) (b n)) = ∅ := by
  sorry

                                                                                                  
                                                       

             

       
                                                      
                                     
                                                                    
                                      
   
  
theorem ClosednessIsNecessaryInNestedIntervalTheorem :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioc (a (n + 1)) (b (n + 1)) ⊆ Set.Ioc (a n) (b n)) ∧
        (⋂ n, Set.Ioc (a n) (b n)) = ∅ := by
  sorry

                                                                                                   
         

             

       
                                                       
                                                             
                              
   
  
theorem BoundednessIsNecessaryInNestedIntervalTheorem :
    ∃ a : ℕ → ℝ, (∀ n, Set.Ici (a (n + 1)) ⊆ Set.Ici (a n)) ∧
      (⋂ n, Set.Ici (a n)) = ∅ := by
  sorry

end LRA.Analysis.Completeness
