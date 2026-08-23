import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricModeling

namespace LRA.Internal

theorem discreteScratchMetricNonnegative
    (Point : Type u) [DecidableEq Point] :
    ∀ x y : Point, 0 ≤ (if x = y then 0 else 1 : Real) := by
  sorry


theorem discreteScratchMetricEqZeroIffEqual
    (Point : Type u) [DecidableEq Point] :
    ∀ x y : Point, (if x = y then 0 else 1 : Real) = 0 ↔ x = y := by
  sorry


theorem discreteScratchMetricSymmetric
    (Point : Type u) [DecidableEq Point] :
    ∀ x y : Point,
      (if x = y then 0 else 1 : Real) =
        if y = x then 0 else 1 := by
  sorry


theorem discreteScratchMetricTriangle
    (Point : Type u) [DecidableEq Point] :
    ∀ x y z : Point,
      (if x = z then 0 else 1 : Real) ≤
        (if x = y then 0 else 1 : Real) +
          if y = z then 0 else 1 := by
  sorry

                                                                      

             

       
              
                                                                     
   
  
def discreteScratchMetric (Point : Type u) [DecidableEq Point] : ScratchMetric Point where
  distance x y := if x = y then 0 else 1
  distance_nonnegative := discreteScratchMetricNonnegative Point
  distance_eq_zero_iff_equal := discreteScratchMetricEqZeroIffEqual Point
  distance_symmetric := discreteScratchMetricSymmetric Point
  distance_triangle := discreteScratchMetricTriangle Point

                                                                       

             

       
                                                                                                    
                                       
   
  
def discreteScratchMetricSpace (Point : Type u) [DecidableEq Point] : ScratchMetricSpace Point where
  metric := discreteScratchMetric Point

end LRA.Internal
