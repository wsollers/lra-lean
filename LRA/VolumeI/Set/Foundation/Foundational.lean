import LRA.VolumeI.Set.Foundation.Existence
import LRA.VolumeI.Set.Foundation.Uniqueness

/-!
Compatibility aggregate for foundational existence and uniqueness statements.
-/

universe u v

namespace LRA.VolumeI.Set

/-- There exists a unique set object with no members.

Equivalently, there is an empty set object, and any two set objects with no
members are equal. -/
theorem EmptySetExistsAndIsUnique
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface) :
    (∃ empty : interface.SetObject,
      ∀ element, ¬ interface.member element empty) ∧
      (∀ left right : interface.SetObject,
        (∀ element, ¬ interface.member element left) →
        (∀ element, ¬ interface.member element right) →
        left = right) := by
  constructor
  · exact EmptySetExist interface laws
  · intro left right leftEmpty rightEmpty
    exact EmptySetUnique interface laws leftEmpty rightEmpty

end LRA.VolumeI.Set
