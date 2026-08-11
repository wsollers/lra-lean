import Mathlib.Topology.MetricSpace.Basic
import LRA.VolumeIV.MetricSpaces.Compatibility.MetricSpace
import LRA.VolumeIV.MetricSpaces.Foundations.InitialTheorems

/-!
Compatibility between the textbook metric record and Mathlib's metric-space
API.
-/

namespace LRA.VolumeIV.MetricSpaces

universe u

namespace MetricDefinition

/-- The Mathlib pseudometric space induced by a textbook metric record.

Logical form:

```lean
def ToPseudoMetricSpace {X : Type u} (metric : MetricDefinition X) :
    PseudoMetricSpace X where
  dist := metric.distance
  dist_self := MetricDefinition.DistanceSelf metric
  dist_comm := metric.symmetric
  dist_triangle := metric.triangle
```
-/
@[implicit_reducible]
def ToPseudoMetricSpace {X : Type u} (metric : MetricDefinition X) :
    PseudoMetricSpace X where
  dist := metric.distance
  dist_self := MetricDefinition.DistanceSelf metric
  dist_comm := metric.symmetric
  dist_triangle := metric.triangle

/-- The Mathlib metric space induced by a textbook metric record.

The topology, uniformity, and bornology are Mathlib's induced structures for
the supplied distance function.

Logical form:

```lean
def ToMathlibMetricSpace {X : Type u} (metric : MetricDefinition X) :
    MetricSpace X where
  toPseudoMetricSpace := metric.ToPseudoMetricSpace
  eq_of_dist_eq_zero := by
    intro x y distanceEqZero
    exact (metric.positive x y).2.1 distanceEqZero
```
-/
@[implicit_reducible]
def ToMathlibMetricSpace {X : Type u} (metric : MetricDefinition X) :
    MetricSpace X where
  toPseudoMetricSpace := metric.ToPseudoMetricSpace
  eq_of_dist_eq_zero := by
    intro x y distanceEqZero
    exact (metric.positive x y).2.1 distanceEqZero

/-- The topology induced by a textbook metric through Mathlib's metric-space
constructor.

Logical form:

```lean
def InducedTopologicalSpace {X : Type u} (metric : MetricDefinition X) :
    TopologicalSpace X
```
-/
@[implicit_reducible]
def InducedTopologicalSpace {X : Type u} (metric : MetricDefinition X) :
    TopologicalSpace X := by
  letI : MetricSpace X := metric.ToMathlibMetricSpace
  infer_instance

/-- Inside the Mathlib metric induced by a textbook metric, Mathlib's `dist`
is the textbook `distance`.

Logical form:

```lean
theorem ToMathlibDistance {X : Type u} (metric : MetricDefinition X) (x y : X) :
    letI : MetricSpace X
```
-/
theorem ToMathlibDistance {X : Type u} (metric : MetricDefinition X) (x y : X) :
    letI : MetricSpace X := metric.ToMathlibMetricSpace
    dist x y = metric.distance x y := by
  rfl

/-- The textbook metric record associated to an existing Mathlib metric space.

Logical form:

```lean
def FromMathlibMetric (X : Type u) [MetricSpace X] : MetricDefinition X
```
-/
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
the two distance functions agree pointwise.

Logical form:

```lean
def IsCompatibleWithMathlibMetric {X : Type u} [MetricSpace X]
    (metric : MetricDefinition X) : Prop :=
  ∀ x y : X, metric.distance x y = @Dist.dist X (inferInstance : Dist X) x y
```
-/
def IsCompatibleWithMathlibMetric {X : Type u} [MetricSpace X]
    (metric : MetricDefinition X) : Prop :=
  ∀ x y : X, metric.distance x y = @Dist.dist X (inferInstance : Dist X) x y

/-- The textbook metric record built from Mathlib's metric is compatible with
Mathlib's metric.

Logical form:

```lean
theorem FromMathlibMetricIsCompatibleWithMathlibMetric
    {X : Type u} [MetricSpace X] :
    IsCompatibleWithMathlibMetric (MetricDefinition.FromMathlibMetric X)
```
-/
theorem FromMathlibMetricIsCompatibleWithMathlibMetric
    {X : Type u} [MetricSpace X] :
    IsCompatibleWithMathlibMetric (MetricDefinition.FromMathlibMetric X) := by
  intro x y
  rfl

/-- Reverse triangle inequality transferred from Mathlib along pointwise
distance compatibility.

Logical form:

```lean
theorem ReverseTriangleInequalityFromMathlibCompatibility
    {X : Type u} [MetricSpace X]
    (metric : MetricDefinition X)
    (compatibilityHypothesis : IsCompatibleWithMathlibMetric metric)
    (x y z : X) :
    |metric.distance x z - metric.distance y z| ≤ metric.distance x y
```
-/
theorem ReverseTriangleInequalityFromMathlibCompatibility
    {X : Type u} [MetricSpace X]
    (metric : MetricDefinition X)
    (compatibilityHypothesis : IsCompatibleWithMathlibMetric metric)
    (x y z : X) :
    |metric.distance x z - metric.distance y z| ≤ metric.distance x y := by
  rw [compatibilityHypothesis x z, compatibilityHypothesis y z, compatibilityHypothesis x y]
  exact abs_dist_sub_le x y z

namespace MetricSpaceDefinition

/-- The Mathlib metric-space structure induced by a packaged textbook metric
space.

Logical form:

```lean
def ToMathlibMetricSpace (space : MetricSpaceDefinition.{u}) :
    MetricSpace space.Carrier :=
  space.metric.ToMathlibMetricSpace
```
-/
@[implicit_reducible]
def ToMathlibMetricSpace (space : MetricSpaceDefinition.{u}) :
    MetricSpace space.Carrier :=
  space.metric.ToMathlibMetricSpace

/-- A packaged textbook metric space can be used directly as a Mathlib metric
space on its carrier.

This instance is useful in learning files whose variables have type
`space.Carrier`: Mathlib-facing names such as `dist`, `Metric.ball`,
`dist_triangle`, and `dist_comm` resolve through the packaged textbook metric. -/
instance instMathlibMetricSpace (space : MetricSpaceDefinition.{u}) :
    MetricSpace space.Carrier :=
  space.ToMathlibMetricSpace

end MetricSpaceDefinition

end LRA.VolumeIV.MetricSpaces
