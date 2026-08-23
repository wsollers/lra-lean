import LRA.Order.Bounds.MaximalElement.Definition
import LRA.Order.Bounds.MinimalElement.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Order

universe u v

                                                                               
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
