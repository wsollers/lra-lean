import LRA.Relation.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

def DenseSubset
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall x y, relation x y ->
    exists d, d ∈ subset /\ relation x d /\ relation d y

end LRA.Order
