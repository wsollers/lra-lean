import LRA.Order.Bounds.Bounded.Definition
import LRA.Order.Bounds.BoundedAbove.Theorems
import LRA.Order.Bounds.BoundedBelow.Theorems

namespace LRA.Order

open scoped LRA.Set

universe u v

                                                                   
theorem BoundedOfSubcollection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (largerIsBounded : Bounded relation larger) :
    Bounded relation smaller := by
  sorry

                                                                                    
theorem UnionBoundedIffPiecesBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (relationIsTotal : LRA.Relation.Total relation)
    (leftSubset rightSubset : SetObject) :
    Bounded relation (leftSubset ∪ rightSubset) ↔
      Bounded relation leftSubset /\ Bounded relation rightSubset := by
  sorry

                                                                         
theorem IntersectionBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (eitherIsBounded :
      Bounded relation leftSubset \/ Bounded relation rightSubset) :
    Bounded relation (leftSubset ∩ rightSubset) := by
  sorry

                                                                        
theorem DifferenceBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (subset removed : SetObject)
    (subsetIsBounded : Bounded relation subset) :
    Bounded relation (subset \ removed) := by
  sorry

                                                                        
theorem SymmetricDifferenceBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (leftSubset rightSubset : SetObject)
    (leftIsBounded : Bounded relation leftSubset)
    (rightIsBounded : Bounded relation rightSubset) :
    Bounded relation (leftSubset ∆ rightSubset) := by
  sorry

end LRA.Order
