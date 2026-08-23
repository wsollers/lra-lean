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

                                                                                                 
theorem UpperBoundsOfIndexedUnion
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    UpperBounds relation (HasIndexedUnion.indexedUnion family) =
      HasIndexedIntersection.indexedIntersection
        (fun index => UpperBounds relation (family index)) := by
  sorry

                                                                                                 
theorem LowerBoundsOfIndexedUnion
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    LowerBounds relation (HasIndexedUnion.indexedUnion family) =
      HasIndexedIntersection.indexedIntersection
        (fun index => LowerBounds relation (family index)) := by
  sorry

                                                                                                          
theorem IndexedUnionOfUpperBoundsContainedInUpperBoundsOfIntersection
    {Index : Type w}
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) :
    HasIndexedUnion.indexedUnion
        (fun index => UpperBounds relation (family index)) ⊆
      UpperBounds relation
        (HasIndexedIntersection.indexedIntersection family) := by
  sorry

                                                                                                          
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
