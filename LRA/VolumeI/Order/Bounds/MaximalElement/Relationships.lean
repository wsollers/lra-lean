import LRA.VolumeI.Order.Bounds.MaximalElement.Definition
import LRA.VolumeI.Order.Bounds.MinimalElement.Definition

namespace LRA.VolumeI.Order

universe u v

/-- Maximal elements for the converse are minimal elements for the original. -/
theorem MaximalElementOfConverseIffMinimalElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    MaximalElement (LRA.VolumeI.Relations.Converse strictRelation)
        subset candidate ↔
      MinimalElement strictRelation subset candidate := by
  sorry

end LRA.VolumeI.Order
