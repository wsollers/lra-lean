import LRA.Set.TGSet.Instances
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Indexed
import LRA.Set.Interface.Families

namespace LRA.Set.TGSet

/-! Membership-law certificates for the concrete TGSet backend. -/

theorem SubsetIffAllMembers :
    forall A B : Set, A ⊆ B <-> forall x : Set, x ∈ A -> x ∈ B := by
  sorry

instance : ExtensionalityLaw Set Set where
  SetExtensionality := fun {A B} h => LRA.Set.TG.SetExtensionality A B h

instance : MembershipLaws Set Set where
  EmptyMembership := LRA.Set.TG.TheEmptySetIsEmpty
  UnionMembership := LRA.Set.TG.TheUnionMembership
  IntersectionMembership := LRA.Set.TG.TheIntersectionMembership
  DifferenceMembership := LRA.Set.TG.TheRelativeComplementMembership
  SubsetIffAllMembers := SubsetIffAllMembers

instance : SeparationLaws Set Set where
  SeparationMembership := LRA.Set.TG.TheSeparatedSubsetIsSeparatedSubset

instance : SymmDiffMembershipLaws Set Set where
  SymmetricDifferenceMembership := LRA.Set.TG.TheSymmetricDifferenceMembership

instance : PowersetMembershipLaws Set Set where
  PowersetMembership := LRA.Set.TG.ThePowerSetIsPowerSetOf

instance : CollectionMembershipLaws Set Set Set where
  CollectionUnionMembership := fun C x => LRA.Set.TG.TheUnionOverIsUnionOf C x
  CollectionIntersectionMembership := fun C x h =>
    LRA.Set.TG.TheIntersectionOverMembership C x h

end LRA.Set.TGSet
