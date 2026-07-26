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

end LRA.VolumeIV.MetricSpaces.SubSuperSpaces
