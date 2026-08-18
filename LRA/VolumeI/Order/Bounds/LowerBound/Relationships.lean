import LRA.Relation.Operations.Converse.Definition
import LRA.VolumeI.Order.Bounds.LowerBound.Definition
import LRA.VolumeI.Order.Bounds.UpperBound.Definition

namespace LRA.Order

universe u v

/-- Lower bounds in the converse relation are upper bounds in the original. -/
theorem LowerBoundOfConverseIffUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (bound : Element) :
    LowerBound (LRA.Relation.Converse relation) subset bound ↔
      UpperBound relation subset bound := by
  sorry

end LRA.Order
