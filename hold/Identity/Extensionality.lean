import LRA.VolumeI.Identity.Axioms
import LRA.VolumeI.Set.Public.Interface

/-!
Contract home for extensional equality.
-/

namespace LRA.VolumeI.Identity

universe u

/-- Generic set extensionality, exposed from the identity layer. -/
theorem ExtensionalEqualityForGenericSets
    (interface : LRA.VolumeI.Set.SetInterface.{u, u})
    (laws : LRA.VolumeI.Set.SetInterfaceLaws interface)
    {Left Right : interface.SetObject}
    (SameMembers :
      ∀ Element,
        interface.member Element Left ↔ interface.member Element Right) :
    Left = Right :=
  laws.extensionality SameMembers

end LRA.VolumeI.Identity
