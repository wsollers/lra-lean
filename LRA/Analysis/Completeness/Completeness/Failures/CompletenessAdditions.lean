import Mathlib.Data.Real.Basic
import Mathlib.Order.Bounds.Basic
import LRA.Analysis.Completeness.Completeness.Definition

   
                                                                              
                                                                              
                                    

                                          
  

namespace LRA.Analysis.Completeness

section RationalLeastUpperBoundFailure

                                                                                                      

             

       
                                  
                                        
                                                         
                                                  
   
  
theorem RationalsLackLubProperty :
    RationalCutLowerAtSqrtTwo.Nonempty ∧
      (∃ u : ℚ, ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ u) ∧
      ¬ ∃ s : ℚ, IsLUB RationalCutLowerAtSqrtTwo s := by
  sorry

                                                        

             

       
                                                       
                                
   
  
def RationalsDoNotHaveLeastUpperBoundProperty : Prop :=
  ¬ HasLeastUpperBoundProperty ℚ

                                                                                          

             

       
                                                                           
                                             
   
  
theorem RationalSqrtTwoCutProvesRationalsDoNotHaveLeastUpperBoundProperty :
    RationalsDoNotHaveLeastUpperBoundProperty := by
  sorry

                                                                             

             

       
                                             
                                       
                                                 
                                       
                                               
   
  
theorem RationalDedekindCutAtSqrtTwoHasAGap :
    (¬ ∃ m ∈ RationalCutLowerAtSqrtTwo,
        ∀ x ∈ RationalCutLowerAtSqrtTwo, x ≤ m) ∧
    (¬ ∃ m ∈ RationalCutUpperAtSqrtTwo,
        ∀ x ∈ RationalCutUpperAtSqrtTwo, m ≤ x) := by
  sorry

end RationalLeastUpperBoundFailure

end LRA.Analysis.Completeness
