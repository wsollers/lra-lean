import LRA.VolumeIV.TopologicalSpaces.Compatibility.TopologicalSpace

/-!
Compatibility between the textbook topology record and Mathlib's topology API.
-/

namespace LRA.VolumeIV.TopologicalSpaces

universe u

namespace TopologyDefinition

/-- The Mathlib topological space induced by a textbook topology record.

Logical form:

```lean
def ToMathlibTopologicalSpace {X : Type u} (topology : TopologyDefinition X) :
    _root_.TopologicalSpace X where
  IsOpen := topology.IsOpen
  isOpen_univ := topology.isOpen_univ
  isOpen_inter := topology.isOpen_inter
  isOpen_sUnion := topology.isOpen_sUnion
```
-/
@[implicit_reducible]
def ToMathlibTopologicalSpace {X : Type u} (topology : TopologyDefinition X) :
    _root_.TopologicalSpace X where
  IsOpen := topology.IsOpen
  isOpen_univ := topology.isOpen_univ
  isOpen_inter := topology.isOpen_inter
  isOpen_sUnion := topology.isOpen_sUnion

/-- Inside the Mathlib topology induced by a textbook topology, Mathlib's
`IsOpen` predicate is the textbook `IsOpen` predicate.

Logical form:

```lean
theorem ToMathlibIsOpen {X : Type u} (topology : TopologyDefinition X) (U : Set X) :
    letI : _root_.TopologicalSpace X
```
-/
theorem ToMathlibIsOpen {X : Type u} (topology : TopologyDefinition X) (U : Set X) :
    letI : _root_.TopologicalSpace X := topology.ToMathlibTopologicalSpace
    _root_.IsOpen U ↔ topology.IsOpen U := by
  rfl

/-- The textbook topology record associated to an existing Mathlib topological
space.

Logical form:

```lean
def FromMathlibTopologicalSpace (X : Type u) [_root_.TopologicalSpace X] :
    TopologyDefinition X where
  IsOpen := _root_.IsOpen
  isOpen_univ := _root_.isOpen_univ
  isOpen_empty := _root_.isOpen_empty
  isOpen_sUnion := by
    intro S open_sets
    exact _root_.isOpen_sUnion open_sets
  isOpen_inter := by
    intro U V open_U open_V
    exact open_U.inter open_V
```
-/
def FromMathlibTopologicalSpace (X : Type u) [_root_.TopologicalSpace X] :
    TopologyDefinition X where
  IsOpen := _root_.IsOpen
  isOpen_univ := _root_.isOpen_univ
  isOpen_empty := _root_.isOpen_empty
  isOpen_sUnion := by
    intro S open_sets
    exact _root_.isOpen_sUnion open_sets
  isOpen_inter := by
    intro U V open_U open_V
    exact open_U.inter open_V

end TopologyDefinition

namespace TopologicalSpaceDefinition

/-- The Mathlib topological-space structure induced by a packaged textbook
topological space.

Logical form:

```lean
def ToMathlibTopologicalSpace (space : TopologicalSpaceDefinition.{u}) :
    _root_.TopologicalSpace space.Carrier :=
  space.topology.ToMathlibTopologicalSpace
```
-/
@[implicit_reducible]
def ToMathlibTopologicalSpace (space : TopologicalSpaceDefinition.{u}) :
    _root_.TopologicalSpace space.Carrier :=
  space.topology.ToMathlibTopologicalSpace

/-- A packaged textbook topological space can be used directly as a Mathlib
topological space on its carrier.

This instance is useful in learning files whose variables have type
`space.Carrier`: Mathlib-facing names such as `IsOpen`, `IsClosed`, closure,
and interior resolve through the packaged textbook topology. -/
instance instMathlibTopologicalSpace (space : TopologicalSpaceDefinition.{u}) :
    _root_.TopologicalSpace space.Carrier :=
  space.ToMathlibTopologicalSpace

end TopologicalSpaceDefinition

/-- A textbook topology record is compatible with the active Mathlib topology
when the two open-set predicates agree pointwise.

Logical form:

```lean
def IsCompatibleWithMathlibTopologicalSpace {X : Type u} [_root_.TopologicalSpace X]
    (topology : TopologyDefinition X) : Prop :=
  ∀ U : Set X, topology.IsOpen U ↔ _root_.IsOpen U
```
-/
def IsCompatibleWithMathlibTopologicalSpace {X : Type u} [_root_.TopologicalSpace X]
    (topology : TopologyDefinition X) : Prop :=
  ∀ U : Set X, topology.IsOpen U ↔ _root_.IsOpen U

/-- The textbook topology record built from Mathlib's topology is compatible
with Mathlib's topology.

Logical form:

```lean
theorem FromMathlibTopologicalSpaceIsCompatibleWithMathlibTopologicalSpace
    {X : Type u} [_root_.TopologicalSpace X] :
    IsCompatibleWithMathlibTopologicalSpace
      (TopologyDefinition.FromMathlibTopologicalSpace X)
```
-/
theorem FromMathlibTopologicalSpaceIsCompatibleWithMathlibTopologicalSpace
    {X : Type u} [_root_.TopologicalSpace X] :
    IsCompatibleWithMathlibTopologicalSpace
      (TopologyDefinition.FromMathlibTopologicalSpace X) := by
  intro U
  rfl

end LRA.VolumeIV.TopologicalSpaces
