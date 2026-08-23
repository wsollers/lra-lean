import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.Bounds.GreatestElement.Definition
import LRA.Relation.Properties.Definition
import LRA.Order.Lattices.Join.Definition
import LRA.Order.Relation.Dominated.Definition
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Indexed

namespace LRA.Order

universe u v

                                            
theorem SupremumUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsSupremum : Supremum relation subset first)
    (secondIsSupremum : Supremum relation subset second) :
    first = second := by
  sorry

                                                                                      
theorem SupremumOfSingleton
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [Singleton Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (element : Element)
    (singletonMembership :
      forall candidate,
        candidate ∈ ({element} : SetObject) ↔ candidate = element) :
    Supremum relation ({element} : SetObject) element := by
  sorry

                                                              
theorem SupremumIsUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {supremum : Element}
    (supremumIsSupremum : Supremum relation subset supremum) :
    UpperBound relation subset supremum := by
  sorry

                                                                         
theorem SupremumRelatedToEveryUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {supremum bound : Element}
    (supremumIsSupremum : Supremum relation subset supremum)
    (boundIsUpperBound : UpperBound relation subset bound) :
    relation supremum bound := by
  sorry

                                                                              
theorem UpperBoundIffSupremumRelated
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {subset : SetObject} {supremum bound : Element}
    (supremumIsSupremum : Supremum relation subset supremum) :
    UpperBound relation subset bound ↔ relation supremum bound := by
  sorry

                                                                   
theorem SupremumMonotoneUnderInclusion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject} {smallerSupremum largerSupremum : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (smallerSupremumIsSupremum :
      Supremum relation smaller smallerSupremum)
    (largerSupremumIsSupremum :
      Supremum relation larger largerSupremum) :
    relation smallerSupremum largerSupremum := by
  sorry

                                                                                        
theorem SupremaCompareUnderPointwiseDomination
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftSupremum rightSupremum : Element}
    (leftDominatedByRight : Dominated relation leftSubset rightSubset)
    (leftSupremumIsSupremum :
      Supremum relation leftSubset leftSupremum)
    (rightSupremumIsSupremum :
      Supremum relation rightSubset rightSupremum) :
    relation leftSupremum rightSupremum := by
  sorry

                                                                     
theorem SupremumInSubsetIsGreatestElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {supremum : Element}
    (supremumIsSupremum : Supremum relation subset supremum)
    (supremumBelongs : supremum ∈ subset) :
    GreatestElement relation subset supremum := by
  sorry

open scoped LRA.Set



                                                                       
theorem SupremumOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftSupremum rightSupremum unionSupremum : Element}
    (leftSupremumIsSupremum : Supremum relation leftSubset leftSupremum)
    (rightSupremumIsSupremum : Supremum relation rightSubset rightSupremum)
    (unionSupremumIsJoin : Join relation leftSupremum rightSupremum unionSupremum) :
    Supremum relation (leftSubset ∪ rightSubset) unionSupremum := by
  sorry

                                                                                          
theorem SupremumOfIntersectionRelatedToContainingSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {containingSubset otherSubset : SetObject}
    {intersectionSupremum containingSupremum : Element}
    (intersectionIsSupremum : Supremum relation (containingSubset ∩ otherSubset) intersectionSupremum)
    (containingIsSupremum : Supremum relation containingSubset containingSupremum) :
    relation intersectionSupremum containingSupremum := by
  sorry

                                                                                       
theorem SupremumOfDifferenceRelatedToContainingSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {differenceSupremum subsetSupremum : Element}
    (differenceIsSupremum : Supremum relation (subset \ removed) differenceSupremum)
    (subsetIsSupremum : Supremum relation subset subsetSupremum) :
    relation differenceSupremum subsetSupremum := by
  sorry

                                                                                 
theorem SupremumOfSymmetricDifferenceRelatedToUnionSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject}
    {differenceSupremum unionSupremum : Element}
    (differenceIsSupremum : Supremum relation (leftSubset ∆ rightSubset) differenceSupremum)
    (unionIsSupremum : Supremum relation (leftSubset ∪ rightSubset) unionSupremum) :
    relation differenceSupremum unionSupremum := by
  sorry

                                                                                                                                 
theorem SupremumOfIndexedUnion
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (family : Index -> SetObject) (memberSupremum : Index -> Element)
    (familySupremum : Element)
    (eachIsSupremum : forall index, Supremum relation (family index) (memberSupremum index))
    (familySupremumBoundsMembers : forall index, relation (memberSupremum index) familySupremum)
    (familySupremumIsLeast : forall bound,
      (forall index, relation (memberSupremum index) bound) -> relation familySupremum bound) :
    Supremum relation (LRA.Set.HasIndexedUnion.indexedUnion family) familySupremum := by
  sorry

end LRA.Order
