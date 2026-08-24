import Mathlib.Topology.MetricSpace.Basic
import LRA.Analysis.MetricSpace.Definition.MetricSpace
import LRA.Analysis.MetricSpace.Definition.InitialTheorems

namespace LRA.Analysis.MetricSpace

universe u

namespace MetricDefinition

/--
`ToPseudoMetricSpace` TODO

Predicate logic:

  def ToPseudoMetricSpace {X : Type u} (metric : MetricDefinition X) :
    PseudoMetricSpace X where
  dist := metric.distance
  dist_self := MetricDefinition.DistanceSelf metric
  dist_comm := metric.symmetric
  dist_triangle := metric.triangle

Predicate logic (unfolded):

  def ToPseudoMetricSpace {X : Type u} (metric : MetricDefinition X) :
    PseudoMetricSpace X where
  dist := metric.distance
  dist_self := MetricDefinition.DistanceSelf metric
  dist_comm := metric.symmetric
  dist_triangle := metric.triangle (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ToPseudoMetricSpace {X : Type u} (metric : MetricDefinition X) :
    PseudoMetricSpace X where
  dist := metric.distance
  dist_self := MetricDefinition.DistanceSelf metric
  dist_comm := metric.symmetric
  dist_triangle := metric.triangle
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
@[implicit_reducible]

def ToPseudoMetricSpace {X : Type u} (metric : MetricDefinition X) :
    PseudoMetricSpace X where
  dist := metric.distance
  dist_self := MetricDefinition.DistanceSelf metric
  dist_comm := metric.symmetric
  dist_triangle := metric.triangle

/--
`ToMathlibMetricSpace` TODO

Predicate logic:

  def ToMathlibMetricSpace {X : Type u} (metric : MetricDefinition X) :
    MetricSpace X where
  toPseudoMetricSpace := metric.ToPseudoMetricSpace
  eq_of_dist_eq_zero := by
    intro x y distanceEqZero
    exact (metric.positive x y).2.1 distanceEqZero

Predicate logic (unfolded):

  def ToMathlibMetricSpace {X : Type u} (metric : MetricDefinition X) :
    MetricSpace X where
  toPseudoMetricSpace := metric.ToPseudoMetricSpace
  eq_of_dist_eq_zero := by
    intro x y distanceEqZero
    exact (metric.positive x y).2.1 distanceEqZero (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ToMathlibMetricSpace {X : Type u} (metric : MetricDefinition X) :
    MetricSpace X where
  toPseudoMetricSpace := metric.ToPseudoMetricSpace
  eq_of_dist_eq_zero := by
    intro x y distanceEqZero
    exact (metric.positive x y).2.1 distanceEqZero
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
@[implicit_reducible]

def ToMathlibMetricSpace {X : Type u} (metric : MetricDefinition X) :
    MetricSpace X where
  toPseudoMetricSpace := metric.ToPseudoMetricSpace
  eq_of_dist_eq_zero := by
    intro x y distanceEqZero
    exact (metric.positive x y).2.1 distanceEqZero

/--
`InducedTopologicalSpace` TODO

Predicate logic:

  def InducedTopologicalSpace {X : Type u} (metric : MetricDefinition X) :
    TopologicalSpace X

Predicate logic (unfolded):

  def InducedTopologicalSpace {X : Type u} (metric : MetricDefinition X) :
    TopologicalSpace X (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def InducedTopologicalSpace {X : Type u} (metric : MetricDefinition X) :
    TopologicalSpace X
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
@[implicit_reducible]

def InducedTopologicalSpace {X : Type u} (metric : MetricDefinition X) :
    TopologicalSpace X := by
  letI : MetricSpace X := metric.ToMathlibMetricSpace
  infer_instance

/--
`ToMathlibDistance` TODO

Predicate logic:

  (∀ x y ∈ X), letI : MetricSpace X

Predicate logic (unfolded):

  ∀ {X : Type u} (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (x y : X), metric.ToMathlibMetricSpace.toDist.1 x y = metric.1 x y

Logical form (Lean):

```lean
theorem ToMathlibDistance {X : Type u} (metric : MetricDefinition X) (x y : X) :
    letI : MetricSpace X := metric.ToMathlibMetricSpace
    dist x y = metric.distance x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem ToMathlibDistance {X : Type u} (metric : MetricDefinition X) (x y : X) :
    letI : MetricSpace X := metric.ToMathlibMetricSpace
    dist x y = metric.distance x y := by
  sorry

/--
`FromMathlibMetric` TODO

Predicate logic:

  def FromMathlibMetric (X : Type u) [MetricSpace X] : MetricDefinition X

Predicate logic (unfolded):

  def FromMathlibMetric (X : Type u) [MetricSpace X] : MetricDefinition X (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def FromMathlibMetric (X : Type u) [MetricSpace X] : MetricDefinition X
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

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

/--
`IsCompatibleWithMathlibMetric` TODO

Predicate logic:

  ∀ {X : Type u} [inst : MetricSpace X] (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (x y : X), metric.distance x y = inferInstance.dist x y

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (metric : LRA.Analysis.MetricSpace.MetricDefinition X) (x y : X), metric.1 x y = inferInstance.1 x y

Logical form (Lean):

```lean
def IsCompatibleWithMathlibMetric {X : Type u} [MetricSpace X]
    (metric : MetricDefinition X) : Prop :=
  ∀ x y : X, metric.distance x y = @Dist.dist X (inferInstance : Dist X) x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def IsCompatibleWithMathlibMetric {X : Type u} [MetricSpace X]
    (metric : MetricDefinition X) : Prop :=
  ∀ x y : X, metric.distance x y = @Dist.dist X (inferInstance : Dist X) x y

/--
`FromMathlibMetricIsCompatibleWithMathlibMetric` TODO

Predicate logic:

  IsCompatibleWithMathlibMetric (MetricDefinition.FromMathlibMetric X)

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (x y : X), (LRA.Analysis.MetricSpace.MetricDefinition.FromMathlibMetric X).1 x y = inferInstance.1 x y

Logical form (Lean):

```lean
theorem FromMathlibMetricIsCompatibleWithMathlibMetric
    {X : Type u} [MetricSpace X] :
    IsCompatibleWithMathlibMetric (MetricDefinition.FromMathlibMetric X)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem FromMathlibMetricIsCompatibleWithMathlibMetric
    {X : Type u} [MetricSpace X] :
    IsCompatibleWithMathlibMetric (MetricDefinition.FromMathlibMetric X) := by
  sorry

/--
`ReverseTriangleInequalityFromMathlibCompatibility` TODO

Predicate logic:

  (∀ x y z ∈ X), (IsCompatibleWithMathlibMetric metric) → |metric.distance x z - metric.distance y z| ≤ metric.distance x y

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : MetricSpace X] (metric : LRA.Analysis.MetricSpace.MetricDefinition X), (∀ (x y : X), metric.1 x y = inferInstance.1 x y) → ∀ (x y z : X), Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (metric.1 x z) (metric.1 y z)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (metric.1 x z) (metric.1 y z)))) (metric.1 x y)

Logical form (Lean):

```lean
theorem ReverseTriangleInequalityFromMathlibCompatibility
    {X : Type u} [MetricSpace X]
    (metric : MetricDefinition X)
    (compatibilityHypothesis : IsCompatibleWithMathlibMetric metric)
    (x y z : X) :
    |metric.distance x z - metric.distance y z| ≤ metric.distance x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem ReverseTriangleInequalityFromMathlibCompatibility
    {X : Type u} [MetricSpace X]
    (metric : MetricDefinition X)
    (compatibilityHypothesis : IsCompatibleWithMathlibMetric metric)
    (x y z : X) :
    |metric.distance x z - metric.distance y z| ≤ metric.distance x y := by
  sorry

namespace MetricSpaceDefinition

/--
`ToMathlibMetricSpace` TODO

Predicate logic:

  def ToMathlibMetricSpace (space : MetricSpaceDefinition.{u}) :
    MetricSpace space.Carrier :=
  space.metric.ToMathlibMetricSpace

Predicate logic (unfolded):

  def ToMathlibMetricSpace (space : MetricSpaceDefinition.{u}) :
    MetricSpace space.Carrier :=
  space.metric.ToMathlibMetricSpace (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ToMathlibMetricSpace (space : MetricSpaceDefinition.{u}) :
    MetricSpace space.Carrier :=
  space.metric.ToMathlibMetricSpace
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
@[implicit_reducible]

def ToMathlibMetricSpace (space : MetricSpaceDefinition.{u}) :
    MetricSpace space.Carrier :=
  space.metric.ToMathlibMetricSpace

instance instMathlibMetricSpace (space : MetricSpaceDefinition.{u}) :
    MetricSpace space.Carrier :=
  space.ToMathlibMetricSpace

end MetricSpaceDefinition

end LRA.Analysis.MetricSpace
