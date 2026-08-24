import LRA.Set.NBGSet.Instances
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Indexed
import LRA.Set.Interface.Families

namespace LRA.Set.NBGSet

/--
`SubsetIffAllMembers` TODO

Predicate logic:

  forall A B : Set, A ⊆ B <-> forall x : Set, x ∈ A -> x ∈ B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.NBGSet.Set), LRA.Set.NBGSet.instHasSubset.1 A B ↔ ∀ (x : LRA.Set.NBGSet.Set), LRA.Set.instMembershipNBGSet.1 A x → LRA.Set.instMembershipNBGSet.1 B x

Logical form (Lean):

```lean
theorem SubsetIffAllMembers :
    forall A B : Set, A ⊆ B <-> forall x : Set, x ∈ A -> x ∈ B
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
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
