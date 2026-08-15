import LRA.VolumeI.Order.Bounds.BoundSets.Definition
import LRA.VolumeI.Set.Interface.Indexed
import LRA.VolumeI.Set.Interface.Subset

namespace LRA.Order

open LRA.Set

universe u v w

section GenericBoundSets

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSeparation Element SetObject]
variable [HasUniversal SetObject] [HasComplement SetObject]
variable [MembershipLaws Element SetObject]
variable [SeparationLaws Element SetObject]
variable [UniversalMembershipLaws Element SetObject]
variable [ExtensionalityLaw Element SetObject]
variable [SubsetLaws SetObject]

/--
`UpperBoundsMembership`

Statement: Membership in the represented upper-bound set is exactly the
upper-bound predicate.

Logical form: `bound ∈ UpperBounds relation subset ↔ UpperBound relation subset bound`.
-/
theorem UpperBoundsMembership
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (bound : Element) :
    bound ∈ UpperBounds relation subset ↔
      UpperBound relation subset bound := by
  sorry

/--
`LowerBoundsMembership`

Statement: Membership in the represented lower-bound set is exactly the
lower-bound predicate.

Logical form: `bound ∈ LowerBounds relation subset ↔ LowerBound relation subset bound`.
-/
theorem LowerBoundsMembership
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (bound : Element) :
    bound ∈ LowerBounds relation subset ↔
      LowerBound relation subset bound := by
  sorry

/--
`UpperBoundsAntitoneUnderInclusion`

Statement: Enlarging a represented subset can only shrink its set of upper
bounds.

Logical form: `smaller ⊆ larger → UpperBounds relation larger ⊆ UpperBounds relation smaller`.
-/
theorem UpperBoundsAntitoneUnderInclusion
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : smaller ⊆ larger) :
    UpperBounds relation larger ⊆ UpperBounds relation smaller := by
  sorry

/--
`LowerBoundsAntitoneUnderInclusion`

Statement: Enlarging a represented subset can only shrink its set of lower
bounds.

Logical form: `smaller ⊆ larger → LowerBounds relation larger ⊆ LowerBounds relation smaller`.
-/
theorem LowerBoundsAntitoneUnderInclusion
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : smaller ⊆ larger) :
    LowerBounds relation larger ⊆ LowerBounds relation smaller := by
  sorry

/--
`UpperBoundsOfEmpty`

Statement: Every element vacuously bounds the empty represented subset above.

Logical form: `UpperBounds relation ∅ = 𝒰`.
-/
theorem UpperBoundsOfEmpty
    (relation : LRA.Relation.Endorelation Element) :
    UpperBounds relation (∅ : SetObject) =
      (HasUniversal.universal : SetObject) := by
  sorry

/--
`LowerBoundsOfEmpty`

Statement: Every element vacuously bounds the empty represented subset below.

Logical form: `LowerBounds relation ∅ = 𝒰`.
-/
theorem LowerBoundsOfEmpty
    (relation : LRA.Relation.Endorelation Element) :
    LowerBounds relation (∅ : SetObject) =
      (HasUniversal.universal : SetObject) := by
  sorry

end GenericBoundSets

section IndexedBoundSets

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [Union SetObject] [Inter SetObject] [SDiff SetObject]
variable [EmptyCollection SetObject] [HasSubset SetObject]
variable [HasSeparation Element SetObject]
variable [HasUniversal SetObject] [HasComplement SetObject]
variable [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
variable [MembershipLaws Element SetObject]
variable [SeparationLaws Element SetObject]
variable [UniversalMembershipLaws Element SetObject]
variable [IndexedMembershipLaws Element SetObject]
variable [ExtensionalityLaw Element SetObject]
variable [SubsetLaws SetObject]

/--
`UpperBoundsOfIndexedUnion`

Statement: The upper bounds of an indexed union are the indexed intersection
of the upper-bound sets of its members.

Logical form: `U (⋃ i, family i) = ⋂ i, U (family i)`.
-/
theorem UpperBoundsOfIndexedUnion
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    UpperBounds relation (HasIndexedUnion.indexedUnion family) =
      HasIndexedIntersection.indexedIntersection
        (fun index => UpperBounds relation (family index)) := by
  sorry

/--
`LowerBoundsOfIndexedUnion`

Statement: The lower bounds of an indexed union are the indexed intersection
of the lower-bound sets of its members.

Logical form: `L (⋃ i, family i) = ⋂ i, L (family i)`.
-/
theorem LowerBoundsOfIndexedUnion
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    LowerBounds relation (HasIndexedUnion.indexedUnion family) =
      HasIndexedIntersection.indexedIntersection
        (fun index => LowerBounds relation (family index)) := by
  sorry

/--
`IndexedUnionOfUpperBoundsContainedInUpperBoundsOfIntersection`

Statement: Every bound that bounds at least one member of a family above also
bounds the indexed intersection above.

Logical form: `(⋃ i, U (family i)) ⊆ U (⋂ i, family i)`.
-/
theorem IndexedUnionOfUpperBoundsContainedInUpperBoundsOfIntersection
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    HasIndexedUnion.indexedUnion
        (fun index => UpperBounds relation (family index)) ⊆
      UpperBounds relation
        (HasIndexedIntersection.indexedIntersection family) := by
  sorry

/--
`IndexedUnionOfLowerBoundsContainedInLowerBoundsOfIntersection`

Statement: Every bound that bounds at least one member of a family below also
bounds the indexed intersection below.

Logical form: `(⋃ i, L (family i)) ⊆ L (⋂ i, family i)`.
-/
theorem IndexedUnionOfLowerBoundsContainedInLowerBoundsOfIntersection
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    HasIndexedUnion.indexedUnion
        (fun index => LowerBounds relation (family index)) ⊆
      LowerBounds relation
        (HasIndexedIntersection.indexedIntersection family) := by
  sorry

end IndexedBoundSets

end LRA.Order
