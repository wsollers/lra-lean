import LRA.Analysis.MetricSpace.Definition.Metric

namespace LRA.Analysis.MetricSpace

universe u

/--
`MetricSpaceDefinition` TODO

Predicate logic:

  structure MetricSpaceDefinition where

  Carrier : Type u

  metric : MetricDefinition Carrier

Predicate logic (unfolded):

  structure MetricSpaceDefinition where

  Carrier : Type u

  metric : MetricDefinition Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure MetricSpaceDefinition where

  Carrier : Type u

  metric : MetricDefinition Carrier
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
structure MetricSpaceDefinition where

  Carrier : Type u

  metric : MetricDefinition Carrier

end LRA.Analysis.MetricSpace
