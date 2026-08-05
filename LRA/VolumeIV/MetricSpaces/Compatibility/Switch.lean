import LRA.VolumeIV.MetricSpaces.Compatibility.Basic

/-!
A small switch for choosing whether a formalization path should use the
Mathlib metric already on a type or the Mathlib metric induced by a textbook
`MetricDefinition`.
-/

namespace LRA.VolumeIV.MetricSpaces

universe u

/-- Which metric-space backend a development should use. -/
inductive MetricSpaceBackend where
  /-- Use the `MetricSpace` instance induced from the textbook metric record. -/
  | inducedFromMetricDefinition
  /-- Use an already active Mathlib `MetricSpace` instance. -/
  | existingMathlibMetric
  deriving DecidableEq, Repr

/-- The default backend for source-facing Volume IV metric modeling. -/
def DefaultMetricSpaceBackend : MetricSpaceBackend :=
  .inducedFromMetricDefinition

/-- Use the Mathlib metric-space structure induced by a textbook metric record.

This helper is intended for learning files:

```lean
local instance : MetricSpace X := UseTextbookMetricSpace metric
```

After that local instance is active, ordinary Mathlib-facing metric proofs can
use `dist`, `Metric.ball`, `dist_triangle`, and related names. -/
@[implicit_reducible]
def UseTextbookMetricSpace {X : Type u} (metric : MetricDefinition X) :
    MetricSpace X :=
  metric.ToMathlibMetricSpace

/-- Use the already active Mathlib metric-space structure. -/
@[implicit_reducible]
def UseExistingMathlibMetricSpace {X : Type u} [MetricSpace X]
    (_metric : MetricDefinition X) :
    MetricSpace X :=
  inferInstance

/-- Select a Mathlib metric-space structure from a backend choice. -/
@[implicit_reducible]
def SelectMathlibMetricSpace {X : Type u}
    (backend : MetricSpaceBackend)
    (metric : MetricDefinition X)
    [existingMetricSpace : MetricSpace X] :
    MetricSpace X :=
  match backend with
  | .inducedFromMetricDefinition => metric.ToMathlibMetricSpace
  | .existingMathlibMetric => existingMetricSpace

/-- The selected distance agrees with the textbook distance when the switch uses
the induced metric-space backend. -/
theorem SelectMathlibMetricSpaceDistanceInduced {X : Type u}
    (metric : MetricDefinition X)
    [MetricSpace X]
    (x y : X) :
    letI : MetricSpace X :=
      SelectMathlibMetricSpace .inducedFromMetricDefinition metric
    dist x y = metric.distance x y := by
  rfl

end LRA.VolumeIV.MetricSpaces
