import LRA.Relation.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

def Coinitial
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall point, exists element, element ∈ subset /\ relation element point

end LRA.Order
