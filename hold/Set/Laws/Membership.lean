import LRA.VolumeI.Set.Operations.Native

universe u v

namespace LRA.VolumeI.Set

/-!
Derived operation readings over the generic set interface.

The operation objects are supplied by the interface; this file records the
public memberwise readings that make them usable without mentioning a backend.
-/

/-- `x` belongs to `A ∪ B` iff `x` belongs to `A` or `x` belongs to `B`. -/
theorem UnionSetMembershipIff
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface) :
    ∀ element left right,
      interface.member element (Union interface left right) ↔
        interface.member element left ∨ interface.member element right :=
  laws.unionMembership

/-- `x` belongs to `A ∩ B` iff `x` belongs to `A` and `x` belongs to `B`. -/
theorem IntersectionSetMembershipIff
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface) :
    ∀ element left right,
      interface.member element (Intersection interface left right) ↔
        interface.member element left ∧ interface.member element right :=
  laws.intersectionMembership

/-- `A` is a subset of `B` iff every member of `A` is a member of `B`. -/
theorem SubsetMembershipIff
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface) :
    ∀ left right,
      Subset interface left right ↔
        ∀ element, interface.member element left → interface.member element right :=
  laws.subsetMembership

/-- `x` belongs to `A ∪ B` iff `x` belongs to `A` or `x` belongs to `B`. -/
theorem UnionMembership
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface) :
    ∀ element left right,
      interface.member element (Union interface left right) ↔
        interface.member element left ∨ interface.member element right :=
  UnionSetMembershipIff interface laws

/-- `x` belongs to `A ∩ B` iff `x` belongs to `A` and `x` belongs to `B`. -/
theorem IntersectionMembership
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface) :
    ∀ element left right,
      interface.member element (Intersection interface left right) ↔
        interface.member element left ∧ interface.member element right :=
  IntersectionSetMembershipIff interface laws

/-- `A` is a subset of `B` iff every member of `A` is a member of `B`. -/
theorem SubsetMembership
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface) :
    ∀ left right,
      Subset interface left right ↔
        ∀ element, interface.member element left → interface.member element right :=
  SubsetMembershipIff interface laws

end LRA.VolumeI.Set
