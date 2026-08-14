import LRA.VolumeI.Order.Bounds.Supremum.Definition
import LRA.VolumeI.Relations.Basic.CoreProperties

namespace LRA.VolumeI.Order

universe u v

/-- Antisymmetry makes a supremum unique. -/
theorem SupremumUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.VolumeI.Relations.Endorelation Element}
    (relationIsAntisymmetric : LRA.VolumeI.Relations.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsSupremum : Supremum relation subset first)
    (secondIsSupremum : Supremum relation subset second) :
    first = second := by
  sorry

end LRA.VolumeI.Order
