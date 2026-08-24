import LRA.Set.ZFCSet.Instances
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Indexed
import LRA.Set.Interface.Families

namespace LRA.Set.ZFCSet

/--
`SubsetIffAllMembers` TODO

Predicate logic:

  ∀ A B : Set, A ⊆ B ↔ ∀ x : Set, x ∈ A → x ∈ B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.ZFCSet.Set), LRA.Set.ZFCSet.instHasSubset.1 A B ↔ ∀ (x : LRA.Set.ZFCSet.Set), LRA.Set.instMembershipZFCSet.1 A x → LRA.Set.instMembershipZFCSet.1 B x

Logical form (Lean):

```lean
theorem SubsetIffAllMembers :
    ∀ A B : Set, A ⊆ B ↔ ∀ x : Set, x ∈ A → x ∈ B
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
