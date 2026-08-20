import LRA.Set.NBGSet.Instances
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Indexed
import LRA.Set.Interface.Families

namespace LRA.Set.NBGSet

theorem SubsetIffAllMembers :
    forall A B : Set, A ⊆ B <-> forall x : Set, x ∈ A -> x ∈ B := by
  sorry

instance : ExtensionalityLaw Set Set where
  SetExtensionality := fun {A B} h => LRA.Set.NBG.SetExtensionality A B h

instance : MembershipLaws Set Set where
  EmptyMembership := LRA.Set.NBG.TheEmptySetIsEmpty
  UnionMembership := LRA.Set.NBG.TheUnionMembership
  IntersectionMembership := LRA.Set.NBG.TheIntersectionMembership
  DifferenceMembership := LRA.Set.NBG.TheRelativeComplementMembership
  SubsetIffAllMembers := SubsetIffAllMembers

instance : SeparationLaws Set Set where
  SeparationMembership := LRA.Set.NBG.TheSeparatedSubsetIsSeparatedSubset

instance : SymmDiffMembershipLaws Set Set where
  SymmetricDifferenceMembership := LRA.Set.NBG.TheSymmetricDifferenceMembership

instance : PowersetMembershipLaws Set Set where
  PowersetMembership := LRA.Set.NBG.ThePowerSetIsPowerSetOf

instance : CollectionMembershipLaws Set Set Set where
  CollectionUnionMembership := fun C x => LRA.Set.NBG.TheUnionOverIsUnionOf C x
  CollectionIntersectionMembership := fun C x h =>
    LRA.Set.NBG.TheIntersectionOverMembership C x h

end LRA.Set.NBGSet
