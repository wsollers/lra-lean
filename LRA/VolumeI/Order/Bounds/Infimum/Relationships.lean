import LRA.VolumeI.Order.Bounds.Infimum.Definition
import LRA.VolumeI.Order.Bounds.Supremum.Definition

namespace LRA.Order

universe u v

/-- Infima in the converse relation are suprema in the original relation. -/
theorem InfimumOfConverseIffSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Infimum (LRA.Relation.Converse relation) subset candidate ↔
      Supremum relation subset candidate := by
  sorry

end LRA.Order
