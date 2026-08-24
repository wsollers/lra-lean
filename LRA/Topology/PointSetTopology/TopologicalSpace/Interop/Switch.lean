import LRA.Topology.PointSetTopology.TopologicalSpace.Interop.Mathlib

namespace LRA.Topology

universe u

/--
`TopologicalSpaceBackend` TODO

Predicate logic:

  inductive TopologicalSpaceBackend where

  | inducedFromTopologyDefinition

  | existingMathlibTopology
  deriving DecidableEq, Repr

Predicate logic (unfolded):

  inductive TopologicalSpaceBackend where

  | inducedFromTopologyDefinition

  | existingMathlibTopology
  deriving DecidableEq, Repr (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
inductive TopologicalSpaceBackend where

  | inducedFromTopologyDefinition

  | existingMathlibTopology
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
inductive TopologicalSpaceBackend where

  | inducedFromTopologyDefinition

  | existingMathlibTopology
  deriving DecidableEq, Repr

/--
`DefaultTopologicalSpaceBackend` TODO

Predicate logic:

  def DefaultTopologicalSpaceBackend : TopologicalSpaceBackend :=
  .inducedFromTopologyDefinition

Predicate logic (unfolded):

  def DefaultTopologicalSpaceBackend : TopologicalSpaceBackend :=
  .inducedFromTopologyDefinition (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def DefaultTopologicalSpaceBackend : TopologicalSpaceBackend :=
  .inducedFromTopologyDefinition
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
def DefaultTopologicalSpaceBackend : TopologicalSpaceBackend :=
  .inducedFromTopologyDefinition

/--
`UseTextbookTopologicalSpace` TODO

Predicate logic:

  def UseTextbookTopologicalSpace {X : Type u} (topology : TopologyDefinition X) :
    _root_.TopologicalSpace X :=
  topology.ToMathlibTopologicalSpace

Predicate logic (unfolded):

  def UseTextbookTopologicalSpace {X : Type u} (topology : TopologyDefinition X) :
    _root_.TopologicalSpace X :=
  topology.ToMathlibTopologicalSpace (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def UseTextbookTopologicalSpace {X : Type u} (topology : TopologyDefinition X) :
    _root_.TopologicalSpace X :=
  topology.ToMathlibTopologicalSpace
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

def UseTextbookTopologicalSpace {X : Type u} (topology : TopologyDefinition X) :
    _root_.TopologicalSpace X :=
  topology.ToMathlibTopologicalSpace

/--
`UseExistingMathlibTopologicalSpace` TODO

Predicate logic:

  def UseExistingMathlibTopologicalSpace {X : Type u} [_root_.TopologicalSpace X]
    (_topology : TopologyDefinition X) :
    _root_.TopologicalSpace X :=
  inferInstance

Predicate logic (unfolded):

  def UseExistingMathlibTopologicalSpace {X : Type u} [_root_.TopologicalSpace X]
    (_topology : TopologyDefinition X) :
    _root_.TopologicalSpace X :=
  inferInstance (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def UseExistingMathlibTopologicalSpace {X : Type u} [_root_.TopologicalSpace X]
    (_topology : TopologyDefinition X) :
    _root_.TopologicalSpace X :=
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

def UseExistingMathlibTopologicalSpace {X : Type u} [_root_.TopologicalSpace X]
    (_topology : TopologyDefinition X) :
    _root_.TopologicalSpace X :=
  inferInstance

/--
`SelectMathlibTopologicalSpace` TODO

Predicate logic:

  def SelectMathlibTopologicalSpace {X : Type u}
    (backend : TopologicalSpaceBackend)
    (topology : TopologyDefinition X)
    [existingTopologicalSpace : _root_.TopologicalSpace X] :
    _root_.TopologicalSpace X :=
  match backend with
  | .inducedFromTopologyDefinition => topology.ToMathlibTopologicalSpace
  | .existingMathlibTopology => existingTopologicalSpace

Predicate logic (unfolded):

  def SelectMathlibTopologicalSpace {X : Type u}
    (backend : TopologicalSpaceBackend)
    (topology : TopologyDefinition X)
    [existingTopologicalSpace : _root_.TopologicalSpace X] :
    _root_.TopologicalSpace X :=
  match backend with
  | .inducedFromTopologyDefinition => topology.ToMathlibTopologicalSpace
  | .existingMathlibTopology => existingTopologicalSpace (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def SelectMathlibTopologicalSpace {X : Type u}
    (backend : TopologicalSpaceBackend)
    (topology : TopologyDefinition X)
    [existingTopologicalSpace : _root_.TopologicalSpace X] :
    _root_.TopologicalSpace X :=
  match backend with
  | .inducedFromTopologyDefinition => topology.ToMathlibTopologicalSpace
  | .existingMathlibTopology => existingTopologicalSpace
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

def SelectMathlibTopologicalSpace {X : Type u}
    (backend : TopologicalSpaceBackend)
    (topology : TopologyDefinition X)
    [existingTopologicalSpace : _root_.TopologicalSpace X] :
    _root_.TopologicalSpace X :=
  match backend with
  | .inducedFromTopologyDefinition => topology.ToMathlibTopologicalSpace
  | .existingMathlibTopology => existingTopologicalSpace

/--
`SelectMathlibTopologicalSpaceIsOpenInduced` TODO

Predicate logic:

  letI : _root_.TopologicalSpace X

Predicate logic (unfolded):

  ∀ {X : Type u} (topology : LRA.Topology.TopologyDefinition X) [inst : TopologicalSpace X] (U : X → Prop), (LRA.Topology.SelectMathlibTopologicalSpace LRA.Topology.TopologicalSpaceBackend.inducedFromTopologyDefinition topology).1 U ↔ topology.1 U

Logical form (Lean):

```lean
theorem SelectMathlibTopologicalSpaceIsOpenInduced {X : Type u}
    (topology : TopologyDefinition X)
    [_root_.TopologicalSpace X]
    (U : Set X) :
    letI : _root_.TopologicalSpace X :=
      SelectMathlibTopologicalSpace .inducedFromTopologyDefinition topology
    _root_.IsOpen U ↔ topology.IsOpen U
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem SelectMathlibTopologicalSpaceIsOpenInduced {X : Type u}
    (topology : TopologyDefinition X)
    [_root_.TopologicalSpace X]
    (U : Set X) :
    letI : _root_.TopologicalSpace X :=
      SelectMathlibTopologicalSpace .inducedFromTopologyDefinition topology
    _root_.IsOpen U ↔ topology.IsOpen U := by
  sorry

end LRA.Topology
