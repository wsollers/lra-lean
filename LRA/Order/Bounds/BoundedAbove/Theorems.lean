import LRA.Order.Bounds.BoundedAbove.Definition
import LRA.Order.Bounds.UpperBound.Theorems
import LRA.Set.Interface.Membership
import LRA.Relation.Properties.Definition

namespace LRA.Order

open scoped LRA.Set

universe u v

                                                                               
theorem BoundedAboveOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (largerIsBoundedAbove : BoundedAbove relation larger) :
    BoundedAbove relation smaller := by
  sorry

                                                                                          
theorem UnionBoundedAboveIffPiecesBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (relationIsTotal : LRA.Relation.Total relation)
    (leftSubset rightSubset : SetObject) :
    BoundedAbove relation (leftSubset ∪ rightSubset) ↔
      BoundedAbove relation leftSubset /\
        BoundedAbove relation rightSubset := by
  sorry

                                                                       
theorem IntersectionBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (eitherIsBoundedAbove :
      BoundedAbove relation leftSubset \/
        BoundedAbove relation rightSubset) :
    BoundedAbove relation (leftSubset ∩ rightSubset) := by
  sorry

                                                                              
theorem DifferenceBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (subset removed : SetObject)
    (subsetIsBoundedAbove : BoundedAbove relation subset) :
    BoundedAbove relation (subset \ removed) := by
  sorry

                                                                      
theorem SymmetricDifferenceBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (leftIsBoundedAbove : BoundedAbove relation leftSubset)
    (rightIsBoundedAbove : BoundedAbove relation rightSubset) :
    BoundedAbove relation (leftSubset ∆ rightSubset) := by
  sorry

end LRA.Order
