import LRA.VolumeI.Order.Bounds.Infimum.Definition
import LRA.VolumeI.Order.Bounds.Supremum.Definition

namespace LRA.VolumeI.Order

universe u v

/-- Suprema in the converse relation are infima in the original relation. -/
theorem SupremumOfConverseIffInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.VolumeI.Relations.Endorelation Element)
    (subset : SetObject) (candidate : Element) :
    Supremum (LRA.VolumeI.Relations.Converse relation) subset candidate ↔
      Infimum relation subset candidate := by
  sorry

end LRA.VolumeI.Order
