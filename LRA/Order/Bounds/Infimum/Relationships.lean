import LRA.Relation.Operations.Converse.Definition
import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.Bounds.BoundSets.Definition
import LRA.Set.Interface.Membership

namespace LRA.Order

universe u v

                                                                            
theorem InfimumOfConverseIffSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Infimum (LRA.Relation.Converse relation) subset candidate ↔
      Supremum relation subset candidate := by
  sorry

                                                                                    
theorem InfimumOfEmptyIffTop
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [LRA.Set.MembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (candidate : Element) :
    Infimum relation (∅ : SetObject) candidate ↔
      forall element, relation element candidate := by
  sorry

                                                                                      
theorem InfimumIffSupremumOfLowerBounds
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    [LRA.Set.HasSeparation Element SetObject]
    [LRA.Set.HasUniversal SetObject] [LRA.Set.HasComplement SetObject]
    [LRA.Set.SeparationLaws Element SetObject]
    [LRA.Set.UniversalMembershipLaws Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Infimum relation subset candidate ↔
      Supremum relation (LowerBounds relation subset) candidate := by
  sorry

end LRA.Order
