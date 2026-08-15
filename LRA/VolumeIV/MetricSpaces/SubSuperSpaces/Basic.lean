import Mathlib.Topology.MetricSpace.Basic

/-!
Metric subspaces and metric superspaces.
-/

namespace LRA.Analysis.MetricSpaces.SubSuperSpaces

universe u


/-- The restriction of an ambient metric to a subset.

Mathematical statement (Lean): `def restrictedDistance {Y : Type u} [MetricSpace Y] (X : Set Y) : X → X → Real`.


Logical form:

```lean
def restrictedDistance
    {Y : Type u}
    [MetricSpace Y]
    (X : Set Y) :
    X → X → Real :=
  fun x y => dist (x : Y) (y : Y)
```
-/
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

Mathematical statement (Lean): `structure MetricSubspaceDefinition (Y : Type u) [MetricSpace Y] (X : Set Y)`.


Logical form:

```lean
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
```
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

Mathematical statement (Lean): `structure MetricSuperspaceDefinition (Y : Type u) [MetricSpace Y]`.


Logical form:

```lean
structure MetricSuperspaceDefinition
    (Y : Type u)
    [MetricSpace Y] where
  /-- The subset carried as a metric subspace of the ambient space. -/
  carrier : Set Y
  /-- The metric subspace data on `carrier`. -/
  subspace : MetricSubspaceDefinition Y carrier
```
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

Mathematical statement (Lean): `def IsMetricSubspace {Y : Type u} [MetricSpace Y] (X : Set Y) [MetricSpace X] : Prop`.


Logical form:

```lean
def IsMetricSubspace
    {Y : Type u}
    [MetricSpace Y]
    (X : Set Y)
    [MetricSpace X] :
    Prop :=
  ∀ x y : X, dist x y = restrictedDistance X x y
```
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

Mathematical statement (Lean): `def IsMetricSuperspace (Y : Type u) [MetricSpace Y] (X : Set Y) [MetricSpace X] : Prop`.


Logical form:

```lean
def IsMetricSuperspace
    (Y : Type u)
    [MetricSpace Y]
    (X : Set Y)
    [MetricSpace X] :
    Prop :=
  IsMetricSubspace X
```
-/
def IsMetricSuperspace
    (Y : Type u)
    [MetricSpace Y]
    (X : Set Y)
    [MetricSpace X] :
    Prop :=
  IsMetricSubspace X

/-- The closed unit interval `[0, 1]`, with its subtype metric, is a metric

Mathematical statement (Lean): `theorem closedUnitInterval_isMetricSubspace : IsMetricSubspace (Set.Icc (0 : Real) 1)`.
subspace of the real line.

Logical form:

```lean
theorem closedUnitInterval_isMetricSubspace :
    IsMetricSubspace (Set.Icc (0 : Real) 1)
```
-/
theorem closedUnitInterval_isMetricSubspace :
    IsMetricSubspace (Set.Icc (0 : Real) 1) := by
  intro x y
  rfl


/-- The real line is a metric superspace of the closed unit interval `[0, 1]`.

Mathematical statement (Lean): `theorem real_isMetricSuperspace_closedUnitInterval : IsMetricSuperspace Real (Set.Icc (0 : Real) 1)`.


Logical form:

```lean
theorem real_isMetricSuperspace_closedUnitInterval :
    IsMetricSuperspace Real (Set.Icc (0 : Real) 1)
```
-/
theorem real_isMetricSuperspace_closedUnitInterval :
    IsMetricSuperspace Real (Set.Icc (0 : Real) 1) := by
  exact closedUnitInterval_isMetricSubspace

end LRA.Analysis.MetricSpaces.SubSuperSpaces
