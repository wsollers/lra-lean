import LRA.VolumeI.Order.Relations.GreaterThanOrEqual.Definition
import LRA.VolumeI.Order.Relations.LessThanOrEqual.Definition

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
