import Mathlib.Topology.MetricSpace.Basic
import LRA.VolumeIV.MetricSpaces.Foundations.Metric.Theorems

/-!
Compatibility between the textbook metric record and Mathlib's metric-space
API.
-/

namespace LRA.VolumeIV.MetricSpaces

universe u

namespace MetricDefinition

/-- The Mathlib pseudometric space induced by a textbook metric record. -/
@[implicit_reducible]
def ToPseudoMetricSpace {X : Type u} (metric : MetricDefinition X) :
    PseudoMetricSpace X where
  dist := metric.distance
  dist_self := MetricDefinition.DistanceSelf metric
  dist_comm := metric.symmetric
  dist_triangle := metric.triangle

/-- The Mathlib metric space induced by a textbook metric record.

The topology, uniformity, and bornology are Mathlib's induced structures for
the supplied distance function. -/
@[implicit_reducible]
def ToMathlibMetricSpace {X : Type u} (metric : MetricDefinition X) :
    MetricSpace X where
  toPseudoMetricSpace := metric.ToPseudoMetricSpace
  eq_of_dist_eq_zero := by
    intro x y distanceEqZero
    exact (metric.positive x y).2.1 distanceEqZero

/-- The topology induced by a textbook metric through Mathlib's metric-space
constructor. -/
@[implicit_reducible]
def InducedTopologicalSpace {X : Type u} (metric : MetricDefinition X) :
    TopologicalSpace X := by
  letI : MetricSpace X := metric.ToMathlibMetricSpace
  infer_instance

/-- Inside the Mathlib metric induced by a textbook metric, Mathlib's `dist`
is the textbook `distance`. -/
theorem ToMathlibDistance {X : Type u} (metric : MetricDefinition X) (x y : X) :
    letI : MetricSpace X := metric.ToMathlibMetricSpace
    dist x y = metric.distance x y := by
  rfl

/-- The textbook metric record associated to an existing Mathlib metric space. -/
def FromMathlibMetric (X : Type u) [MetricSpace X] : MetricDefinition X := by
  refine ⟨(@Dist.dist X (inferInstance : Dist X)), ?_, ?_, ?_⟩
  · intro x y
    exact ⟨dist_nonneg, dist_eq_zero⟩
  · intro x y
    exact dist_comm x y
  · intro x y z
    exact dist_triangle x y z

end MetricDefinition

/-- A textbook metric record is compatible with the active Mathlib metric when
the two distance functions agree pointwise. -/
def IsCompatibleWithMathlibMetric {X : Type u} [MetricSpace X]
    (metric : MetricDefinition X) : Prop :=
  ∀ x y : X, metric.distance x y = @Dist.dist X (inferInstance : Dist X) x y

/-- The textbook metric record built from Mathlib's metric is compatible with
Mathlib's metric. -/
theorem FromMathlibMetricIsCompatibleWithMathlibMetric
    {X : Type u} [MetricSpace X] :
    IsCompatibleWithMathlibMetric (MetricDefinition.FromMathlibMetric X) := by
  intro x y
  rfl

/-- Reverse triangle inequality transferred from Mathlib along pointwise
distance compatibility. -/
theorem ReverseTriangleInequalityFromMathlibCompatibility
    {X : Type u} [MetricSpace X]
    (metric : MetricDefinition X)
    (compatibilityHypothesis : IsCompatibleWithMathlibMetric metric)
    (x y z : X) :
    |metric.distance x z - metric.distance y z| ≤ metric.distance x y := by
  rw [compatibilityHypothesis x z, compatibilityHypothesis y z, compatibilityHypothesis x y]
  exact abs_dist_sub_le x y z

/-- Source: Ó Searcóid, `Metric Spaces`, Theorem 1.1.2.

Rearrangement of the triangle inequality. Stated using Mathlib's metric-space
API: in a metric space, `|dist a b - dist b c| ≤ dist a c`.

Mathematical statement (Lean): `theorem rearrangement_of_triangle_inequality {X : Type u} [MetricSpace X] (a b c : X) : |dist a b - dist b c| ≤ dist a c`.
-/
theorem rearrangement_of_triangle_inequality
    {X : Type u}
    [MetricSpace X]
    (a b c : X) :
    |dist a b - dist b c| ≤ dist a c := by
  simpa [dist_comm c b] using abs_dist_sub_le a c b

end LRA.VolumeIV.MetricSpaces
