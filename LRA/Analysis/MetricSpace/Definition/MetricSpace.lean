import LRA.Analysis.MetricSpace.Definition.Metric

/-!
Reference definition for metric spaces, following Ó Searcóid `Metric Spaces`,
Definition 1.1.1.
-/

namespace LRA.Analysis.MetricSpace

universe u

/-- Source: Ó Searcóid, `Metric Spaces`, Definition 1.1.1.

Reference data for a metric space.

This packages a carrier with a metric, matching Ó Searcóid's convention that
`(X, d)` is a metric space when the metric needs to be named.

Mathematical statement (Lean): `structure MetricSpaceDefinition`.


Logical form:

```lean
structure MetricSpaceDefinition where
  /-- The underlying carrier of the space. -/
  Carrier : Type u
  /-- The metric on the carrier. -/
  metric : MetricDefinition Carrier
```
-/
structure MetricSpaceDefinition where
  /-- The underlying carrier of the space. -/
  Carrier : Type u
  /-- The metric on the carrier. -/
  metric : MetricDefinition Carrier

end LRA.Analysis.MetricSpace
