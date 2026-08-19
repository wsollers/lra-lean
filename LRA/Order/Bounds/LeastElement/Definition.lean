import LRA.Order.Bounds.LowerBound.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- A least element belongs to the represented subset and is a lower bound of it. -/
def LeastElement
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (least : Element) : Prop :=
  least ∈ subset /\ LowerBound relation subset least

end LRA.Order
