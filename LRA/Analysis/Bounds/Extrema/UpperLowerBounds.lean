import Mathlib.Algebra.Order.Group.Abs
import Mathlib.Data.Set.Basic
import LRA.Analysis.Bounds.Bounds

   
                                            
  

namespace LRA.Analysis.Bounds.Extrema

variable {F : Type*}

                                                                    

             

       
                                                
                                     
   
  
def IsBound [LE F] (b : F) (A : Set F) : Prop :=
  (∀ a ∈ A, a ≤ b) ∨ (∀ a ∈ A, b ≤ a)

                                                                      
                                   

                                                                                                 
                                              

             

       
                                                                                    
                 
                                               
   
  
theorem IsBoundedIffAbsBound [AddCommGroup F] [LinearOrder F] [IsOrderedAddMonoid F]
    (A : Set F) :
    IsBounded A ↔ ∃ M, 0 ≤ M ∧ ∀ a ∈ A, |a| ≤ M := by
  sorry

end LRA.Analysis.Bounds.Extrema
