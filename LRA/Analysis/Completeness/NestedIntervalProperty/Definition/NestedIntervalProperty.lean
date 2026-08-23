import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic

   
                                                                     
                  
  

namespace LRA.Analysis.Completeness

variable (F : Type*)

                                                                     

             

       
                                                 
                                                             
                               
   
  
def NestedIntervalProperty [Preorder F] : Prop :=
  ∀ a b : ℕ → F, Monotone a → Antitone b → (∀ n, a n ≤ b n) →
    ∃ x, ∀ n, a n ≤ x ∧ x ≤ b n

variable (a b : ℕ → ℝ)

                                                                                                                                        

             

       
                                          
                    
                                                                
   
  
def IsNestedClosedIntervalFamily : Prop :=
  (∀ n, a n ≤ b n) ∧
    (∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))

end LRA.Analysis.Completeness
