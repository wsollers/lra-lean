import LRA.VolumeI.Set.Operations.Boolean
import LRA.VolumeI.Set.Implementations.TT.Public

namespace LRA.VolumeI.Set.TTSet

open LRA.VolumeI.Set.Operations

/-!
Boolean-operation adapter for predicate sets.
-/

/-- Boolean operation roll-up for predicate sets over a Lean carrier. -/
def booleanOperations (Alpha : LRA.VolumeI.Set.TTCarrier) :
    BooleanSetOperations where
  toPublicSetOperations := publicOperations Alpha
  universal := Universal Alpha
  complement := Complement
  difference := Difference
  symmetricDifference := SymmetricDifference

/-- Predicate sets satisfy the Boolean operation membership laws. -/
theorem booleanOperationLaws (Alpha : LRA.VolumeI.Set.TTCarrier) :
    BooleanSetOperationLaws (booleanOperations Alpha) := by
  sorry

/-- Predicate sets satisfy the Boolean operation laws with extensionality. -/
theorem booleanInterfaceLaws (Alpha : LRA.VolumeI.Set.TTCarrier) :
    BooleanSetInterfaceLaws (booleanOperations Alpha) := by
  sorry

end LRA.VolumeI.Set.TTSet
