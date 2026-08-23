import LRA.Order.Bounds.UpperBound.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

                                                     
def Supremum
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (supremum : Element) : Prop :=
  UpperBound relation subset supremum /\
    forall bound, UpperBound relation subset bound -> relation supremum bound

end LRA.Order
