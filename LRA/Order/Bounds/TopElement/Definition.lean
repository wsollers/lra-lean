import LRA.Order.Bounds.GreatestElement.Definition
import LRA.Set.Interface.Operations

namespace LRA.Order

open scoped LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [LRA.Set.HasUniversal SetObject]

/-- A top element is the greatest element of the full carrier represented by the universal set. -/
def TopElement
    (relation : LRA.Relation.Endorelation Element)
    (top : Element) : Prop :=
  GreatestElement relation (𝒰 : SetObject) top

end LRA.Order
