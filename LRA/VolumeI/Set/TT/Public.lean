import LRA.VolumeI.Set.Operations.Public
import LRA.VolumeI.Set.TT.Native

namespace LRA.VolumeI.Set.TTSet

open LRA.VolumeI.Set.Operations

/-- Public operation roll-up for predicate sets over a Lean carrier. -/
def publicOperations (Alpha : LRA.VolumeI.Set.LRACarrier) :
    PublicSetOperations where
  SetObject := TTSet Alpha
  Element := Alpha
  member := Member
  empty := Empty Alpha
  singleton := Singleton
  pair := fun left right => Union (Singleton left) (Singleton right)
  union := Union
  intersection := Intersection
  subset := Subset

/-- Predicate sets satisfy the public finite-operation laws.

Proof status: pending while the set layer is being built out pedagogically.
-/
theorem publicOperationLaws (Alpha : LRA.VolumeI.Set.LRACarrier) :
    PublicSetOperationLaws (publicOperations Alpha) := by
  sorry

end LRA.VolumeI.Set.TTSet
