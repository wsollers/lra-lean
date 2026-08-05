import LRA.VolumeIV.MetricSpaces.Balls.Basic
import LRA.VolumeIV.MetricSpaces.Compatibility.Basic

namespace LRA.VolumeIV.MetricSpaces

universe u

/-- The open ball built directly from a textbook `MetricDefinition`. -/
def textbookBall {X : Type u} (metric : MetricDefinition X) (center : X) (radius : Real) :
    Set X :=
  { point | metric.distance point center < radius }

/-- Test copy of `ball_subset_ball_of_mem` against the active Mathlib metric. -/
example
    {X : Type u}
    [MetricSpace X]
    {x y : X}
    {r : Real}
    (pointInBall : y ∈ Metric.ball x r) :
    ∃ ε > 0, Metric.ball y ε ⊆ Metric.ball x r := by
  use r - dist x y
  constructor
  · rw [Metric.mem_ball] at pointInBall
    rw [dist_comm y x] at pointInBall
    exact sub_pos.mpr pointInBall
  · intro p pointInSmallBall
    have pointDistance : dist x y < r := by
      rw [Metric.mem_ball] at pointInBall
      rw [dist_comm y x] at pointInBall
      exact pointInBall
    have smallDistance : dist y p < r - dist x y := by
      rw [Metric.mem_ball] at pointInSmallBall
      rw [dist_comm p y] at pointInSmallBall
      exact pointInSmallBall
    have triangleBound : dist x p ≤ dist x y + dist y p := by
      exact dist_triangle x y p
    have combinedBound : dist x p < dist x y + (r - dist x y) := by
      exact lt_of_le_of_lt triangleBound (by
        simpa [add_comm, add_left_comm, add_assoc] using
          add_lt_add_left smallDistance (dist x y))
    have finalDistance : dist x p < r := by
      linarith
    rw [Metric.mem_ball]
    rw [dist_comm p x]
    exact finalDistance

/-- Test copy with your textbook `MetricDefinition` converted into a Mathlib
metric-space instance. -/
example
    {X : Type u}
    (metric : MetricDefinition X)
    {x y : X}
    {r : Real}
    (pointInBall :
      letI : MetricSpace X := metric.ToMathlibMetricSpace
      y ∈ Metric.ball x r) :
    letI : MetricSpace X := metric.ToMathlibMetricSpace
    ∃ ε > 0, Metric.ball y ε ⊆ Metric.ball x r := by
  letI : MetricSpace X := metric.ToMathlibMetricSpace
  use r - dist x y
  constructor
  · rw [Metric.mem_ball] at pointInBall
    rw [dist_comm y x] at pointInBall
    exact sub_pos.mpr pointInBall
  · intro p pointInSmallBall
    have pointDistance : dist x y < r := by
      rw [Metric.mem_ball] at pointInBall
      rw [dist_comm y x] at pointInBall
      exact pointInBall
    have smallDistance : dist y p < r - dist x y := by
      rw [Metric.mem_ball] at pointInSmallBall
      rw [dist_comm p y] at pointInSmallBall
      exact pointInSmallBall
    have triangleBound : dist x p ≤ dist x y + dist y p := by
      exact dist_triangle x y p
    have combinedBound : dist x p < dist x y + (r - dist x y) := by
      exact lt_of_le_of_lt triangleBound (by
        simpa [add_comm, add_left_comm, add_assoc] using
          add_lt_add_left smallDistance (dist x y))
    have finalDistance : dist x p < r := by
      linarith
    rw [Metric.mem_ball]
    rw [dist_comm p x]
    exact finalDistance

/-- Test copy using the raw textbook metric record directly, without
`Metric.ball` or Mathlib's `dist`. -/
example
    {X : Type u}
    (metric : MetricDefinition X)
    {x y : X}
    {r : Real}
    (pointInBall : y ∈ textbookBall metric x r) :
    ∃ ε > 0, textbookBall metric y ε ⊆ textbookBall metric x r := by
  use r - metric.distance x y
  constructor
  · have pointDistance : metric.distance x y < r := by
      have pointDistanceYX : metric.distance y x < r := by
        simpa [textbookBall] using pointInBall
      simpa [metric.symmetric y x] using pointDistanceYX
    exact sub_pos.mpr pointDistance
  · intro p pointInSmallBall
    have pointDistance : metric.distance x y < r := by
      have pointDistanceYX : metric.distance y x < r := by
        simpa [textbookBall] using pointInBall
      simpa [metric.symmetric y x] using pointDistanceYX
    have smallDistance : metric.distance y p < r - metric.distance x y := by
      have smallDistancePY : metric.distance p y < r - metric.distance x y := by
        simpa [textbookBall] using pointInSmallBall
      simpa [metric.symmetric p y] using smallDistancePY
    have triangleBound :
        metric.distance x p ≤ metric.distance x y + metric.distance y p := by
      exact metric.triangle x y p
    have combinedBound :
        metric.distance x p < metric.distance x y + (r - metric.distance x y) := by
      exact lt_of_le_of_lt triangleBound (by
        simpa [add_comm, add_left_comm, add_assoc] using
          add_lt_add_left smallDistance (metric.distance x y))
    have finalDistance : metric.distance x p < r := by
      linarith
    simpa [textbookBall, metric.symmetric p x] using finalDistance

end LRA.VolumeIV.MetricSpaces
