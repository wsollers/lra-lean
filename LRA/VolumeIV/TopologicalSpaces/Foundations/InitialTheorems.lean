import LRA.VolumeIV.TopologicalSpaces.Compatibility.TopologicalSpace

/-!
Basic source-facing topology theorems stated against Mathlib's topology API.
-/

namespace LRA.VolumeIV.TopologicalSpaces

universe u

/-- Source: Willard, `General Topology`, Definition 3.3.

A subset of a topological space is closed when its complement is open.
This declaration records the source-facing definition; later formal proofs may
use Mathlib's `IsClosed` API directly.

Mathematical statement (Lean): `def ClosedSetDefinition {X : Type u} [TopologicalSpace X] (E : Set X) : Prop`.
-/
def ClosedSetDefinition {X : Type u} [TopologicalSpace X] (E : Set X) : Prop :=
  IsOpen (Eᶜ)

/-- Source-facing closed-set family associated to a topology.

This names the family used in Willard's Theorem 3.4: the subsets whose
complements are open.

Mathematical statement (Lean): `def ClosedSetFamilyOfTopology (X : Type u) [TopologicalSpace X] : Set (Set X)`.
-/
def ClosedSetFamilyOfTopology (X : Type u) [TopologicalSpace X] : Set (Set X) :=
  {F | ClosedSetDefinition F}

/-- Source: Willard, `General Topology`, Theorem 3.4.

Closed sets in a topological space contain `X` and `∅`, are closed under
arbitrary intersections, and are closed under finite unions. Stated using
Mathlib's topology API.

Mathematical statement (Lean): `theorem closed_sets_in_topological_space {X : Type u} [TopologicalSpace X] : IsClosed (Set.univ : Set X) ∧ IsClosed (∅ : Set X) ∧ (∀ S : Set (Set X), (∀ C, C ∈ S → IsClosed C) → IsClosed (⋂₀ S)) ∧ (∀ C D : Set X, IsClosed C → IsClosed D → IsClosed (C ∪ D))`.

*Proof status:* proof pending
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

Mathematical statement (Lean): `theorem topology_from_closed_set_axioms {X : Type u} (ClosedSet : Set X → Prop) (closed_univ : ClosedSet Set.univ) (closed_empty : ClosedSet ∅) (closed_sInter : ∀ S : Set (Set X), (∀ C, C ∈ S → ClosedSet C) → ClosedSet (⋂₀ S)) (closed_union : ∀ C D : Set X,...`.

*Proof status:* proof pending
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

end LRA.VolumeIV.TopologicalSpaces
