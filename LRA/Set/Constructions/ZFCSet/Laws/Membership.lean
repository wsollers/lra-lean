import LRA.Set.Constructions.ZFCSet.Instances
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Indexed
import LRA.Set.Interface.Families

namespace LRA.Set.Constructions.ZFCSet

/--
`SubsetIffAllMembers` TODO

Predicate logic:

  ∀ A B : Set, A ⊆ B ↔ ∀ x : Set, x ∈ A → x ∈ B

Predicate logic (unfolded):

  ∀ (A B : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.Constructions.ZFCSet.instHasSubset.1 A B ↔ ∀ (x : LRA.Set.Constructions.ZFCSet.Set), LRA.Set.instMembershipZFCSet.1 A x → LRA.Set.instMembershipZFCSet.1 B x

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
  SetExtensionality := fun {A B} h => LRA.Set.Constructions.ZFCSet.Axioms.SetExtensionality A B h

instance : MembershipLaws Set Set where
  EmptyMembership := LRA.Set.Constructions.ZFCSet.Axioms.TheEmptySetIsEmpty
  UnionMembership := LRA.Set.Constructions.ZFCSet.Axioms.TheUnionMembership
  IntersectionMembership := LRA.Set.Constructions.ZFCSet.Axioms.TheIntersectionMembership
  DifferenceMembership := LRA.Set.Constructions.ZFCSet.Axioms.TheRelativeComplementMembership
  SubsetIffAllMembers := SubsetIffAllMembers

instance : SeparationLaws Set Set where
  SeparationMembership := LRA.Set.Constructions.ZFCSet.Axioms.TheSeparatedSubsetIsSeparatedSubset

instance : SymmDiffMembershipLaws Set Set where
  SymmetricDifferenceMembership := LRA.Set.Constructions.ZFCSet.Axioms.TheSymmetricDifferenceMembership

instance : PowersetMembershipLaws Set Set where
  PowersetMembership := LRA.Set.Constructions.ZFCSet.Axioms.ThePowerSetIsPowerSetOf

instance : CollectionMembershipLaws Set Set Set where
  CollectionUnionMembership := fun C x => LRA.Set.Constructions.ZFCSet.Axioms.TheUnionOverIsUnionOf C x
  CollectionIntersectionMembership := fun C x h =>
    LRA.Set.Constructions.ZFCSet.Axioms.TheIntersectionOverMembership C x h

end LRA.Set.Constructions.ZFCSet
