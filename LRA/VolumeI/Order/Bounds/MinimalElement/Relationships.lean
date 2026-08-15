import LRA.VolumeI.Order.Bounds.MaximalElement.Definition
import LRA.VolumeI.Order.Bounds.MinimalElement.Definition

namespace LRA.Order

universe u v

/-- Minimal elements for the converse are maximal elements for the original. -/
theorem MinimalElementOfConverseIffMaximalElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    MinimalElement (LRA.Relation.Converse strictRelation)
        subset candidate ↔
      MaximalElement strictRelation subset candidate := by
  sorry

end LRA.Order
