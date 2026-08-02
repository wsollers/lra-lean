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

/-- Predicate sets satisfy the public finite-operation laws definitionally. -/
theorem publicOperationLaws (Alpha : LRA.VolumeI.Set.LRACarrier) :
    PublicSetOperationLaws (publicOperations Alpha) := by
  constructor
  · intro element
    exact id
  · intro element chosen
    rfl
  · intro element left right
    rfl
  · intro element left right
    rfl
  · intro element left right
    rfl
  · intro left right
    rfl

end LRA.VolumeI.Set.TTSet
