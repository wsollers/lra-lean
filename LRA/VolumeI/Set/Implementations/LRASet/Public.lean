import LRA.VolumeI.Set.Operations.Public
import LRA.VolumeI.Set.Implementations.LRASet.LRASet

universe u

namespace LRA.VolumeI.Set.Implementations.LRASet

open LRA.VolumeI.Set.Operations

/-!
Public-operation adapter for the project LRASet backend.
-/

/-- Public operation roll-up for LRA sets over a Lean carrier. -/
def publicOperations (Alpha : LRACarrier.{u}) :
    PublicSetOperations where
  SetObject := LRASet Alpha
  Element := Alpha
  member := LRASet.Member
  empty := LRASet.Empty Alpha
  singleton := LRASet.Singleton
  pair := fun left right => LRASet.Union (LRASet.Singleton left) (LRASet.Singleton right)
  union := LRASet.Union
  intersection := LRASet.Intersection
  subset := LRASet.Subset

/-- LRA sets satisfy the public finite-operation laws. -/
theorem publicOperationLaws (Alpha : LRACarrier.{u}) :
    PublicSetOperationLaws (publicOperations Alpha) := by
  sorry

end LRA.VolumeI.Set.Implementations.LRASet
