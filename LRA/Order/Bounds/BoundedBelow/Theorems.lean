import LRA.Order.Bounds.BoundedBelow.Definition
import LRA.Order.Bounds.LowerBound.Theorems
import LRA.Set.Interface.Membership
import LRA.Relation.Properties.Definition

namespace LRA.Order

open scoped LRA.Set

universe u v

                                                                               
theorem BoundedBelowOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (largerIsBoundedBelow : BoundedBelow relation larger) :
    BoundedBelow relation smaller := by
  sorry

                                                                                          
theorem UnionBoundedBelowIffPiecesBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (relationIsTotal : LRA.Relation.Total relation)
    (leftSubset rightSubset : SetObject) :
    BoundedBelow relation (leftSubset ∪ rightSubset) ↔
      BoundedBelow relation leftSubset /\
        BoundedBelow relation rightSubset := by
  sorry

                                                                       
theorem IntersectionBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (eitherIsBoundedBelow :
      BoundedBelow relation leftSubset \/
        BoundedBelow relation rightSubset) :
    BoundedBelow relation (leftSubset ∩ rightSubset) := by
  sorry

                                                                              
theorem DifferenceBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (subset removed : SetObject)
    (subsetIsBoundedBelow : BoundedBelow relation subset) :
    BoundedBelow relation (subset \ removed) := by
  sorry

                                                                      
theorem SymmetricDifferenceBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (leftIsBoundedBelow : BoundedBelow relation leftSubset)
    (rightIsBoundedBelow : BoundedBelow relation rightSubset) :
    BoundedBelow relation (leftSubset ∆ rightSubset) := by
  sorry

end LRA.Order
