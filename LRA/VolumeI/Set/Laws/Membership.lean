import LRA.VolumeI.Set.Operations.Native

universe u v

namespace LRA.VolumeI.Set

/-!
Derived operation readings over the generic set interface.

The operation objects are supplied by the interface; this file records the
public memberwise readings that make them usable without mentioning a backend.
-/

/-- Membership in a binary union. -/
theorem UnionMembership
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface) :
    ∀ element left right,
      interface.member element (Union interface left right) ↔
        interface.member element left ∨ interface.member element right := by
  sorry

/-- Membership in a binary intersection. -/
theorem IntersectionMembership
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface) :
    ∀ element left right,
      interface.member element (Intersection interface left right) ↔
        interface.member element left ∧ interface.member element right := by
  sorry

/-- Subset is memberwise implication. -/
theorem SubsetMembership
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface) :
    ∀ left right,
      Subset interface left right ↔
        ∀ element, interface.member element left → interface.member element right := by
  sorry

end LRA.VolumeI.Set
