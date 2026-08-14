import LRA.VolumeI.Order.Bounds.LeastElement.Definition
import LRA.VolumeI.Relations.Basic.CoreProperties

namespace LRA.VolumeI.Order

universe u v

/-- Antisymmetry makes a least element unique. -/
theorem LeastElementUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.VolumeI.Relations.Endorelation Element}
    (relationIsAntisymmetric : LRA.VolumeI.Relations.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsLeast : LeastElement relation subset first)
    (secondIsLeast : LeastElement relation subset second) :
    first = second := by
  sorry

end LRA.VolumeI.Order
