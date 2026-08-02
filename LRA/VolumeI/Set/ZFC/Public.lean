import LRA.VolumeI.Set.Operations.Public
import LRA.VolumeI.Set.ZFC.Derived

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Set.Operations

/-- Public operation roll-up for a ZFC-style backend. -/
def publicOperations (native : NativeSetOperations) : PublicSetOperations where
  SetObject := native.SetObject
  Element := native.SetObject
  member := native.member
  empty := native.empty
  singleton := native.singleton
  pair := native.pair
  union := native.union
  intersection := native.intersection
  subset := native.subset

/-- Native ZFC laws imply the public laws for implemented derived operations.

The intersection law is left as an obligation until separation/intersection is
added to the ZFC scaffold.
-/
theorem publicOperationLaws
    (native : NativeSetOperations)
    (nativeLaws : NativeSetOperationLaws native) :
    PublicSetOperationLaws (publicOperations native) := by
  sorry

end LRA.VolumeI.Set.ZFC
