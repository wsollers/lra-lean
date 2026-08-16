import LRA.VolumeI.Order.Relation.GreaterThanOrEqual.Definition
import LRA.VolumeI.Order.Relation.LessThanOrEqual.Definition

namespace LRA.Order

universe u

/-- Reversing an adjoined-equality relation gives greater-than-or-equal. -/
theorem GreaterThanOrEqualIsConverseOfLessThanOrEqual
    {Alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation Alpha) :
    GreaterThanOrEqual strictRelation =
      LRA.Relation.Converse (LessThanOrEqual strictRelation) := by
  sorry

end LRA.Order
