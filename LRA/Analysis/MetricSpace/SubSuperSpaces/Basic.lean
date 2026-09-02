import Mathlib.Topology.MetricSpace.Basic

namespace LRA.Analysis.MetricSpace.SubSuperSpaces

universe u

/--
`restrictedDistance` TODO

Predicate logic:

  def restrictedDistance
    {Y : Type u}
    [MetricSpace Y]
    (X : Set Y) :
    X → X → Real :=
  fun x y => dist (x : Y) (y : Y)

Predicate logic (unfolded):

  def restrictedDistance
    {Y : Type u}
    [MetricSpace Y]
    (X : Set Y) :
    X → X → Real :=
  fun x y => dist (x : Y) (y : Y) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def restrictedDistance
    {Y : Type u}
    [MetricSpace Y]
    (X : Set Y) :
    X → X → Real :=
  fun x y => dist (x : Y) (y : Y)
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
def restrictedDistance
    {Y : Type u}
    [MetricSpace Y]
    (X : Set Y) :
    X → X → Real :=
  fun x y => dist (x : Y) (y : Y)

/--
`MetricSubspaceDefinition` TODO

Predicate logic:

  structure MetricSubspaceDefinition
    (Y : Type u)
    [MetricSpace Y]
    (X : Set Y) where

  metric : MetricSpace X

  restricts :
    letI : MetricSpace X := metric
    ∀ x y : X, dist x y = restrictedDistance X x y

Predicate logic (unfolded):

  structure MetricSubspaceDefinition
    (Y : Type u)
    [MetricSpace Y]
    (X : Set Y) where

  metric : MetricSpace X

  restricts :
    letI : MetricSpace X := metric
    ∀ x y : X, dist x y = restrictedDistance X x y (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure MetricSubspaceDefinition
    (Y : Type u)
    [MetricSpace Y]
    (X : Set Y) where

  metric : MetricSpace X

  restricts :
    letI : MetricSpace X := metric
    ∀ x y : X, dist x y = restrictedDistance X x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
structure MetricSubspaceDefinition
    (Y : Type u)
    [MetricSpace Y]
    (X : Set Y) where

  metric : MetricSpace X

  restricts :
    letI : MetricSpace X := metric
    ∀ x y : X, dist x y = restrictedDistance X x y

/--
`MetricSuperspaceDefinition` TODO

Predicate logic:

  structure MetricSuperspaceDefinition
    (Y : Type u)
    [MetricSpace Y] where

  carrier : Set Y

  subspace : MetricSubspaceDefinition Y carrier

Predicate logic (unfolded):

  structure MetricSuperspaceDefinition
    (Y : Type u)
    [MetricSpace Y] where

  carrier : Set Y

  subspace : MetricSubspaceDefinition Y carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure MetricSuperspaceDefinition
    (Y : Type u)
    [MetricSpace Y] where

  carrier : Set Y

  subspace : MetricSubspaceDefinition Y carrier
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
structure MetricSuperspaceDefinition
    (Y : Type u)
    [MetricSpace Y] where

  carrier : Set Y

  subspace : MetricSubspaceDefinition Y carrier

/--
`IsMetricSubspace` TODO

Predicate logic:

  ∀ {Y : Type u} [inst : MetricSpace Y] (X : Set Y) (a : MetricSpace X.Elem) (x y : X.Elem), Subtype.pseudoMetricSpace.dist x y = LRA.Analysis.MetricSpace.SubSuperSpaces.restrictedDistance X x y

Predicate logic (unfolded):

  ∀ {Y : Type u} [inst : MetricSpace Y] (X : Y → Prop) (a : MetricSpace (Subtype fun x => Set.instMembership.1 X x)) (x y : Subtype fun x => Set.instMembership.1 X x), Subtype.pseudoMetricSpace.toDist.1 x y = inst.toDist.1 x.1 y.1

Logical form (Lean):

```lean
def IsMetricSubspace
    {Y : Type u}
    [MetricSpace Y]
    (X : Set Y)
    [MetricSpace X] :
    Prop :=
  ∀ x y : X, dist x y = restrictedDistance X x y
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
def IsMetricSubspace
    {Y : Type u}
    [MetricSpace Y]
    (X : Set Y)
    [MetricSpace X] :
    Prop :=
  ∀ x y : X, dist x y = restrictedDistance X x y

/--
`IsMetricSuperspace` TODO

Predicate logic:

  ∀ (Y : Type u) [inst : MetricSpace Y] (X : Set Y) (a : MetricSpace X.Elem) (x y : X.Elem), Subtype.pseudoMetricSpace.dist x y = LRA.Analysis.MetricSpace.SubSuperSpaces.restrictedDistance X x y

Predicate logic (unfolded):

  ∀ (Y : Type u) [inst : MetricSpace Y] (X : Y → Prop) (a : MetricSpace (Subtype fun x => Set.instMembership.1 X x)) (x y : Subtype fun x => Set.instMembership.1 X x), Subtype.pseudoMetricSpace.toDist.1 x y = inst.toDist.1 x.1 y.1

Logical form (Lean):

```lean
def IsMetricSuperspace
    (Y : Type u)
    [MetricSpace Y]
    (X : Set Y)
    [MetricSpace X] :
    Prop :=
  IsMetricSubspace X
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
def IsMetricSuperspace
    (Y : Type u)
    [MetricSpace Y]
    (X : Set Y)
    [MetricSpace X] :
    Prop :=
  IsMetricSubspace X

/--
`closedUnitInterval_isMetricSubspace` TODO

Predicate logic:

  IsMetricSubspace (Set.Icc 0 ∈ Real 1)

Predicate logic (unfolded):

  ∀ (x y : Subtype fun x => Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 0 x ∧ Real.instPreorder.toLE.1 x 1)) x), Subtype.pseudoMetricSpace.toDist.1 x y = Real.metricSpace.toDist.1 x.1 y.1

Logical form (Lean):

```lean
theorem closedUnitInterval_isMetricSubspace :
    IsMetricSubspace (Set.Icc (0 : Real) 1)
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
theorem closedUnitInterval_isMetricSubspace :
    IsMetricSubspace (Set.Icc (0 : Real) 1) := by
  sorry
/--
`real_isMetricSuperspace_closedUnitInterval` TODO

Predicate logic:

  IsMetricSuperspace Real (Set.Icc 0 ∈ Real 1)

Predicate logic (unfolded):

  ∀ (x y : Subtype fun x => Set.instMembership.1 (fun x => (Real.instPreorder.le 0 x ∧ Real.instPreorder.le x 1)) x), Subtype.pseudoMetricSpace.toDist.1 x y = Real.metricSpace.toDist.1 x.1 y.1

Logical form (Lean):

```lean
theorem real_isMetricSuperspace_closedUnitInterval :
    IsMetricSuperspace Real (Set.Icc (0 : Real) 1)
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
theorem real_isMetricSuperspace_closedUnitInterval :
    IsMetricSuperspace Real (Set.Icc (0 : Real) 1) := by
  sorry
end LRA.Analysis.MetricSpace.SubSuperSpaces
