import LRA.Order.Bounds.GreatestElement.Definition
import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u v

/-- Antisymmetry makes a greatest element unique. -/
theorem GreatestElementUnique
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {first second : Element}
    (firstIsGreatest : GreatestElement relation subset first)
    (secondIsGreatest : GreatestElement relation subset second) :
    first = second := by
  sorry

end LRA.Order
