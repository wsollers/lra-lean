import Mathlib.Topology.Basic

/-!
Reference definitions for topology and topological spaces, following Willard
`General Topology`, Definition 3.1.

This module records the textbook-level objects for Volume IV orientation. It is
not intended as the proof foundation for later topology files; formal proofs
should use Mathlib's `TopologicalSpace` API directly.
-/

namespace LRA.VolumeIV.Topology

universe u

/-- Source: Willard, `General Topology`, Definition 3.1.

Reference data for a topology on a carrier type.

This follows Willard's Definition 3.1: a topology is a collection of subsets
called open sets, closed under arbitrary unions and finite intersections, and
containing both the empty set and the full carrier.
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

/-- Source: Willard, `General Topology`, Definition 3.1.

Reference data for a topological space.

This packages a carrier with a topology, matching Willard's convention that
`(X, τ)` is a topological space.
-/
structure TopologicalSpaceDefinition where
  /-- The underlying carrier of the space. -/
  Carrier : Type u
  /-- The topology on the carrier. -/
  topology : TopologyDefinition Carrier

/-- Source: Willard, `General Topology`, Theorem 3.4.

Closed sets in a topological space contain `X` and `∅`, are closed under
arbitrary intersections, and are closed under finite unions. Stated using
Mathlib's topology API.
-/
theorem closed_sets_in_topological_space
    {X : Type u}
    [TopologicalSpace X] :
    IsClosed (Set.univ : Set X) ∧
      IsClosed (∅ : Set X) ∧
      (∀ S : Set (Set X), (∀ C, C ∈ S → IsClosed C) → IsClosed (⋂₀ S)) ∧
      (∀ C D : Set X, IsClosed C → IsClosed D → IsClosed (C ∪ D)) := by
  sorry

/-- Source: Willard, `General Topology`, Theorem 3.4.

A family satisfying the closed-set axioms determines a topology whose closed
sets are exactly that family. Stated using Mathlib's topology API.
-/
theorem topology_from_closed_set_axioms
    {X : Type u}
    (ClosedSet : Set X → Prop)
    (closed_univ : ClosedSet Set.univ)
    (closed_empty : ClosedSet ∅)
    (closed_sInter :
      ∀ S : Set (Set X), (∀ C, C ∈ S → ClosedSet C) → ClosedSet (⋂₀ S))
    (closed_union :
      ∀ C D : Set X, ClosedSet C → ClosedSet D → ClosedSet (C ∪ D)) :
    ∃ topology : TopologicalSpace X,
      ∀ C : Set X, @IsClosed X topology C ↔ ClosedSet C := by
  sorry

end LRA.VolumeIV.Topology
