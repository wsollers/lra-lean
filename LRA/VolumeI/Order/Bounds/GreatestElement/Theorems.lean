import LRA.VolumeI.Order.Bounds.GreatestElement.Definition
import LRA.VolumeI.Relations.Basic.CoreProperties

namespace LRA.VolumeI.Order

universe u v

/-- Antisymmetry makes a greatest element unique. -/
theorem GreatestElementUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.VolumeI.Relations.Endorelation Element}
    (relationIsAntisymmetric : LRA.VolumeI.Relations.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsGreatest : GreatestElement relation subset first)
    (secondIsGreatest : GreatestElement relation subset second) :
    first = second := by
  sorry

end LRA.VolumeI.Order
