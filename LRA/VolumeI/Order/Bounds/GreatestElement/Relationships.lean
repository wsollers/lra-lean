import LRA.VolumeI.Order.Bounds.GreatestElement.Definition
import LRA.VolumeI.Order.Bounds.MaximalElement.Definition
import LRA.VolumeI.Order.Bounds.Supremum.Definition
import LRA.VolumeI.Order.Relations.StrictPart.Definition
import LRA.VolumeI.Order.OrderedSets.LinearOrder.Definition

namespace LRA.Order

universe u v

/-- In an antisymmetric relation, every greatest element is maximal. -/
theorem GreatestElementIsMaximal
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {greatest : Element}
    (greatestIsGreatest : GreatestElement relation subset greatest) :
    MaximalElement (StrictPart relation) subset greatest := by
  sorry

/-- In a linear order, every maximal element is greatest. -/
theorem MaximalElementIsGreatestInLinearOrder
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    {subset : SetObject} {maximal : Element}
    (maximalIsMaximal : MaximalElement (StrictPart relation) subset maximal) :
    GreatestElement relation subset maximal := by
  sorry

/-- A greatest element is a supremum. -/
theorem GreatestElementIsSupremum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {greatest : Element}
    (greatestIsGreatest : GreatestElement relation subset greatest) :
    Supremum relation subset greatest := by
  sorry

end LRA.Order
