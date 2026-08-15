import LRA.VolumeI.Order.Bounds.MaximalElement.Definition
import LRA.VolumeI.Order.Bounds.MinimalElement.Definition

namespace LRA.Order

universe u v

/-- Maximal elements for the converse are minimal elements for the original. -/
theorem MaximalElementOfConverseIffMinimalElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    MaximalElement (LRA.Relation.Converse strictRelation)
        subset candidate ↔
      MinimalElement strictRelation subset candidate := by
  sorry

end LRA.Order
