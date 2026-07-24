import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

namespace LRA.VolumeVII.WithMathlib

/-! Mathlib-first metric ball operations. -/

variable {X : Type u} [MetricSpace X]

/-- The center of an open ball belongs to the ball when the radius is positive. -/
theorem center_mem_ball
    (x : X)
    {r : Real}
    (radius_positive : 0 < r) :
    x ∈ Metric.ball x r := by
  exact Metric.mem_ball_self radius_positive

/-- Open balls are monotone in the radius. -/
theorem ball_subset_ball
    (x : X)
    {r s : Real}
    (radius_le : r ≤ s) :
    Metric.ball x r ⊆ Metric.ball x s := by
  intro y point_in_smaller_ball
  rw [Metric.mem_ball'] at point_in_smaller_ball ⊢
  exact point_in_smaller_ball.trans_le radius_le

/-- Every open ball is contained in the closed ball with the same center and
radius. -/
theorem ball_subset_closedBall
    (x : X)
    (r : Real) :
    Metric.ball x r ⊆ Metric.closedBall x r := by
  intro y point_in_ball
  rw [Metric.mem_ball'] at point_in_ball
  rw [Metric.mem_closedBall']
  exact le_of_lt point_in_ball

/-- If a point lies in an open ball, then a sufficiently small ball around that
point lies inside the original ball. -/
theorem ball_subset_ball_of_mem
    {x y : X}
    {r : Real}
    (point_in_ball : y ∈ Metric.ball x r) :
    ∃ ε > 0, Metric.ball y ε ⊆ Metric.ball x r := by
  rw [Metric.mem_ball'] at point_in_ball
  refine ⟨r - dist x y, ?_, ?_⟩
  · linarith
  · intro z point_in_small_ball
    rw [Metric.mem_ball'] at point_in_small_ball ⊢
    calc
      dist x z ≤ dist x y + dist y z := by
        exact dist_triangle x y z
      _ < dist x y + (r - dist x y) := by
        linarith
      _ = r := by
        ring

end LRA.VolumeVII.WithMathlib
