import LRA.VolumeI.Order.Bounds.LowerBound.Definition

namespace LRA.VolumeI.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/-- A subset is bounded below when it has a lower bound. -/
def BoundedBelow
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject) : Prop :=
  exists bound, LowerBound relation subset bound

end LRA.VolumeI.Order
