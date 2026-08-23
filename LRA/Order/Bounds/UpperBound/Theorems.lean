import LRA.Order.Bounds.UpperBound.Definition
import LRA.Set.Interface.Indexed
import LRA.Set.Interface.Membership

namespace LRA.Order

open scoped LRA.Set

universe u v w

                                                                                 
theorem UpperBoundOfEmpty
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (bound : Element) :
    UpperBound relation (∅ : SetObject) bound := by
  sorry

                                                                         
theorem UpperBoundOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject} {bound : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (boundIsUpperForLarger : UpperBound relation larger bound) :
    UpperBound relation smaller bound := by
  sorry

                                                                          
theorem UpperBoundOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsUpperForLeft : UpperBound relation leftSubset bound)
    (boundIsUpperForRight : UpperBound relation rightSubset bound) :
    UpperBound relation (leftSubset ∪ rightSubset) bound := by
  sorry

                                                                                     
theorem UpperBoundOfUnionIff
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element} :
    UpperBound relation (leftSubset ∪ rightSubset) bound ↔
      UpperBound relation leftSubset bound /\
        UpperBound relation rightSubset bound := by
  sorry

                                                                            
theorem UpperBoundOfIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsUpperForEither :
      UpperBound relation leftSubset bound \/
        UpperBound relation rightSubset bound) :
    UpperBound relation (leftSubset ∩ rightSubset) bound := by
  sorry

                                                                              
theorem UpperBoundOfDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {bound : Element}
    (boundIsUpperForSubset : UpperBound relation subset bound) :
    UpperBound relation (subset \ removed) bound := by
  sorry

                                                                          
theorem UpperBoundOfSymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {bound : Element}
    (boundIsUpperForLeft : UpperBound relation leftSubset bound)
    (boundIsUpperForRight : UpperBound relation rightSubset bound) :
    UpperBound relation (leftSubset ∆ rightSubset) bound := by
  sorry

                                                                                 
theorem UpperBoundOfIndexedUnionIff
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {family : Index -> SetObject} {bound : Element} :
    UpperBound relation (LRA.Set.HasIndexedUnion.indexedUnion family) bound ↔
      forall index, UpperBound relation (family index) bound := by
  sorry

                                                                                    
theorem UpperBoundOfIndexedIntersection
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {family : Index -> SetObject} (index : Index) {bound : Element}
    (boundIsUpperForMember : UpperBound relation (family index) bound) :
    UpperBound relation
      (LRA.Set.HasIndexedIntersection.indexedIntersection family) bound := by
  sorry

end LRA.Order
