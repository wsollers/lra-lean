  
                                                                                             
                                                                                       

                                                                        
                                                                        
                                         
  

import Mathlib.Data.Real.Basic
import LRA.Analysis.Integration.RiemannIntegral
import LRA.Analysis.Integration.DarbouxIntegral
import LRA.Analysis.Continuity.PointContinuity
import LRA.Analysis.StructureOfRealLine.OpenClosedSets

namespace LRA.Analysis.Integration

                                                                        
                                                                        
                                                                   
                                                                     
                                                                         
                                                              

             

       
                                       
                                                                           
                                          
   
  
def IsMeasureZero (E : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ p q : ℕ → ℝ, (∀ k, p k < q k) ∧ E ⊆ ⋃ k, Set.Ioo (p k) (q k) ∧
    ∃ L ≤ ε, HasSum (fun k => q k - p k) L

                                        
                                                                                          


             

       
                                                        
                                                                                  
   
  
def PointOscillation (f : ℝ → ℝ) (a b x ω : ℝ) : Prop :=
  x ∈ Set.Icc a b ∧ LRA.Analysis.Continuity.OscillationAtPoint f (Set.Icc a b) x ω

                                                 
                                                             
                                                                                      
                                                                                 

             

       
                                                                                    
                                                                   
                               
                                                                                   
   
  
theorem lebesgue_criterion_riemann_integrability (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔
      IsMeasureZero {x ∈ Set.Icc a b | ∃ ω : ℝ, 0 < ω ∧ PointOscillation f a b x ω} := by
  sorry

end LRA.Analysis.Integration
