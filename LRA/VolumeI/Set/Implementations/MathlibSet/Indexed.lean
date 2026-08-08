import Mathlib.Data.Set.Lattice
import LRA.VolumeI.Set.Operations.Indexed
import LRA.VolumeI.Set.Implementations.MathlibSet.Public

universe u

namespace LRA.VolumeI.Set.Implementations.MathlibSet

open LRA.VolumeI.Set.Operations

/-!
Indexed-operation adapter for mathlib sets.
-/

/-- Indexed operation roll-up for mathlib sets over a Lean carrier. -/
def indexedOperations (Alpha : Type u) : IndexedSetOperations.{u, u} where
  toPublicSetOperations := publicOperations Alpha
  indexedUnion := fun family => ⋃ index, family index
  indexedIntersection := fun family => ⋂ index, family index
  countableUnion := fun family => ⋃ index : Nat, family index
  countableIntersection := fun family => ⋂ index : Nat, family index

/-- Mathlib sets satisfy the indexed operation membership laws. -/
theorem indexedOperationLaws (Alpha : Type u) :
    IndexedSetOperationLaws (indexedOperations Alpha) := by
  sorry

/-- Mathlib sets satisfy the indexed operation laws with extensionality. -/
theorem indexedInterfaceLaws (Alpha : Type u) :
    IndexedSetInterfaceLaws (indexedOperations Alpha) := by
  sorry

end LRA.VolumeI.Set.Implementations.MathlibSet
