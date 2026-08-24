import Mathlib.Data.Rat.Cast.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Basic
import LRA.Order.Density

namespace LRA.Analysis.Completeness

/-- Repoints to the canonical, Mathlib-free `LRA.Order.DenseSubset` (the
same statement — `∀ x y, x < y → ∃ d ∈ D, x < d ∧ d < y`) instead of
independently redefining it here with the same layer-inversion problem
`AlgebraicStructures.ArchimedeanLaw` fixed for the Archimedean property:
this file sat in `Analysis`, one layer after `Order` in the documented
dependency chain, yet reinvented an `Order`-level concept. -/
def IsOrderDenseSubset {S : Type*} [Preorder S] (D : Set S) : Prop :=
  LRA.Order.DenseSubset (· < · : S → S → Prop) D

                                                                                 

             

       
                                
                             
   
  
def IsRational (x : ℝ) : Prop :=
  x ∈ Set.range ((↑) : ℚ → ℝ)

                                                                                     

             

       
                                  
                
   
  
def IsIrrational (x : ℝ) : Prop :=
  ¬ IsRational x

end LRA.Analysis.Completeness
