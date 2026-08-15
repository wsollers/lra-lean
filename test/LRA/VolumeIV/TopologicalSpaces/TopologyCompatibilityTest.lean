import LRA.VolumeIV.TopologicalSpaces.Compatibility
import LRA.VolumeIV.TopologicalSpaces.Foundations

namespace LRA.Topology

universe u

/-- Test proof against the active Mathlib topology. -/
example
    {X : Type u}
    [_root_.TopologicalSpace X]
    {U V : Set X}
    (openU : _root_.IsOpen U)
    (openV : _root_.IsOpen V) :
    _root_.IsOpen (U ∩ V) := by
  exact openU.inter openV

/-- Test proof with a textbook topology converted into a Mathlib topology. -/
example
    {X : Type u}
    (topology : TopologyDefinition X)
    {U V : Set X}
    (openU :
      letI : _root_.TopologicalSpace X := topology.ToMathlibTopologicalSpace
      _root_.IsOpen U)
    (openV :
      letI : _root_.TopologicalSpace X := topology.ToMathlibTopologicalSpace
      _root_.IsOpen V) :
    letI : _root_.TopologicalSpace X := topology.ToMathlibTopologicalSpace
    _root_.IsOpen (U ∩ V) := by
  letI : _root_.TopologicalSpace X := topology.ToMathlibTopologicalSpace
  exact openU.inter openV

/-- Test proof using the raw textbook topology record directly. -/
example
    {X : Type u}
    (topology : TopologyDefinition X)
    {U V : Set X}
    (openU : topology.IsOpen U)
    (openV : topology.IsOpen V) :
    topology.IsOpen (U ∩ V) := by
  exact topology.isOpen_inter U V openU openV

/-- Test that Mathlib `IsOpen` unfolds back to the textbook `IsOpen` predicate
under the induced topology. -/
example
    {X : Type u}
    (topology : TopologyDefinition X)
    {U : Set X}
    (openU : topology.IsOpen U) :
    letI : _root_.TopologicalSpace X := topology.ToMathlibTopologicalSpace
    _root_.IsOpen U := by
  letI : _root_.TopologicalSpace X := topology.ToMathlibTopologicalSpace
  exact (topology.ToMathlibIsOpen U).mpr openU

/-- Test the topology backend switch in the induced-topology mode. -/
example
    {X : Type u}
    (topology : TopologyDefinition X)
    [_root_.TopologicalSpace X]
    {U : Set X}
    (openU : topology.IsOpen U) :
    letI : _root_.TopologicalSpace X :=
      SelectMathlibTopologicalSpace .inducedFromTopologyDefinition topology
    _root_.IsOpen U := by
  letI : _root_.TopologicalSpace X :=
    SelectMathlibTopologicalSpace .inducedFromTopologyDefinition topology
  exact (SelectMathlibTopologicalSpaceIsOpenInduced topology U).mpr openU

end LRA.Topology
