import Mathlib.Topology.MetricSpace.Basic

/-!
Metric subspaces and metric superspaces.
-/

namespace LRA.VolumeIV.MetricSpaces.SubSuperSpaces

universe u

/-- The restriction of an ambient metric to a subset. -/
def restrictedDistance
    {Y : Type u}
    [MetricSpace Y]
    (X : Set Y) :
    X → X → Real :=
  fun x y => dist (x : Y) (y : Y)

/-- Source: Ó Searcóid, `Metric Spaces`, Definition 1.3.1.

Reference data for a metric subspace.

This packages a subset `X` of an ambient metric space `Y` together with the
metric on `X`, requiring that the metric on `X` is the restriction of the
ambient metric to `X × X`.
-/
structure MetricSubspaceDefinition
    (Y : Type u)
    [MetricSpace Y]
    (X : Set Y) where
  /-- The metric carried by the subset. -/
  metric : MetricSpace X
  /-- The subset metric is the restriction of the ambient metric. -/
  restricts :
    letI : MetricSpace X := metric
    ∀ x y : X, dist x y = restrictedDistance X x y

/-- Source: Ó Searcóid, `Metric Spaces`, Definition 1.3.1.

Reference data for a metric superspace.

This is the same relation as `MetricSubspaceDefinition`, read from the ambient
space side: `Y` is a metric superspace of the subset `X` when the metric on `X`
is the restriction of the metric on `Y`.
-/
structure MetricSuperspaceDefinition
    (Y : Type u)
    [MetricSpace Y] where
  /-- The subset carried as a metric subspace of the ambient space. -/
  carrier : Set Y
  /-- The metric subspace data on `carrier`. -/
  subspace : MetricSubspaceDefinition Y carrier

/-- Source: Ó Searcóid, `Metric Spaces`, Definition 1.3.1.

A metric space carried by a subset `X` of an ambient metric space `Y` is a
metric subspace of `Y` precisely when its distance is the restriction of the
ambient distance to `X × X`.
-/
def IsMetricSubspace
    {Y : Type u}
    [MetricSpace Y]
    (X : Set Y)
    [MetricSpace X] :
    Prop :=
  ∀ x y : X, dist x y = restrictedDistance X x y

/-- Source: Ó Searcóid, `Metric Spaces`, Definition 1.3.1.

The ambient metric space `Y` is a metric superspace of `X` exactly when `X`,
with its metric, is a metric subspace of `Y`.
-/
def IsMetricSuperspace
    (Y : Type u)
    [MetricSpace Y]
    (X : Set Y)
    [MetricSpace X] :
    Prop :=
  IsMetricSubspace X

/-- The closed unit interval `[0, 1]`, with its subtype metric, is a metric
subspace of the real line. -/
theorem closedUnitInterval_isMetricSubspace :
    IsMetricSubspace (Set.Icc (0 : Real) 1) := by
  intro x y
  rfl

/-- The real line is a metric superspace of the closed unit interval `[0, 1]`. -/
theorem real_isMetricSuperspace_closedUnitInterval :
    IsMetricSuperspace Real (Set.Icc (0 : Real) 1) := by
  exact closedUnitInterval_isMetricSubspace

end LRA.VolumeIV.MetricSpaces.SubSuperSpaces
