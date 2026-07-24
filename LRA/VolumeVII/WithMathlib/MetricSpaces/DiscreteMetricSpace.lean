import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricModeling

namespace LRA.VolumeVII.WithMathlib

/-- The discrete metric on any type of points with decidable equality. -/
def discreteScratchMetric (Point : Type u) [DecidableEq Point] : ScratchMetric Point where
  distance x y := if x = y then 0 else 1
  distance_nonnegative := by
    sorry
  distance_eq_zero_iff_equal := by
    sorry
  distance_symmetric := by
    sorry
  distance_triangle := by
    sorry

/-- Any type with decidable equality equipped with the discrete metric. -/
def discreteScratchMetricSpace (Point : Type u) [DecidableEq Point] : ScratchMetricSpace Point where
  metric := discreteScratchMetric Point

end LRA.VolumeVII.WithMathlib
