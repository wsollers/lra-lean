import LRA.Relation.Properties.Definition

namespace LRA.Relation

universe u v

                                                                            
                                                                            
                                    
def WellFounded {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : Endorelation Element) : Prop :=
  ∀ subset : SetObject,
    (∃ element, element ∈ subset) →
      ∃ minimum, MinimalElement relation subset minimum

end LRA.Relation
