import LRA.Relation.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

                                                                  
                                                                     
                                                                
                                                                      
                                     

                                                      
                                                                      
                                                                     
                                                                 
                        
def Dominated
    (relation : LRA.Relation.Endorelation Element)
    (dominated dominating : SetObject) : Prop :=
  forall element, element ∈ dominated ->
    exists other, other ∈ dominating /\ relation element other

end LRA.Order
