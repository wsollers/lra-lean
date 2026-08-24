import LRA.Relation.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

def Cofinal
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall point, exists element, element ∈ subset /\ relation point element

def DenseAbove
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Cofinal relation subset

end LRA.Order
