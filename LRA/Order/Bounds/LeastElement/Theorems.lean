import LRA.Order.Bounds.LeastElement.Definition
import LRA.Relation.Properties.Definition
import LRA.Set.Interface.Membership

namespace LRA.Order

universe u v

                                                 
theorem LeastElementUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsLeast : LeastElement relation subset first)
    (secondIsLeast : LeastElement relation subset second) :
    first = second := by
  sorry

open scoped LRA.Set



                                                                        
theorem LeastElementRetainedByIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset retainedBy : SetObject} {least : Element}
    (leastIsLeast : LeastElement relation subset least)
    (leastIsRetained : least ∈ retainedBy) :
    LeastElement relation (subset ∩ retainedBy) least := by
  sorry

                                                                              
theorem LeastElementRetainedByDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {least : Element}
    (leastIsLeast : LeastElement relation subset least)
    (leastIsNotRemoved : least ∉ removed) :
    LeastElement relation (subset \ removed) least := by
  sorry

                                                                                            
theorem LeastElementRetainedBySymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {least : Element}
    (leastIsLeastOfUnion : LeastElement relation (leftSubset ∪ rightSubset) least)
    (leastIsRetained : least ∈ (leftSubset ∆ rightSubset)) :
    LeastElement relation (leftSubset ∆ rightSubset) least := by
  sorry

                                                                                  
theorem LeastElementOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject} {least : Element}
    (leastIsLeastOfLeft : LeastElement relation leftSubset least)
    (leastBoundsRight : LowerBound relation rightSubset least) :
    LeastElement relation (leftSubset ∪ rightSubset) least := by
  sorry

end LRA.Order
