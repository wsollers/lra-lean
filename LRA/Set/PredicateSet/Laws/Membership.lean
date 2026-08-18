import LRA.Set.PredicateSet.Instances
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Indexed
import LRA.Set.Interface.Families

namespace LRA.Set.PredicateSet

universe u

variable {Alpha : Type u}

theorem NotMemberOfEmpty :
    ∀ x : Alpha, x ∉ (∅ : LRA.Set.PredicateSet Alpha) := by
  sorry

instance : ExtensionalityLaw Alpha (LRA.Set.PredicateSet Alpha) where
  SetExtensionality := LRA.Set.PredicateSetExtensionality

instance : MembershipLaws Alpha (LRA.Set.PredicateSet Alpha) where
  EmptyMembership := NotMemberOfEmpty
  UnionMembership := UnionMembership
  IntersectionMembership := IntersectionMembership
  DifferenceMembership := DifferenceMembership
  SubsetIffAllMembers := SubsetIff

instance : SeparationLaws Alpha (LRA.Set.PredicateSet Alpha) where
  SeparationMembership := SeparationMembership

instance : UniversalMembershipLaws Alpha (LRA.Set.PredicateSet Alpha) where
  UniversalMembership := UniversalMembership
  ComplementMembership := ComplementMembership

instance : SymmDiffMembershipLaws Alpha (LRA.Set.PredicateSet Alpha) where
  SymmetricDifferenceMembership := SymmetricDifferenceMembership

instance : PowersetMembershipLaws
    (LRA.Set.PredicateSet Alpha)
    (LRA.Set.PredicateSet (LRA.Set.PredicateSet Alpha)) where
  PowersetMembership := PowerSetMembership

instance : IndexedMembershipLaws Alpha (LRA.Set.PredicateSet Alpha) where
  IndexedUnionMembership := fun family x => IndexedUnionMembership family x
  IndexedIntersectionMembership := fun family x =>
    IndexedIntersectionMembership family x

instance : CountableMembershipLaws Alpha (LRA.Set.PredicateSet Alpha) where
  CountableUnionMembership := fun family x => IndexedUnionMembership family x
  CountableIntersectionMembership := fun family x =>
    IndexedIntersectionMembership family x

instance : CollectionMembershipLaws
    Alpha
    (LRA.Set.PredicateSet Alpha)
    (LRA.Set.PredicateSet (LRA.Set.PredicateSet Alpha)) where
  CollectionUnionMembership := fun C x => CollectionUnionMembership C x
  CollectionIntersectionMembership := fun C x _ =>
    CollectionIntersectionMembership C x

end LRA.Set.PredicateSet
