import Mathlib.Data.Set.Basic
import LRA.VolumeI.Set.Operations.Public

universe u

namespace LRA.VolumeI.Set.Implementations.MathlibSet

open LRA.VolumeI.Set.Operations

/-!
Adapter from mathlib predicate sets into the generic set interface.
-/

/-- Public operation roll-up for mathlib sets over a Lean carrier. -/
def publicOperations (Alpha : Type u) : PublicSetOperations where
  SetObject := Set Alpha
  Element := Alpha
  member := fun element setObject => element ∈ setObject
  empty := ∅
  singleton := fun element => {element}
  pair := fun left right => {left, right}
  union := fun left right => left ∪ right
  intersection := fun left right => left ∩ right
  subset := fun left right => left ⊆ right

/-- Mathlib sets satisfy the generic public set-operation laws. -/
theorem publicOperationLaws (Alpha : Type u) :
    PublicSetOperationLaws (publicOperations Alpha) := by
  sorry

end LRA.VolumeI.Set.Implementations.MathlibSet
