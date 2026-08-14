import LRA.VolumeI.Order.Bounds.MaximalElement.Definition
import LRA.VolumeI.Order.Bounds.MinimalElement.Definition

namespace LRA.VolumeI.Order

universe u v

/-- Minimal elements for the converse are maximal elements for the original. -/
theorem MinimalElementOfConverseIffMaximalElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    MinimalElement (LRA.VolumeI.Relations.Converse strictRelation)
        subset candidate ↔
      MaximalElement strictRelation subset candidate := by
  sorry

end LRA.VolumeI.Order
