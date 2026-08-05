import LRA.VolumeIV.TopologicalSpaces.Compatibility.Basic

/-!
A small switch for choosing whether a formalization path should use the
Mathlib topology already on a type or the Mathlib topology induced by a
textbook `TopologyDefinition`.
-/

namespace LRA.VolumeIV.TopologicalSpaces

universe u

/-- Which topological-space backend a development should use. -/
inductive TopologicalSpaceBackend where
  /-- Use the `TopologicalSpace` instance induced from the textbook topology
  record. -/
  | inducedFromTopologyDefinition
  /-- Use an already active Mathlib `TopologicalSpace` instance. -/
  | existingMathlibTopology
  deriving DecidableEq, Repr

/-- The default backend for source-facing Volume IV topology modeling. -/
def DefaultTopologicalSpaceBackend : TopologicalSpaceBackend :=
  .inducedFromTopologyDefinition

/-- Use the Mathlib topological-space structure induced by a textbook topology
record.

This helper is intended for learning files:

```lean
local instance : TopologicalSpace X := UseTextbookTopologicalSpace topology
```

After that local instance is active, ordinary Mathlib-facing topology proofs can
use `IsOpen`, `IsClosed`, closure/interior, and related names. -/
@[implicit_reducible]
def UseTextbookTopologicalSpace {X : Type u} (topology : TopologyDefinition X) :
    _root_.TopologicalSpace X :=
  topology.ToMathlibTopologicalSpace

/-- Use the already active Mathlib topological-space structure. -/
@[implicit_reducible]
def UseExistingMathlibTopologicalSpace {X : Type u} [_root_.TopologicalSpace X]
    (_topology : TopologyDefinition X) :
    _root_.TopologicalSpace X :=
  inferInstance

/-- Select a Mathlib topological-space structure from a backend choice. -/
@[implicit_reducible]
def SelectMathlibTopologicalSpace {X : Type u}
    (backend : TopologicalSpaceBackend)
    (topology : TopologyDefinition X)
    [existingTopologicalSpace : _root_.TopologicalSpace X] :
    _root_.TopologicalSpace X :=
  match backend with
  | .inducedFromTopologyDefinition => topology.ToMathlibTopologicalSpace
  | .existingMathlibTopology => existingTopologicalSpace

/-- The selected open-set predicate agrees with the textbook predicate when the
switch uses the induced topological-space backend. -/
theorem SelectMathlibTopologicalSpaceIsOpenInduced {X : Type u}
    (topology : TopologyDefinition X)
    [_root_.TopologicalSpace X]
    (U : Set X) :
    letI : _root_.TopologicalSpace X :=
      SelectMathlibTopologicalSpace .inducedFromTopologyDefinition topology
    _root_.IsOpen U ↔ topology.IsOpen U := by
  rfl

end LRA.VolumeIV.TopologicalSpaces
