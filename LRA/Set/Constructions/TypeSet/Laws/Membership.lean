import LRA.Set.Constructions.TypeSet.Instances
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Indexed
import LRA.Set.Interface.Families

namespace LRA.Set.Constructions.TypeSet

universe u

variable {Alpha : Type u}

/--
`NotMemberOfEmpty` TODO

Predicate logic:

  ∀ x : Alpha, x ∉ ∅ ∈ LRA.Set.Constructions.TypeSet Alpha

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (x : Alpha), LRA.Set.instMembershipTypeSet.1 LRA.Set.Constructions.TypeSet.instEmptyCollection.1 x → False

Logical form (Lean):

```lean
theorem NotMemberOfEmpty :
    ∀ x : Alpha, x ∉ (∅ : LRA.Set.Constructions.TypeSet Alpha)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem NotMemberOfEmpty :
    ∀ x : Alpha, x ∉ (∅ : LRA.Set.Constructions.TypeSet Alpha) := by
  sorry

instance : ExtensionalityLaw Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  SetExtensionality := LRA.Set.Constructions.TypeSetExtensionality

instance : MembershipLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  EmptyMembership := NotMemberOfEmpty
  UnionMembership := UnionMembership
  IntersectionMembership := IntersectionMembership
  DifferenceMembership := DifferenceMembership
  SubsetIffAllMembers := SubsetIff

instance : SeparationLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  SeparationMembership := SeparationMembership

instance : UniversalMembershipLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  UniversalMembership := UniversalMembership
  ComplementMembership := ComplementMembership

instance : SymmDiffMembershipLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  SymmetricDifferenceMembership := SymmetricDifferenceMembership

instance : PowersetMembershipLaws
    (LRA.Set.Constructions.TypeSet Alpha)
    (LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) where
  PowersetMembership := PowerSetMembership

instance : IndexedMembershipLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  IndexedUnionMembership := fun family x => IndexedUnionMembership family x
  IndexedIntersectionMembership := fun family x =>
    IndexedIntersectionMembership family x

instance : CountableMembershipLaws Alpha (LRA.Set.Constructions.TypeSet Alpha) where
  CountableUnionMembership := fun family x => IndexedUnionMembership family x
  CountableIntersectionMembership := fun family x =>
    IndexedIntersectionMembership family x

instance : CollectionMembershipLaws
    Alpha
    (LRA.Set.Constructions.TypeSet Alpha)
    (LRA.Set.Constructions.TypeSet (LRA.Set.Constructions.TypeSet Alpha)) where
  CollectionUnionMembership := fun C x => CollectionUnionMembership C x
  CollectionIntersectionMembership := fun C x _ =>
    CollectionIntersectionMembership C x

end LRA.Set.Constructions.TypeSet
