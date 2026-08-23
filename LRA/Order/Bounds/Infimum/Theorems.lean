import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.LeastElement.Definition
import LRA.Relation.Properties.Definition
import LRA.Relation.Operations.Converse.Definition
import LRA.Order.Lattices.Meet.Definition
import LRA.Order.Relation.Dominated.Definition
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Indexed

namespace LRA.Order

universe u v

                                            
theorem InfimumUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsInfimum : Infimum relation subset first)
    (secondIsInfimum : Infimum relation subset second) :
    first = second := by
  sorry

                                                                                      
theorem InfimumOfSingleton
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [Singleton Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    (element : Element)
    (singletonMembership :
      forall candidate,
        candidate ∈ ({element} : SetObject) ↔ candidate = element) :
    Infimum relation ({element} : SetObject) element := by
  sorry

                                                             
theorem InfimumIsLowerBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {infimum : Element}
    (infimumIsInfimum : Infimum relation subset infimum) :
    LowerBound relation subset infimum := by
  sorry

                                                                        
theorem EveryLowerBoundRelatedToInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {infimum bound : Element}
    (infimumIsInfimum : Infimum relation subset infimum)
    (boundIsLowerBound : LowerBound relation subset bound) :
    relation bound infimum := by
  sorry

                                                                              
theorem LowerBoundIffRelatedToInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {subset : SetObject} {infimum bound : Element}
    (infimumIsInfimum : Infimum relation subset infimum) :
    LowerBound relation subset bound ↔ relation bound infimum := by
  sorry

                                                                  
theorem InfimumMonotoneUnderInclusion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {smaller larger : SetObject} {smallerInfimum largerInfimum : Element}
    (smallerIsContained : forall element, element ∈ smaller -> element ∈ larger)
    (smallerInfimumIsInfimum : Infimum relation smaller smallerInfimum)
    (largerInfimumIsInfimum : Infimum relation larger largerInfimum) :
    relation largerInfimum smallerInfimum := by
  sorry

                                                                                    

                                                                    
                                                                 
                                                                  
                                                                       
theorem InfimaCompareUnderPointwiseDomination
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftInfimum rightInfimum : Element}
    (leftDominatedByRightUnderConverse :
      Dominated (LRA.Relation.Converse relation) leftSubset rightSubset)
    (leftInfimumIsInfimum : Infimum relation leftSubset leftInfimum)
    (rightInfimumIsInfimum : Infimum relation rightSubset rightInfimum) :
    relation rightInfimum leftInfimum := by
  sorry

                                                                  
theorem InfimumInSubsetIsLeastElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {infimum : Element}
    (infimumIsInfimum : Infimum relation subset infimum)
    (infimumBelongs : infimum ∈ subset) :
    LeastElement relation subset infimum := by
  sorry

open scoped LRA.Set



                                                                     
theorem InfimumOfUnion
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {leftSubset rightSubset : SetObject}
    {leftInfimum rightInfimum unionInfimum : Element}
    (leftInfimumIsInfimum : Infimum relation leftSubset leftInfimum)
    (rightInfimumIsInfimum : Infimum relation rightSubset rightInfimum)
    (unionInfimumIsMeet : Meet relation leftInfimum rightInfimum unionInfimum) :
    Infimum relation (leftSubset ∪ rightSubset) unionInfimum := by
  sorry

                                                                                           
theorem ContainingInfimumRelatedToInfimumOfIntersection
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {containingSubset otherSubset : SetObject}
    {intersectionInfimum containingInfimum : Element}
    (intersectionIsInfimum : Infimum relation (containingSubset ∩ otherSubset) intersectionInfimum)
    (containingIsInfimum : Infimum relation containingSubset containingInfimum) :
    relation containingInfimum intersectionInfimum := by
  sorry

                                                                             
theorem ContainingInfimumRelatedToInfimumOfDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset removed : SetObject} {differenceInfimum subsetInfimum : Element}
    (differenceIsInfimum : Infimum relation (subset \ removed) differenceInfimum)
    (subsetIsInfimum : Infimum relation subset subsetInfimum) :
    relation subsetInfimum differenceInfimum := by
  sorry

                                                                               
theorem UnionInfimumRelatedToInfimumOfSymmetricDifference
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [LRA.Set.HasSymmDiff SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    [LRA.Set.SymmDiffMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {leftSubset rightSubset : SetObject}
    {differenceInfimum unionInfimum : Element}
    (differenceIsInfimum : Infimum relation (leftSubset ∆ rightSubset) differenceInfimum)
    (unionIsInfimum : Infimum relation (leftSubset ∪ rightSubset) unionInfimum) :
    relation unionInfimum differenceInfimum := by
  sorry

                                                                                                                                  
theorem InfimumOfIndexedUnion
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [LRA.Set.HasIndexedUnion SetObject]
    [LRA.Set.HasIndexedIntersection SetObject]
    [LRA.Set.IndexedMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    (family : Index -> SetObject) (memberInfimum : Index -> Element)
    (familyInfimum : Element)
    (eachIsInfimum : forall index, Infimum relation (family index) (memberInfimum index))
    (familyInfimumBoundsMembers : forall index, relation familyInfimum (memberInfimum index))
    (familyInfimumIsGreatest : forall bound,
      (forall index, relation bound (memberInfimum index)) -> relation bound familyInfimum) :
    Infimum relation (LRA.Set.HasIndexedUnion.indexedUnion family) familyInfimum := by
  sorry

end LRA.Order
