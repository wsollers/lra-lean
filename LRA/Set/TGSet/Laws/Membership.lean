import LRA.Set.TGSet.Instances
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Indexed
import LRA.Set.Interface.Families

namespace LRA.Set.TGSet

/--
`SubsetIffAllMembers` TODO

Predicate logic:

  forall A B : Set, A ⊆ B <-> forall x : Set, x ∈ A -> x ∈ B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.TGSet.Set), LRA.Set.TGSet.instHasSubset.1 A B ↔ ∀ (x : LRA.Set.TGSet.Set), LRA.Set.instMembershipTGSet.1 A x → LRA.Set.instMembershipTGSet.1 B x

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
