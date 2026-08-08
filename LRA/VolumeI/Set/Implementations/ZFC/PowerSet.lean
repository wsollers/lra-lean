import LRA.VolumeI.Set.Operations.Families
import LRA.VolumeI.Set.Implementations.ZFC.Comprehension

namespace LRA.VolumeI.Set.Implementations.ZFC

open LRA.VolumeI.Set.Operations

/-!
Higher-order powerset and collection adapter for single-sorted ZFC-style
native backends.
-/

/-- Powerset operation roll-up for a ZFC-style backend. -/
def powerSetOperations (native : NativeSetOperations) :
    PowerSetOperations where
  elementOperations := comprehensionOperations native
  collectionOperations := comprehensionOperations native
  subsetElement := id
  powerset := native.powerset

/-- Native ZFC laws imply the generic powerset laws. -/
theorem powerSetOperationLaws
    (native : NativeSetOperations)
    (nativeLaws : NativeSetOperationLaws native) :
    PowerSetOperationLaws (powerSetOperations native) := by
  sorry

/-- Native ZFC laws imply powerset laws with extensionality once supplied. -/
theorem powerSetInterfaceLaws
    (native : NativeSetOperations)
    (nativeLaws : NativeSetOperationLaws native)
    (extensionality :
      ∀ {left right : native.SetObject},
        (∀ element, native.member element left ↔ native.member element right) →
          left = right) :
    PowerSetInterfaceLaws (powerSetOperations native) := by
  sorry

/-- Collection operation roll-up for a ZFC-style backend. -/
def collectionSetOperations (native : NativeSetOperations) :
    CollectionSetOperations where
  toPowerSetOperations := powerSetOperations native
  collectionUnion := native.sUnion
  collectionIntersection :=
    fun collection =>
      native.separation (native.sUnion collection)
        (fun element =>
          ∀ memberSet, native.member memberSet collection → native.member element memberSet)

/-- Native ZFC laws imply the generic collection laws. -/
theorem collectionSetOperationLaws
    (native : NativeSetOperations)
    (nativeLaws : NativeSetOperationLaws native) :
    CollectionSetOperationLaws (collectionSetOperations native) := by
  sorry

/-- Native ZFC laws imply collection laws with extensionality once supplied. -/
theorem collectionSetInterfaceLaws
    (native : NativeSetOperations)
    (nativeLaws : NativeSetOperationLaws native)
    (extensionality :
      ∀ {left right : native.SetObject},
        (∀ element, native.member element left ↔ native.member element right) →
          left = right) :
    CollectionSetInterfaceLaws (collectionSetOperations native) := by
  sorry

end LRA.VolumeI.Set.Implementations.ZFC
