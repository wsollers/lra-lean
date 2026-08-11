import LRA.VolumeI.Set.LRASet.Instances
import LRA.VolumeI.Set.Interface.Membership
import LRA.VolumeI.Set.Interface.Indexed
import LRA.VolumeI.Set.Interface.Families

namespace LRA.VolumeI.Set.LRASet

universe u

variable {Alpha : Type u}

/-!
Membership-law certificates for predicate sets. As in
`Enderton/Laws/Membership.lean`, the certificate fields delegate directly
to the chapter's own membership theorems in `Operations.lean` wherever the
shapes coincide definitionally; only the restatements below needed a fresh
theorem. This backend registers every membership certificate, including
`UniversalMembershipLaws` -- the one Enderton can never have.
-/

/--
`NotMemberOfEmpty` states not member of empty.

Logical form:

```lean
theorem NotMemberOfEmpty : ∀ x : Alpha, x ∉ (∅ : LRASet Alpha)
```
-/
theorem NotMemberOfEmpty : ∀ x : Alpha, x ∉ (∅ : LRASet Alpha) := by
  sorry

/-- Registration: extensionality, straight from `LRASetExtensionality`. -/
instance : ExtensionalityLaw Alpha (LRASet Alpha) where
  SetExtensionality := LRASetExtensionality

/-- Registration: membership readings for the core operations. Pure
delegation to `Operations.lean`'s membership theorems. -/
instance : MembershipLaws Alpha (LRASet Alpha) where
  EmptyMembership := NotMemberOfEmpty
  UnionMembership := UnionMembership
  IntersectionMembership := IntersectionMembership
  DifferenceMembership := DifferenceMembership
  SubsetIffAllMembers := SubsetIff

/-- Registration: membership reading for separation. -/
instance : SeparationLaws Alpha (LRASet Alpha) where
  SeparationMembership := SeparationMembership

/-- Registration: membership readings for the universal set and absolute
complement -- the certificate only this backend can supply. -/
instance : UniversalMembershipLaws Alpha (LRASet Alpha) where
  UniversalMembership := UniversalMembership
  ComplementMembership := ComplementMembership

/-- Registration: membership reading for symmetric difference. -/
instance : SymmDiffMembershipLaws Alpha (LRASet Alpha) where
  SymmetricDifferenceMembership := SymmetricDifferenceMembership

/-- Registration: membership reading for the power set. -/
instance : PowersetMembershipLaws (LRASet Alpha) (LRASet (LRASet Alpha)) where
  PowersetMembership := PowerSetMembership

/-- Registration: indexed union/intersection membership readings. Pure
delegation to `Operations.lean`'s membership theorems. -/
instance : IndexedMembershipLaws Alpha (LRASet Alpha) where
  IndexedUnionMembership := fun family x => IndexedUnionMembership family x
  IndexedIntersectionMembership := fun family x =>
    IndexedIntersectionMembership family x

/-- Registration: countable readings, as `Nat`-instantiated indexed ones. -/
instance : CountableMembershipLaws Alpha (LRASet Alpha) where
  CountableUnionMembership := fun family x => IndexedUnionMembership family x
  CountableIntersectionMembership := fun family x =>
    IndexedIntersectionMembership family x

/-- Registration: collection union/intersection membership readings. The
intersection field discards the nonemptiness hypothesis -- predicate sets
satisfy the unconditional law. -/
instance : CollectionMembershipLaws Alpha (LRASet Alpha) (LRASet (LRASet Alpha)) where
  CollectionUnionMembership := fun C x => CollectionUnionMembership C x
  CollectionIntersectionMembership := fun C x _ =>
    CollectionIntersectionMembership C x

end LRA.VolumeI.Set.LRASet
