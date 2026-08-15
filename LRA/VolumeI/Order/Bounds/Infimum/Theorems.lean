import LRA.VolumeI.Order.Bounds.Infimum.Definition
import LRA.VolumeI.Relations.Basic.CoreProperties

namespace LRA.Order

universe u v

/-- Antisymmetry makes an infimum unique. -/
theorem InfimumUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsInfimum : Infimum relation subset first)
    (secondIsInfimum : Infimum relation subset second) :
    first = second := by
  sorry

end LRA.Order
