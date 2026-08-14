import LRA.VolumeI.Order.Bounds.LowerBound.Definition
import LRA.VolumeI.Order.Bounds.UpperBound.Definition

namespace LRA.VolumeI.Order

universe u v

/-- Lower bounds in the converse relation are upper bounds in the original. -/
theorem LowerBoundOfConverseIffUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject) (bound : Element) :
    LowerBound (LRA.VolumeI.Relations.Converse relation) subset bound ↔
      UpperBound relation subset bound := by
  sorry

end LRA.VolumeI.Order
