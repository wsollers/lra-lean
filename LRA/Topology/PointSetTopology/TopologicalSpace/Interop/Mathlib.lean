import LRA.Topology.PointSetTopology.TopologicalSpace.Definition.TopologicalSpace

namespace LRA.Topology

universe u

namespace TopologyDefinition

/--
`ToMathlibTopologicalSpace` TODO

Predicate logic:

  def ToMathlibTopologicalSpace {X : Type u} (topology : TopologyDefinition X) :
    _root_.TopologicalSpace X where
  IsOpen := topology.IsOpen
  isOpen_univ := topology.isOpen_univ
  isOpen_inter := topology.isOpen_inter
  isOpen_sUnion := topology.isOpen_sUnion

Predicate logic (unfolded):

  def ToMathlibTopologicalSpace {X : Type u} (topology : TopologyDefinition X) :
    _root_.TopologicalSpace X where
  IsOpen := topology.IsOpen
  isOpen_univ := topology.isOpen_univ
  isOpen_inter := topology.isOpen_inter
  isOpen_sUnion := topology.isOpen_sUnion (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ToMathlibTopologicalSpace {X : Type u} (topology : TopologyDefinition X) :
    _root_.TopologicalSpace X where
  IsOpen := topology.IsOpen
  isOpen_univ := topology.isOpen_univ
  isOpen_inter := topology.isOpen_inter
  isOpen_sUnion := topology.isOpen_sUnion
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

def ToMathlibTopologicalSpace {X : Type u} (topology : TopologyDefinition X) :
    _root_.TopologicalSpace X where
  IsOpen := topology.IsOpen
  isOpen_univ := topology.isOpen_univ
  isOpen_inter := topology.isOpen_inter
  isOpen_sUnion := topology.isOpen_sUnion

/--
`ToMathlibIsOpen` TODO

Predicate logic:

  letI : _root_.TopologicalSpace X

Predicate logic (unfolded):

  ∀ {X : Type u} (topology : LRA.Topology.TopologyDefinition X) (U : X → Prop), topology.ToMathlibTopologicalSpace.1 U ↔ topology.1 U

Logical form (Lean):

```lean
theorem ToMathlibIsOpen {X : Type u} (topology : TopologyDefinition X) (U : Set X) :
    letI : _root_.TopologicalSpace X := topology.ToMathlibTopologicalSpace
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
theorem ToMathlibIsOpen {X : Type u} (topology : TopologyDefinition X) (U : Set X) :
    letI : _root_.TopologicalSpace X := topology.ToMathlibTopologicalSpace
    _root_.IsOpen U ↔ topology.IsOpen U := by
  sorry

/--
`FromMathlibTopologicalSpace` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
    exact open_U.inter open_V (source fallback; no compiled unfold data available)

Logical form (Lean):

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

/--
`ToMathlibTopologicalSpace` TODO

Predicate logic:

  def ToMathlibTopologicalSpace (space : TopologicalSpaceDefinition.{u}) :
    _root_.TopologicalSpace space.Carrier :=
  space.topology.ToMathlibTopologicalSpace

Predicate logic (unfolded):

  def ToMathlibTopologicalSpace (space : TopologicalSpaceDefinition.{u}) :
    _root_.TopologicalSpace space.Carrier :=
  space.topology.ToMathlibTopologicalSpace (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ToMathlibTopologicalSpace (space : TopologicalSpaceDefinition.{u}) :
    _root_.TopologicalSpace space.Carrier :=
  space.topology.ToMathlibTopologicalSpace
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

def ToMathlibTopologicalSpace (space : TopologicalSpaceDefinition.{u}) :
    _root_.TopologicalSpace space.Carrier :=
  space.topology.ToMathlibTopologicalSpace

instance instMathlibTopologicalSpace (space : TopologicalSpaceDefinition.{u}) :
    _root_.TopologicalSpace space.Carrier :=
  space.ToMathlibTopologicalSpace

end TopologicalSpaceDefinition

/--
`IsCompatibleWithMathlibTopologicalSpace` TODO

Predicate logic:

  ∀ {X : Type u} [inst : TopologicalSpace X] (topology : LRA.Topology.TopologyDefinition X) (U : Set X), topology.IsOpen U ↔ IsOpen U

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : TopologicalSpace X] (topology : LRA.Topology.TopologyDefinition X) (U : X → Prop), topology.1 U ↔ inst.1 U

Logical form (Lean):

```lean
def IsCompatibleWithMathlibTopologicalSpace {X : Type u} [_root_.TopologicalSpace X]
    (topology : TopologyDefinition X) : Prop :=
  ∀ U : Set X, topology.IsOpen U ↔ _root_.IsOpen U
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def IsCompatibleWithMathlibTopologicalSpace {X : Type u} [_root_.TopologicalSpace X]
    (topology : TopologyDefinition X) : Prop :=
  ∀ U : Set X, topology.IsOpen U ↔ _root_.IsOpen U

/--
`FromMathlibTopologicalSpaceIsCompatibleWithMathlibTopologicalSpace` TODO

Predicate logic:

  IsCompatibleWithMathlibTopologicalSpace (TopologyDefinition.FromMathlibTopologicalSpace X)

Predicate logic (unfolded):

  ∀ {X : Type u} [inst : TopologicalSpace X] (U : X → Prop), (LRA.Topology.TopologyDefinition.FromMathlibTopologicalSpace X).1 U ↔ inst.1 U

Logical form (Lean):

```lean
theorem FromMathlibTopologicalSpaceIsCompatibleWithMathlibTopologicalSpace
    {X : Type u} [_root_.TopologicalSpace X] :
    IsCompatibleWithMathlibTopologicalSpace
      (TopologyDefinition.FromMathlibTopologicalSpace X)
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
theorem FromMathlibTopologicalSpaceIsCompatibleWithMathlibTopologicalSpace
    {X : Type u} [_root_.TopologicalSpace X] :
    IsCompatibleWithMathlibTopologicalSpace
      (TopologyDefinition.FromMathlibTopologicalSpace X) := by
  sorry

end LRA.Topology
