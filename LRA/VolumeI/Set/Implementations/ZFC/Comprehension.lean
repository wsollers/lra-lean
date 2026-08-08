import LRA.VolumeI.Set.Operations.Comprehension
import LRA.VolumeI.Set.Implementations.ZFC.Public

namespace LRA.VolumeI.Set.Implementations.ZFC

open LRA.VolumeI.Set.Operations

/-!
Bounded-separation adapter for ZFC-style native backends.
-/

/-- Bounded-separation operation roll-up for a ZFC-style backend. -/
def comprehensionOperations (native : NativeSetOperations) :
    ComprehensionSetOperations where
  toPublicSetOperations := publicOperations native
  separation := native.separation

/-- Native ZFC laws imply the generic bounded-separation laws. -/
theorem comprehensionOperationLaws
    (native : NativeSetOperations)
    (nativeLaws : NativeSetOperationLaws native) :
    ComprehensionSetOperationLaws (comprehensionOperations native) := by
  refine
    { (publicOperationLaws native nativeLaws) with
      separationMembership := ?_ }
  exact nativeLaws.separationMembership

/-- Native ZFC laws imply bounded-separation laws with extensionality once
extensionality is supplied by the concrete model. -/
theorem comprehensionInterfaceLaws
    (native : NativeSetOperations)
    (nativeLaws : NativeSetOperationLaws native)
    (extensionality :
      ∀ {left right : native.SetObject},
        (∀ element, native.member element left ↔ native.member element right) →
          left = right) :
    ComprehensionSetInterfaceLaws (comprehensionOperations native) := by
  refine
    { (comprehensionOperationLaws native nativeLaws) with
      extensionality := ?_ }
  exact extensionality

end LRA.VolumeI.Set.Implementations.ZFC
