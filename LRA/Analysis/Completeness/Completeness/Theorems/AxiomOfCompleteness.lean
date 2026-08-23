import Mathlib.Data.Real.Basic
import LRA.Analysis.Bounds.Extrema.SupremaInfima
import LRA.Analysis.Completeness.Completeness.Definition

   
                                                                        
  

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

                                                                                            
                                              

             

       
                                                 
                                     
                                                      
                       
   
  
theorem CompletenessGivesRealSupremum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u A) :
    ∃ s, IsSupremum s A := by
  sorry

end LRA.Analysis.Completeness
