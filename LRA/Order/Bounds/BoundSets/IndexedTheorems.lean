import LRA.Order.Bounds.BoundSets.Theorems
import LRA.Set.Interface.Indexed

namespace LRA.Order

open LRA.Set

universe u v w

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

/-- The upper bounds of an indexed union are the indexed intersection of the upper-bound sets. -/
theorem UpperBoundsOfIndexedUnion
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    UpperBounds relation (HasIndexedUnion.indexedUnion family) =
      HasIndexedIntersection.indexedIntersection
        (fun index => UpperBounds relation (family index)) := by
  sorry

/-- The lower bounds of an indexed union are the indexed intersection of the lower-bound sets. -/
theorem LowerBoundsOfIndexedUnion
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    LowerBounds relation (HasIndexedUnion.indexedUnion family) =
      HasIndexedIntersection.indexedIntersection
        (fun index => LowerBounds relation (family index)) := by
  sorry

/-- The indexed union of upper-bound sets is contained in the upper bounds of the indexed intersection. -/
theorem IndexedUnionOfUpperBoundsContainedInUpperBoundsOfIntersection
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    HasIndexedUnion.indexedUnion
        (fun index => UpperBounds relation (family index)) ⊆
      UpperBounds relation
        (HasIndexedIntersection.indexedIntersection family) := by
  sorry

/-- The indexed union of lower-bound sets is contained in the lower bounds of the indexed intersection. -/
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
