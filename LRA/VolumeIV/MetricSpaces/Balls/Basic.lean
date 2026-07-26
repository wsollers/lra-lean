import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

namespace LRA.VolumeIV

/-! Mathlib-first metric ball operations. -/

variable {X : Type u} [MetricSpace X]

/-- The center of an open ball belongs to the ball when the radius is positive. -/
theorem center_mem_ball
    (x : X)
    {r : Real}
    (radius_positive : 0 < r) :
    x ∈ Metric.ball x r := by
  sorry

/-- Open balls are monotone in the radius. -/
theorem ball_subset_ball
    (x : X)
    {r s : Real}
    (radius_le : r ≤ s) :
    Metric.ball x r ⊆ Metric.ball x s := by
  sorry

/-- Every open ball is contained in the closed ball with the same center and
radius. -/
theorem ball_subset_closedBall
    (x : X)
    (r : Real) :
    Metric.ball x r ⊆ Metric.closedBall x r := by
  sorry

/-- If a point lies in an open ball, then a sufficiently small ball around that
point lies inside the original ball. -/
theorem ball_subset_ball_of_mem
    {x y : X}
    {r : Real}
    (point_in_ball : y ∈ Metric.ball x r) :
    ∃ ε > 0, Metric.ball y ε ⊆ Metric.ball x r := by
  sorry

end LRA.VolumeIV
