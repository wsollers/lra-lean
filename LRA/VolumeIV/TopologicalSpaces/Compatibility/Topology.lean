import Mathlib.Topology.Basic

/-!
Reference definition for topologies, following Willard `General Topology`,
Definition 3.1.
-/

namespace LRA.VolumeIV.TopologicalSpaces

universe u

/-- Source: Willard, `General Topology`, Definition 3.1.

Reference data for a topology on a carrier type.

This follows Willard's Definition 3.1: a topology is a collection of subsets
called open sets, closed under arbitrary unions and finite intersections, and
containing both the empty set and the full carrier.

Mathematical statement (Lean): `structure TopologyDefinition (X : Type u)`.
-/
structure TopologyDefinition (X : Type u) where
  /-- The sets declared open by the topology. -/
  IsOpen : Set X → Prop
  /-- The whole carrier is open. -/
  isOpen_univ : IsOpen Set.univ
  /-- The empty set is open. -/
  isOpen_empty : IsOpen ∅
  /-- Arbitrary unions of open sets are open. -/
  isOpen_sUnion :
    ∀ S : Set (Set X), (∀ U, U ∈ S → IsOpen U) → IsOpen (⋃₀ S)
  /-- Finite intersections of open sets are open, stated in binary form. -/
  isOpen_inter :
    ∀ U V : Set X, IsOpen U → IsOpen V → IsOpen (U ∩ V)

end LRA.VolumeIV.TopologicalSpaces
