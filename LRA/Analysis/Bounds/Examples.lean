                                    
                                           

import Mathlib.Tactic
import LRA.Analysis.Bounds.Bounds

namespace LRA.Analysis.Bounds.Examples

   
                                                                      

             

       
                         
   
  
abbrev ActiveReal := Real

example : IsUpperBound (3 : ActiveReal) {1, 2, 3} := by
  intro x membership
  rcases membership with rfl | rfl | rfl <;> norm_num

example : IsMaximum (3 : ActiveReal) {1, 2, 3} := by
  refine ⟨by norm_num, ?_⟩
  intro x membership
  rcases membership with rfl | rfl | rfl <;> norm_num

example : IsSupremum (3 : ActiveReal) {1, 2, 3} :=
  MaximumIsSupremum (by
    refine ⟨by norm_num, ?_⟩
    intro x membership
    rcases membership with rfl | rfl | rfl <;> norm_num)

end LRA.Analysis.Bounds.Examples
