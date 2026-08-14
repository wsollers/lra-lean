import LRA.VolumeI.Order.Bounds.BoundedAbove.Definition
import LRA.VolumeI.Order.Bounds.BoundedBelow.Definition

namespace LRA.VolumeI.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- A subset is bounded when it is bounded both above and below. -/
def Bounded
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject) : Prop :=
  BoundedAbove relation subset /\ BoundedBelow relation subset

end LRA.VolumeI.Order
