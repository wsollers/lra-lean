import Mathlib.Topology.MetricSpace.Basic
import LRA.VolumeIV.MetricSpaces.Foundations.Metric.Basic

/-!
Elementary theorem layer for the textbook metric record.
-/

namespace LRA.VolumeIV.MetricSpaces

universe u

namespace MetricDefinition

/-- A metric has zero self-distance. -/
theorem DistanceSelf {X : Type u} (metric : MetricDefinition X) (x : X) :
    metric.distance x x = 0 := by
  exact (metric.positive x x).2.2 rfl

/-- A metric takes nonnegative values. -/
theorem DistanceNonnegative {X : Type u} (metric : MetricDefinition X) (x y : X) :
    0 ≤ metric.distance x y := by
  exact (metric.positive x y).1

/-- A metric vanishes exactly on equal points. -/
theorem DistanceEqZeroIff {X : Type u} (metric : MetricDefinition X) (x y : X) :
    metric.distance x y = 0 ↔ x = y := by
  exact (metric.positive x y).2

/-- A metric is symmetric. -/
theorem DistanceSymmetric {X : Type u} (metric : MetricDefinition X) (x y : X) :
    metric.distance x y = metric.distance y x := by
  exact metric.symmetric x y

/-- A metric satisfies the triangle inequality. -/
theorem TriangleInequality {X : Type u} (metric : MetricDefinition X) (x y z : X) :
    metric.distance x z ≤ metric.distance x y + metric.distance y z := by
  exact metric.triangle x y z

/-- A metric satisfies the reverse triangle inequality. -/
theorem ReverseTriangleInequality {X : Type u} (metric : MetricDefinition X) (x y z : X) :
    |metric.distance x z - metric.distance y z| ≤ metric.distance x y := by
  rw [abs_sub_le_iff]
  constructor
  · have triangleHypothesis :
        metric.distance x z ≤ metric.distance x y + metric.distance y z :=
      metric.triangle x y z
    linarith
  · have triangleHypothesis :
        metric.distance y z ≤ metric.distance y x + metric.distance x z :=
      metric.triangle y x z
    rw [metric.symmetric y x] at triangleHypothesis
    linarith

end MetricDefinition

/-- Source: Ó Searcóid, `Metric Spaces`, Theorem 1.1.2.

Rearrangement of the triangle inequality for the textbook-level
`MetricDefinition` record.

Mathematical statement (Lean): `theorem RearrangementOfTriangleInequalityFromMetricDefinition {X : Type u} (metric : MetricDefinition X) (a b c : X) : |metric.distance a b - metric.distance b c| ≤ metric.distance a c`.
-/
theorem RearrangementOfTriangleInequalityFromMetricDefinition
    {X : Type u}
    (metric : MetricDefinition X)
    (a b c : X) :
    |metric.distance a b - metric.distance b c| ≤ metric.distance a c := by
  simpa [metric.symmetric c b] using
    MetricDefinition.ReverseTriangleInequality metric a c b

end LRA.VolumeIV.MetricSpaces
