import LRA.VolumeI.Set.Operations.Comprehension
import LRA.VolumeI.Set.Implementations.TT.Boolean

namespace LRA.VolumeI.Set.TTSet

open LRA.VolumeI.Set.Operations

/-!
Bounded-separation adapter for predicate sets.
-/

/-- Bounded-separation operation roll-up for predicate sets over a Lean carrier. -/
def comprehensionOperations (Alpha : LRA.VolumeI.Set.TTCarrier) :
    ComprehensionSetOperations where
  toPublicSetOperations := publicOperations Alpha
  separation := Separation

/-- Predicate sets satisfy the generic bounded-separation laws. -/
theorem comprehensionOperationLaws (Alpha : LRA.VolumeI.Set.TTCarrier) :
    ComprehensionSetOperationLaws (comprehensionOperations Alpha) := by
  sorry

/-- Predicate sets satisfy bounded-separation laws with extensionality. -/
theorem comprehensionInterfaceLaws (Alpha : LRA.VolumeI.Set.TTCarrier) :
    ComprehensionSetInterfaceLaws (comprehensionOperations Alpha) := by
  sorry

/-- Boolean bounded-separation operation roll-up for predicate sets. -/
def booleanComprehensionOperations (Alpha : LRA.VolumeI.Set.TTCarrier) :
    BooleanComprehensionSetOperations where
  toBooleanSetOperations := booleanOperations Alpha
  separation := Separation

/-- Predicate sets satisfy the Boolean bounded-separation laws. -/
theorem booleanComprehensionOperationLaws (Alpha : LRA.VolumeI.Set.TTCarrier) :
    BooleanComprehensionSetOperationLaws (booleanComprehensionOperations Alpha) := by
  sorry

/-- Predicate sets satisfy Boolean bounded-separation laws with extensionality. -/
theorem booleanComprehensionInterfaceLaws (Alpha : LRA.VolumeI.Set.TTCarrier) :
    BooleanComprehensionSetInterfaceLaws (booleanComprehensionOperations Alpha) := by
  sorry

end LRA.VolumeI.Set.TTSet
