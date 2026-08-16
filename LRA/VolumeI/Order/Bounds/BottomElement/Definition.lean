import LRA.VolumeI.Order.Bounds.LeastElement.Definition
import LRA.VolumeI.Set.Interface.Operations

namespace LRA.Order

open scoped LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [LRA.Set.HasUniversal SetObject]

/--
A bottom element is the least element of the full carrier represented by the
universal set.
-/
def BottomElement
    (relation : LRA.Relation.Endorelation Element)
    (bottom : Element) : Prop :=
  LeastElement relation (𝒰 : SetObject) bottom

end LRA.Order
