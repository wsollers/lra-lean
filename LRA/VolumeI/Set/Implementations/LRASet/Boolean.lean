import LRA.VolumeI.Set.Operations.Boolean
import LRA.VolumeI.Set.Implementations.LRASet.Public

universe u

namespace LRA.VolumeI.Set.Implementations.LRASet

open LRA.VolumeI.Set.Operations

/-!
Boolean-operation adapter for the project LRASet backend.
-/

/-- Boolean operation roll-up for LRA sets over a Lean carrier. -/
def booleanOperations (Alpha : LRACarrier.{u}) :
    BooleanSetOperations where
  toPublicSetOperations := publicOperations Alpha
  universal := LRASet.Universal Alpha
  complement := LRASet.Complement
  difference := LRASet.Difference
  symmetricDifference := LRASet.SymmetricDifference

/-- LRA sets satisfy the Boolean operation membership laws. -/
theorem booleanOperationLaws (Alpha : LRACarrier.{u}) :
    BooleanSetOperationLaws (booleanOperations Alpha) := by
  sorry

/-- LRA sets satisfy the Boolean operation laws with extensionality. -/
theorem booleanInterfaceLaws (Alpha : LRACarrier.{u}) :
    BooleanSetInterfaceLaws (booleanOperations Alpha) := by
  sorry

end LRA.VolumeI.Set.Implementations.LRASet
