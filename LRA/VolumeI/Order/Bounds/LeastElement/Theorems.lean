import LRA.VolumeI.Order.Bounds.LeastElement.Definition
import LRA.VolumeI.Relations.Basic.CoreProperties

namespace LRA.Order

universe u v

/-- Antisymmetry makes a least element unique. -/
theorem LeastElementUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsLeast : LeastElement relation subset first)
    (secondIsLeast : LeastElement relation subset second) :
    first = second := by
  sorry

end LRA.Order
