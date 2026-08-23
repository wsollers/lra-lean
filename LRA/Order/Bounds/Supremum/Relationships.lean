import LRA.Relation.Operations.Converse.Definition
import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.Bounds.BoundSets.Definition
import LRA.Set.Interface.Membership
import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u v

                                                                            
theorem SupremumOfConverseIffInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Supremum (LRA.Relation.Converse relation) subset candidate ↔
      Infimum relation subset candidate := by
  sorry

                                                                                        
theorem SupremumOfEmptyIffBottom
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (candidate : Element) :
    Supremum relation (∅ : SetObject) candidate ↔
      forall element, relation candidate element := by
  sorry

                                                                                     
theorem SupremumIffInfimumOfUpperBounds
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSeparation Element SetObject]
    [LRA.Set.HasUniversal SetObject] [LRA.Set.HasComplement SetObject]
    [LRA.Set.SeparationLaws Element SetObject]
    [LRA.Set.UniversalMembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Supremum relation subset candidate ↔
      Infimum relation (UpperBounds relation subset) candidate := by
  sorry

                                                                                  
theorem InfimumRelatedToSupremumOfNonemptySubset
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsTransitive : LRA.Relation.Transitive relation)
    {subset : SetObject} {infimum supremum : Element}
    (subsetIsNonempty : exists element, element ∈ subset)
    (infimumIsInfimum : Infimum relation subset infimum)
    (supremumIsSupremum : Supremum relation subset supremum) :
    relation infimum supremum := by
  sorry

end LRA.Order
