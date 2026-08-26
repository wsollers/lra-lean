import LRA.Set.Constructions.NBGSet.Instances
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Indexed
import LRA.Set.Interface.Families

namespace LRA.Set.Constructions.NBGSet

/--
`SubsetIffAllMembers` TODO

Predicate logic:

  forall A B : Set, A ⊆ B <-> forall x : Set, x ∈ A -> x ∈ B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.NBGSet.Set), LRA.Set.Constructions.NBGSet.instHasSubset.1 A B ↔ ∀ (x : LRA.Set.Constructions.NBGSet.Set), LRA.Set.instMembershipNBGSet.1 A x → LRA.Set.instMembershipNBGSet.1 B x

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
  SetExtensionality := fun {A B} h => LRA.Set.Constructions.NBGSet.Axioms.SetExtensionality A B h

instance : MembershipLaws Set Set where
  EmptyMembership := LRA.Set.Constructions.NBGSet.Axioms.TheEmptySetIsEmpty
  UnionMembership := LRA.Set.Constructions.NBGSet.Axioms.TheUnionMembership
  IntersectionMembership := LRA.Set.Constructions.NBGSet.Axioms.TheIntersectionMembership
  DifferenceMembership := LRA.Set.Constructions.NBGSet.Axioms.TheRelativeComplementMembership
  SubsetIffAllMembers := SubsetIffAllMembers

instance : SeparationLaws Set Set where
  SeparationMembership := LRA.Set.Constructions.NBGSet.Axioms.TheSeparatedSubsetIsSeparatedSubset

instance : SymmDiffMembershipLaws Set Set where
  SymmetricDifferenceMembership := LRA.Set.Constructions.NBGSet.Axioms.TheSymmetricDifferenceMembership

instance : PowersetMembershipLaws Set Set where
  PowersetMembership := LRA.Set.Constructions.NBGSet.Axioms.ThePowerSetIsPowerSetOf

instance : CollectionMembershipLaws Set Set Set where
  CollectionUnionMembership := fun C x => LRA.Set.Constructions.NBGSet.Axioms.TheUnionOverIsUnionOf C x
  CollectionIntersectionMembership := fun C x h =>
    LRA.Set.Constructions.NBGSet.Axioms.TheIntersectionOverMembership C x h

end LRA.Set.Constructions.NBGSet
