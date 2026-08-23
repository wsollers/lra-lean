import LRA.Order.Bounds.BoundedAbove.Definition
import LRA.Order.Bounds.BoundedBelow.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

                                                                   
def Bounded
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  BoundedAbove relation subset /\ BoundedBelow relation subset

end LRA.Order
