import LRA.Set.Constructions.TGSet.Instances
import LRA.Set.Interface.Laws.Membership
import LRA.Set.Interface.Laws.Indexed
import LRA.Set.Interface.Laws.Families

namespace LRA.Set.Constructions.TGSet

/--
`SubsetIffAllMembers` TODO

Predicate logic:

  forall A B : Set, A ⊆ B <-> forall x : Set, x ∈ A -> x ∈ B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.TGSet.Set), LRA.Set.Constructions.TGSet.instHasSubset.1 A B ↔ ∀ (x : LRA.Set.Constructions.TGSet.Set), LRA.Set.instMembershipTGSet.1 A x → LRA.Set.instMembershipTGSet.1 B x

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
  SetExtensionality := fun {A B} h => LRA.Set.Constructions.TGSet.SetExtensionality A B h

instance : MembershipLaws Set Set where
  EmptyMembership := LRA.Set.Constructions.TGSet.TheEmptySetIsEmpty
  UnionMembership := LRA.Set.Constructions.TGSet.TheUnionMembership
  IntersectionMembership := LRA.Set.Constructions.TGSet.TheIntersectionMembership
  DifferenceMembership := LRA.Set.Constructions.TGSet.TheRelativeComplementMembership
  SubsetIffAllMembers := SubsetIffAllMembers

instance : SeparationLaws Set Set where
  SeparationMembership := LRA.Set.Constructions.TGSet.TheSeparatedSubsetIsSeparatedSubset

instance : SymmDiffMembershipLaws Set Set where
  SymmetricDifferenceMembership := LRA.Set.Constructions.TGSet.TheSymmetricDifferenceMembership

instance : PowersetMembershipLaws Set Set where
  PowersetMembership := LRA.Set.Constructions.TGSet.ThePowerSetIsPowerSetOf

instance : CollectionMembershipLaws Set Set Set where
  CollectionUnionMembership := fun C x => LRA.Set.Constructions.TGSet.TheUnionOverIsUnionOf C x
  CollectionIntersectionMembership := fun C x h =>
    LRA.Set.Constructions.TGSet.TheIntersectionOverMembership C x h

end LRA.Set.Constructions.TGSet

