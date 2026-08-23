import LRA.Set.ZFCSet.Instances
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Indexed
import LRA.Set.Interface.Families

namespace LRA.Set.ZFCSet

                                                                   

theorem SubsetIffAllMembers :
    ∀ A B : Set, A ⊆ B ↔ ∀ x : Set, x ∈ A → x ∈ B := by
  sorry

instance : ExtensionalityLaw Set Set where
  SetExtensionality := fun {A B} h => LRA.Set.ZFC.SetExtensionality A B h

instance : MembershipLaws Set Set where
  EmptyMembership := LRA.Set.ZFC.TheEmptySetIsEmpty
  UnionMembership := LRA.Set.ZFC.TheUnionMembership
  IntersectionMembership := LRA.Set.ZFC.TheIntersectionMembership
  DifferenceMembership := LRA.Set.ZFC.TheRelativeComplementMembership
  SubsetIffAllMembers := SubsetIffAllMembers

instance : SeparationLaws Set Set where
  SeparationMembership := LRA.Set.ZFC.TheSeparatedSubsetIsSeparatedSubset

instance : SymmDiffMembershipLaws Set Set where
  SymmetricDifferenceMembership := LRA.Set.ZFC.TheSymmetricDifferenceMembership

instance : PowersetMembershipLaws Set Set where
  PowersetMembership := LRA.Set.ZFC.ThePowerSetIsPowerSetOf

instance : CollectionMembershipLaws Set Set Set where
  CollectionUnionMembership := fun C x => LRA.Set.ZFC.TheUnionOverIsUnionOf C x
  CollectionIntersectionMembership := fun C x h =>
    LRA.Set.ZFC.TheIntersectionOverMembership C x h

end LRA.Set.ZFCSet
