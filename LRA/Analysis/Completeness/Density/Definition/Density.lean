import Mathlib.Data.Rat.Cast.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Basic

   
                                                                  
                                                 
  

namespace LRA.Analysis.Completeness

                                                                                            

             

       
                                                                     
                                           
   
  
def IsOrderDenseSubset {S : Type*} [Preorder S] (D : Set S) : Prop :=
  ∀ x y : S, x < y → ∃ d ∈ D, x < d ∧ d < y

                                                                                 

             

       
                                
                             
   
  
def IsRational (x : ℝ) : Prop :=
  x ∈ Set.range ((↑) : ℚ → ℝ)

                                                                                     

             

       
                                  
                
   
  
def IsIrrational (x : ℝ) : Prop :=
  ¬ IsRational x

end LRA.Analysis.Completeness
