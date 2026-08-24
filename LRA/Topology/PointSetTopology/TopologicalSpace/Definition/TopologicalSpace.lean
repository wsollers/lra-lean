import LRA.Topology.PointSetTopology.TopologicalSpace.Definition.Topology

namespace LRA.Topology

universe u

/--
`TopologicalSpaceDefinition` TODO

Predicate logic:

  structure TopologicalSpaceDefinition where

  Carrier : Type u

  topology : TopologyDefinition Carrier

Predicate logic (unfolded):

  structure TopologicalSpaceDefinition where

  Carrier : Type u

  topology : TopologyDefinition Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure TopologicalSpaceDefinition where

  Carrier : Type u

  topology : TopologyDefinition Carrier
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
structure TopologicalSpaceDefinition where

  Carrier : Type u

  topology : TopologyDefinition Carrier

end LRA.Topology
