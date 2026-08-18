import LRA.Relation.Operations.Converse.Definition
import LRA.VolumeI.Order.Bounds.LowerBound.Definition
import LRA.VolumeI.Order.Bounds.UpperBound.Definition

namespace LRA.Order

universe u v

/-- Upper bounds in the converse relation are lower bounds in the original. -/
theorem UpperBoundOfConverseIffLowerBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (bound : Element) :
    UpperBound (LRA.Relation.Converse relation) subset bound ↔
      LowerBound relation subset bound := by
  sorry

end LRA.Order
