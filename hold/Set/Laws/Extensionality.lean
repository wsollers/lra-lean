import LRA.VolumeI.Set.Laws.Membership

universe u v

namespace LRA.VolumeI.Set.Generic

/-!
Extensionality principles for generic set interfaces.
-/

/-- Generic set extensionality. -/
theorem SetExtensionality
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    {left right : interface.SetObject}
    (sameMembers :
      ∀ element, interface.member element left ↔ interface.member element right) :
    left = right := by
  sorry

/-- Equality of generic sets is equivalent to having the same members. -/
theorem SetExtensionalityIff
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface)
    (left right : interface.SetObject) :
    left = right ↔
      ∀ element, interface.member element left ↔ interface.member element right := by
  sorry

end LRA.VolumeI.Set.Generic
