import LRA.Relation.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

                                                                     
def UpperBound
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (bound : Element) : Prop :=
  forall element, element ∈ subset -> relation element bound

end LRA.Order
