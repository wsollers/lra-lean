import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricModeling
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Data.Real.Sqrt
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

namespace LRA.Interop.Mathlib

                                                                             
                                           

             

       
                               
                          
   
  
abbrev cartesianSpace : Type :=
  EuclideanSpace ℝ (Fin 2)

                                                             

             

       
                                                     
                                               
   
  
noncomputable def cartesianOrigin : cartesianSpace :=
  (EuclideanSpace.equiv (Fin 2) ℝ).symm ![0, 0]

                                                                     

             

       
                                                     
                                               
   
  
noncomputable def cartesianOneOne : cartesianSpace :=
  (EuclideanSpace.equiv (Fin 2) ℝ).symm ![1, 1]

                                                                               
                     

             

       
                                            
                                                      
   
  
lemma dist_cartesianOrigin_cartesianOneOne :
    dist cartesianOrigin cartesianOneOne = Real.sqrt 2 := by
  sorry

                                                                              

             

       
                                                               
                                                   
   
  
noncomputable def toE (p : ℝ × ℝ) : EuclideanSpace ℝ (Fin 2) :=
  (EuclideanSpace.equiv (Fin 2) ℝ).symm ![p.1, p.2]

                                                                         
                                                   

             

       
                                           
                                                                        
   
  
lemma distance_eq_euclidean (p q : ℝ × ℝ) :
    Real.sqrt ((p.1 - q.1) ^ 2 + (p.2 - q.2) ^ 2) = dist (toE p) (toE q) := by
  sorry

end LRA.Interop.Mathlib

namespace LRA.Internal

open LRA.Interop.Mathlib

                                                 

             

       
                                                                                     
              
   
  
noncomputable def realPlaneScratchEuclideanMetric : ScratchMetric (Real × Real) where
  distance p q :=
    Real.sqrt ((p.1 - q.1) ^ 2 + (p.2 - q.2) ^ 2)

  distance_nonnegative := by
    intro p q
    exact Real.sqrt_nonneg _

  distance_eq_zero_iff_equal := by
    intro p q
    constructor
         
    · intro hypothesis
      have h_nonneg : 0 ≤ (p.1 - q.1) ^ 2 + (p.2 - q.2) ^ 2 := by positivity
      rw [Real.sqrt_eq_zero h_nonneg] at hypothesis
      ext
      · have h_sq : (p.1 - q.1) ^ 2 = 0 := by nlinarith
        rwa [sq_eq_zero_iff, sub_eq_zero] at h_sq
      · have h_sq : (p.2 - q.2) ^ 2 = 0 := by nlinarith
        rwa [sq_eq_zero_iff, sub_eq_zero] at h_sq
         
    · intro hypothesis
      rw [hypothesis]
      ring_nf
      exact Real.sqrt_zero

  distance_symmetric := by
    intro x y
    congr 1
    ring_nf

  distance_triangle := by
    intro x y z
    rw [distance_eq_euclidean, distance_eq_euclidean, distance_eq_euclidean]
    exact dist_triangle (toE x) (toE y) (toE z)

                                                            

             

       
                                                                                      
                                           
   
  
noncomputable def realPlaneScratchMetricSpace : ScratchMetricSpace (Real × Real) where
  metric := realPlaneScratchEuclideanMetric

end LRA.Internal
