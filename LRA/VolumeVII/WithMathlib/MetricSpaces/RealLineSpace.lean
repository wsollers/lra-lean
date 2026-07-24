import LRA.VolumeVII.WithMathlib.MetricSpaces.MetricSpace
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

namespace LRA.VolumeVII.WithMathlib

/-- The usual absolute-value metric on the real line. -/
def realAbsoluteValueMetric : Metric Real where
  distance x y := |x - y|

  distance_nonnegative := by
    intro x y
    exact abs_nonneg (x - y)

  distance_eq_zero_iff_equal := by
    intro x y
    constructor
    -- =>
    · intro hypothesis
      have difference_eq_zero : x - y = 0 := abs_eq_zero.mp hypothesis
      linarith
    -- <=
    · intro hypothesis
      rw [hypothesis, sub_self]
      exact abs_zero

  distance_symmetric := by
    intro x y
    exact abs_sub_comm x y
  distance_triangle := by
    intro x y z
    calc
      |x - z| = |(x - y) + (y - z)| := by
        ring_nf
      _ ≤ |x - y| + |y - z| := by
        exact abs_add_le (x - y) (y - z)

/-- The real line equipped with the usual absolute-value metric. -/
def realMetricSpace : MetricSpace Real where
  metric := realAbsoluteValueMetric

end LRA.VolumeVII.WithMathlib
