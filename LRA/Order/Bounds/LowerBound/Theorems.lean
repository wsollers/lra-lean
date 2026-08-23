import LRA.Order.Bounds.LowerBound.Definition
import LRA.Set.Interface.Indexed
import LRA.Set.Interface.Membership

namespace LRA.Order

open scoped LRA.Set

universe u v w

                                                                                
theorem LowerBoundOfEmpty
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (bound : Element) :
    LowerBound relation (∅ : SetObject) bound := by
  sorry

                                                                               
theorem LowerBoundOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject} {bound : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (boundIsLowerForLarger : LowerBound relation larger bound) :
    LowerBound relation smaller bound := by
  sorry

                                                                          
theorem LowerBoundOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsLowerForLeft : LowerBound relation leftSubset bound)
    (boundIsLowerForRight : LowerBound relation rightSubset bound) :
    LowerBound relation (leftSubset ∪ rightSubset) bound := by
  sorry

                                                               
theorem LowerBoundOfUnionIff
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element} :
    LowerBound relation (leftSubset ∪ rightSubset) bound ↔
      LowerBound relation leftSubset bound /\
        LowerBound relation rightSubset bound := by
  sorry

                                                                          
theorem LowerBoundOfIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsLowerForEither :
      LowerBound relation leftSubset bound \/
        LowerBound relation rightSubset bound) :
    LowerBound relation (leftSubset ∩ rightSubset) bound := by
  sorry

                                                                              
theorem LowerBoundOfDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {bound : Element}
    (boundIsLowerForSubset : LowerBound relation subset bound) :
    LowerBound relation (subset \ removed) bound := by
  sorry

                                                                          
theorem LowerBoundOfSymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsLowerForLeft : LowerBound relation leftSubset bound)
    (boundIsLowerForRight : LowerBound relation rightSubset bound) :
    LowerBound relation (leftSubset ∆ rightSubset) bound := by
  sorry

                                                                                 
theorem LowerBoundOfIndexedUnionIff
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {family : Index -> SetObject} {bound : Element} :
    LowerBound relation (LRA.Set.HasIndexedUnion.indexedUnion family) bound ↔
      forall index, LowerBound relation (family index) bound := by
  sorry

                                                                                   
theorem LowerBoundOfIndexedIntersection
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {family : Index -> SetObject} (index : Index) {bound : Element}
    (boundIsLowerForMember : LowerBound relation (family index) bound) :
    LowerBound relation
      (LRA.Set.HasIndexedIntersection.indexedIntersection family) bound := by
  sorry

end LRA.Order
