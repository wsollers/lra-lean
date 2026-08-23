import Mathlib.Data.Rat.Cast.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.Analysis.Completeness.Density.Definition
import LRA.Analysis.Completeness.Density.Theorems

   
                                                          
  

namespace LRA.Analysis.Completeness

                                                                                            
                                

             

       
                                                                   
                                                  
                                                   
                          
                                                              
   
  
theorem IntersectionOfDenseRationalsAndIrrationalsIsNotOrderDense :
    IsOrderDenseSubset (Set.range ((↑) : ℚ → ℝ)) ∧
      IsOrderDenseSubset {x : ℝ | ¬ IsRational x} ∧
      ¬ IsOrderDenseSubset
          (Set.range ((↑) : ℚ → ℝ) ∩ {x : ℝ | ¬ IsRational x}) := by
  sorry

end LRA.Analysis.Completeness
