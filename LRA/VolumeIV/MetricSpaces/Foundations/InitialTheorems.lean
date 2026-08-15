import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Analysis.Complex.Basic
import LRA.VolumeIV.MetricSpaces.Compatibility.Metric
import LRA.VolumeIV.MetricSpaces.Foundations.Metrics

/-!
Elementary theorem layer for the textbook metric record.
-/

namespace LRA.Analysis.MetricSpaces

universe u

/-- The Euclidean distance `d(a, b) = |a - b|` on the real line is a metric.
Equivalently, there is a `MetricDefinition ℝ` whose distance between every
pair of real numbers `a` and `b` is `|a - b|`.

Logical form:

```lean
∃ metric : MetricDefinition ℝ,
  ∀ a b : ℝ, metric.distance a b = |a - b|
```
-/
theorem EuclideanDistanceIsAMetric :
    ∃ metric : MetricDefinition ℝ,
      ∀ a b : ℝ, metric.distance a b = |a - b| := by
  refine ⟨Metrics.EuclideanRMetric, ?_⟩
  intro a b
  rfl

/-- The empty subset of any type is a metric space: its subtype carries a
metric satisfying the metric criteria.

Logical form:

```lean
Nonempty (MetricDefinition (∅ : Set X))
```
-/
theorem EmptySetIsAMetricSpace {X : Type u} :
    Nonempty (MetricDefinition (∅ : Set X)) := by
  have metric : MetricDefinition (∅ : Set X) := by
    exact Metrics.VacuousMetric (∅ : Set X)
  exact ⟨metric⟩

/-- Every singleton subset is a metric space: its subtype carries a metric
satisfying the metric criteria.

Logical form:

```lean
Nonempty (MetricDefinition ({point} : Set X))
```
-/
theorem SingletonSetIsAMetricSpace {X : Type u} (point : X) :
    Nonempty (MetricDefinition ({point} : Set X)) := by
  exact ⟨Metrics.SingletonMetric point⟩


/-- The modulus of the difference of two complex numbers defines a metric on
the complex numbers. Equivalently, there is a `MetricDefinition ℂ` whose
distance between `a` and `b` is `‖a - b‖`.

Logical form:

```lean
∃ metric : MetricDefinition ℂ,
  ∀ a b : ℂ, metric.distance a b = ‖a - b‖
```
-/
theorem ModulusIsAMetricOnTheComplexNumbers :
    ∃ metric : MetricDefinition ℂ,
      ∀ a b : ℂ, metric.distance a b = ‖a - b‖ := by
  refine ⟨Metrics.ComplexModulusMetric, ?_⟩
  intro a b
  rfl

/-- Every positive-radius circle in the complex plane admits chord length as
a metric. Memberwise, the distance between two points on the circle is the
modulus of their difference in `ℂ`.

Logical form:

```lean
∀ (center : ℂ) (radius : ℝ), 0 < radius →
  ∃ metric : MetricDefinition {z : ℂ // ‖z - center‖ = radius},
    ∀ a b, metric.distance a b = ‖a.1 - b.1‖
```
-/
theorem CircleAdmitsChordAsMetric :
    ∀ (center : ℂ) (radius : ℝ), 0 < radius →
      ∃ metric : MetricDefinition {z : ℂ // ‖z - center‖ = radius},
        ∀ a b, metric.distance a b = ‖a.1 - b.1‖ := by
  intro center radius radiusPositive
  refine ⟨Metrics.ComplexCircleChordMetric center radius radiusPositive, ?_⟩
  intro a b
  rfl

namespace MetricDefinition

/-- A metric has zero self-distance.

Logical form:

```lean
theorem DistanceSelf {X : Type u} (metric : MetricDefinition X) (x : X) :
    metric.distance x x = 0
```
-/
theorem DistanceSelf {X : Type u} (metric : MetricDefinition X) (x : X) :
    metric.distance x x = 0 := by
  exact (metric.positive x x).2.2 rfl

/-- A metric takes nonnegative values.

Logical form:

```lean
theorem DistanceNonnegative {X : Type u} (metric : MetricDefinition X) (x y : X) :
    0 ≤ metric.distance x y
```
-/
theorem DistanceNonnegative {X : Type u} (metric : MetricDefinition X) (x y : X) :
    0 ≤ metric.distance x y := by
  exact (metric.positive x y).1

/-- A metric vanishes exactly on equal points.

Logical form:

```lean
theorem DistanceEqZeroIff {X : Type u} (metric : MetricDefinition X) (x y : X) :
    metric.distance x y = 0 ↔ x = y
```
-/
theorem DistanceEqZeroIff {X : Type u} (metric : MetricDefinition X) (x y : X) :
    metric.distance x y = 0 ↔ x = y := by
  exact (metric.positive x y).2

/-- A metric is symmetric.

Logical form:

```lean
theorem DistanceSymmetric {X : Type u} (metric : MetricDefinition X) (x y : X) :
    metric.distance x y = metric.distance y x
```
-/
theorem DistanceSymmetric {X : Type u} (metric : MetricDefinition X) (x y : X) :
    metric.distance x y = metric.distance y x := by
  exact metric.symmetric x y

/-- A metric satisfies the triangle inequality.

Logical form:

```lean
theorem TriangleInequality {X : Type u} (metric : MetricDefinition X) (x y z : X) :
    metric.distance x z ≤ metric.distance x y + metric.distance y z
```
-/
theorem TriangleInequality {X : Type u} (metric : MetricDefinition X) (x y z : X) :
    metric.distance x z ≤ metric.distance x y + metric.distance y z := by
  exact metric.triangle x y z

/-- A metric satisfies the reverse triangle inequality.

Logical form:

```lean
theorem ReverseTriangleInequality {X : Type u} (metric : MetricDefinition X) (x y z : X) :
    |metric.distance x z - metric.distance y z| ≤ metric.distance x y
```
-/
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


Logical form:

```lean
theorem RearrangementOfTriangleInequalityFromMetricDefinition
    {X : Type u}
    (metric : MetricDefinition X)
    (a b c : X) :
    |metric.distance a b - metric.distance b c| ≤ metric.distance a c
```
-/
theorem RearrangementOfTriangleInequalityFromMetricDefinition
    {X : Type u}
    (metric : MetricDefinition X)
    (a b c : X) :
    |metric.distance a b - metric.distance b c| ≤ metric.distance a c := by
  simpa [metric.symmetric c b] using
    MetricDefinition.ReverseTriangleInequality metric a c b

/-- Source: Ó Searcóid, `Metric Spaces`, Theorem 1.1.2.

Rearrangement of the triangle inequality. Stated using Mathlib's metric-space
API: in a metric space, `|dist a b - dist b c| ≤ dist a c`.

Mathematical statement (Lean): `theorem rearrangement_of_triangle_inequality {X : Type u} [MetricSpace X] (a b c : X) : |dist a b - dist b c| ≤ dist a c`.


Logical form:

```lean
theorem rearrangement_of_triangle_inequality
    {X : Type u}
    [MetricSpace X]
    (a b c : X) :
    |dist a b - dist b c| ≤ dist a c
```
-/
theorem rearrangement_of_triangle_inequality
    {X : Type u}
    [MetricSpace X]
    (a b c : X) :
    |dist a b - dist b c| ≤ dist a c := by
  simpa [dist_comm c b] using abs_dist_sub_le a c b

end LRA.Analysis.MetricSpaces
