import LRA.VolumeI.Order.Bounds.LowerBound.Definition
import LRA.VolumeI.Order.Bounds.UpperBound.Definition

namespace LRA.VolumeI.Order

universe u v

/-- Upper bounds in the converse relation are lower bounds in the original. -/
theorem UpperBoundOfConverseIffLowerBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject) (bound : Element) :
    UpperBound (LRA.VolumeI.Relations.Converse relation) subset bound ↔
      LowerBound relation subset bound := by
  sorry

end LRA.VolumeI.Order
