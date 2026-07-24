import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricSpace

namespace LRA.VolumeVII.WithMathlib

/-- The discrete metric on any type of points with decidable equality. -/
def discreteMetric (Point : Type u) [DecidableEq Point] : Metric Point where
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
def discreteMetricSpace (Point : Type u) [DecidableEq Point] : MetricSpace Point where
  metric := discreteMetric Point

end LRA.VolumeVII.WithMathlib
