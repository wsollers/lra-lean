import LRA.Analysis.MetricSpace.Interop.Mathlib

namespace LRA.Analysis.MetricSpace

universe u

/--
`MetricSpaceBackend` TODO

Predicate logic:

  inductive MetricSpaceBackend where

  | inducedFromMetricDefinition

  | existingMathlibMetric
  deriving DecidableEq, Repr

Predicate logic (unfolded):

  inductive MetricSpaceBackend where

  | inducedFromMetricDefinition

  | existingMathlibMetric
  deriving DecidableEq, Repr (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive MetricSpaceBackend where

  | inducedFromMetricDefinition

  | existingMathlibMetric
  deriving DecidableEq, Repr
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
inductive MetricSpaceBackend where

  | inducedFromMetricDefinition

  | existingMathlibMetric
  deriving DecidableEq, Repr

/--
`DefaultMetricSpaceBackend` TODO

Predicate logic:

  def DefaultMetricSpaceBackend : MetricSpaceBackend :=
  .inducedFromMetricDefinition

Predicate logic (unfolded):

  def DefaultMetricSpaceBackend : MetricSpaceBackend :=
  .inducedFromMetricDefinition (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def DefaultMetricSpaceBackend : MetricSpaceBackend :=
  .inducedFromMetricDefinition
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
def DefaultMetricSpaceBackend : MetricSpaceBackend :=
  .inducedFromMetricDefinition

/--
`UseTextbookMetricSpace` TODO

Predicate logic:

  def UseTextbookMetricSpace {X : Type u} (metric : MetricDefinition X) :
    MetricSpace X :=
  metric.ToMathlibMetricSpace

Predicate logic (unfolded):

  def UseTextbookMetricSpace {X : Type u} (metric : MetricDefinition X) :
    MetricSpace X :=
  metric.ToMathlibMetricSpace (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def UseTextbookMetricSpace {X : Type u} (metric : MetricDefinition X) :
    MetricSpace X :=
  metric.ToMathlibMetricSpace
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

def UseTextbookMetricSpace {X : Type u} (metric : MetricDefinition X) :
    MetricSpace X :=
  metric.ToMathlibMetricSpace

/--
`UseExistingMathlibMetricSpace` TODO

Predicate logic:

  def UseExistingMathlibMetricSpace {X : Type u} [MetricSpace X]
    (_metric : MetricDefinition X) :
    MetricSpace X :=
  inferInstance

Predicate logic (unfolded):

  def UseExistingMathlibMetricSpace {X : Type u} [MetricSpace X]
    (_metric : MetricDefinition X) :
    MetricSpace X :=
  inferInstance (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def UseExistingMathlibMetricSpace {X : Type u} [MetricSpace X]
    (_metric : MetricDefinition X) :
    MetricSpace X :=
  inferInstance
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

def UseExistingMathlibMetricSpace {X : Type u} [MetricSpace X]
    (_metric : MetricDefinition X) :
    MetricSpace X :=
  inferInstance

/--
`SelectMathlibMetricSpace` TODO

Predicate logic:

  def SelectMathlibMetricSpace {X : Type u}
    (backend : MetricSpaceBackend)
    (metric : MetricDefinition X)
    [existingMetricSpace : MetricSpace X] :
    MetricSpace X :=
  match backend with
  | .inducedFromMetricDefinition => metric.ToMathlibMetricSpace
  | .existingMathlibMetric => existingMetricSpace

Predicate logic (unfolded):

  def SelectMathlibMetricSpace {X : Type u}
    (backend : MetricSpaceBackend)
    (metric : MetricDefinition X)
    [existingMetricSpace : MetricSpace X] :
    MetricSpace X :=
  match backend with
  | .inducedFromMetricDefinition => metric.ToMathlibMetricSpace
  | .existingMathlibMetric => existingMetricSpace (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SelectMathlibMetricSpace {X : Type u}
    (backend : MetricSpaceBackend)
    (metric : MetricDefinition X)
    [existingMetricSpace : MetricSpace X] :
    MetricSpace X :=
  match backend with
  | .inducedFromMetricDefinition => metric.ToMathlibMetricSpace
  | .existingMathlibMetric => existingMetricSpace
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

def SelectMathlibMetricSpace {X : Type u}
    (backend : MetricSpaceBackend)
    (metric : MetricDefinition X)
    [existingMetricSpace : MetricSpace X] :
    MetricSpace X :=
  match backend with
  | .inducedFromMetricDefinition => metric.ToMathlibMetricSpace
  | .existingMathlibMetric => existingMetricSpace

/--
`SelectMathlibMetricSpaceDistanceInduced` TODO

Predicate logic:

  (∀ x y ∈ X), letI : MetricSpace X

Predicate logic (unfolded):

  ∀ {X : Type u} (metric : LRA.Analysis.MetricSpace.MetricDefinition X) [inst : MetricSpace X] (x y : X), (LRA.Analysis.MetricSpace.SelectMathlibMetricSpace LRA.Analysis.MetricSpace.MetricSpaceBackend.inducedFromMetricDefinition metric).toDist.1 x y = metric.1 x y

Logical form (Lean):

```lean
theorem SelectMathlibMetricSpaceDistanceInduced {X : Type u}
    (metric : MetricDefinition X)
    [MetricSpace X]
    (x y : X) :
    letI : MetricSpace X :=
      SelectMathlibMetricSpace .inducedFromMetricDefinition metric
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
theorem SelectMathlibMetricSpaceDistanceInduced {X : Type u}
    (metric : MetricDefinition X)
    [MetricSpace X]
    (x y : X) :
    letI : MetricSpace X :=
      SelectMathlibMetricSpace .inducedFromMetricDefinition metric
    dist x y = metric.distance x y := by
  sorry

end LRA.Analysis.MetricSpace
