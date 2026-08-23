import Mathlib.Data.Real.Basic

namespace LRA.Analysis.StructureOfRealLine

   
                                                                    
  

                                                                        
                                               

             

       
                                       
                          
                                                                       
   
  
theorem ClosedUnitIntervalUncountable :
    ¬ ∃ enumerate : ℕ → ℝ,
      ∀ x : ℝ, x ∈ Set.Icc (0 : ℝ) 1 → ∃ index : ℕ, enumerate index = x := by
  sorry

end LRA.Analysis.StructureOfRealLine
