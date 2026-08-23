import LRA.Relation.Properties.WellFounded.Definition

namespace LRA.Relation

universe u v

   
                                       

                                                                          
        
  
theorem MinimalElementPrinciple
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {strictRelation : Endorelation Element}
    (strictRelationIsWellFounded : WellFounded SetObject strictRelation)
    (subset : SetObject)
    (subsetIsNonempty : ∃ element : Element, element ∈ subset) :
    ∃ minimalElement,
      MinimalElement strictRelation subset minimalElement := by
  sorry

end LRA.Relation
