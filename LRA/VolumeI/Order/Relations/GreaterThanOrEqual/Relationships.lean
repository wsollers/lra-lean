import LRA.VolumeI.Order.Relations.GreaterThanOrEqual.Definition
import LRA.VolumeI.Order.Relations.LessThanOrEqual.Definition

namespace LRA.VolumeI.Order

universe u

/-- Reversing an adjoined-equality relation gives greater-than-or-equal. -/
theorem GreaterThanOrEqualIsConverseOfLessThanOrEqual
    {Alpha : Type u}
    (strictRelation : LRA.VolumeI.Relations.Endorelation Alpha) :
    GreaterThanOrEqual strictRelation =
      LRA.VolumeI.Relations.Converse (LessThanOrEqual strictRelation) := by
  sorry

end LRA.VolumeI.Order
