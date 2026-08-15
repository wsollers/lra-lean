import LRA.VolumeIV.TopologicalSpaces.Compatibility.Topology

/-!
Reference definition for topological spaces, following Willard `General
Topology`, Definition 3.1.
-/

namespace LRA.Topology

universe u

/-- Source: Willard, `General Topology`, Definition 3.1.

Reference data for a topological space.

This packages a carrier with a topology, matching Willard's convention that
`(X, τ)` is a topological space.

Mathematical statement (Lean): `structure TopologicalSpaceDefinition`.


Logical form:

```lean
structure TopologicalSpaceDefinition where
  /-- The underlying carrier of the space. -/
  Carrier : Type u
  /-- The topology on the carrier. -/
  topology : TopologyDefinition Carrier
```
-/
structure TopologicalSpaceDefinition where
  /-- The underlying carrier of the space. -/
  Carrier : Type u
  /-- The topology on the carrier. -/
  topology : TopologyDefinition Carrier

end LRA.Topology
