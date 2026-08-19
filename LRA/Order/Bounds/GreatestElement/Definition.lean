import LRA.Order.Bounds.UpperBound.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- A greatest element belongs to the represented subset and is an upper bound of it. -/
def GreatestElement
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (greatest : Element) : Prop :=
  greatest ∈ subset /\ UpperBound relation subset greatest

end LRA.Order
