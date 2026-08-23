import LRA.Order.Bounds.UpperBound.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

                                                                                        
def GreatestElement
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (greatest : Element) : Prop :=
  greatest ∈ subset /\ UpperBound relation subset greatest

end LRA.Order
