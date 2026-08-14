import LRA.VolumeI.Order.Bounds.Infimum.Definition
import LRA.VolumeI.Order.Bounds.Supremum.Definition

namespace LRA.VolumeI.Order

universe u v

/-- Infima in the converse relation are suprema in the original relation. -/
theorem InfimumOfConverseIffSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Infimum (LRA.VolumeI.Relations.Converse relation) subset candidate ↔
      Supremum relation subset candidate := by
  sorry

end LRA.VolumeI.Order
