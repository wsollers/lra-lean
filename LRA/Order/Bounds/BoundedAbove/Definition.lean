import LRA.Order.Bounds.UpperBound.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- A subset is bounded above when it has an upper bound. -/
def BoundedAbove
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  exists bound, UpperBound relation subset bound

end LRA.Order
