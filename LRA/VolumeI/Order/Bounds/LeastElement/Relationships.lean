import LRA.VolumeI.Order.Bounds.Infimum.Definition
import LRA.VolumeI.Order.Bounds.LeastElement.Definition
import LRA.VolumeI.Order.Bounds.MinimalElement.Definition
import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition
import LRA.VolumeI.Order.Relations.StrictPart.Definition
import LRA.VolumeI.Order.OrderedSets.TotalOrder.Definition

namespace LRA.VolumeI.Order

universe u v

/-- In an antisymmetric relation, every least element is minimal. -/
theorem LeastElementIsMinimal
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.VolumeI.Relations.Endorelation Element}
    (relationIsAntisymmetric : LRA.VolumeI.Relations.Antisymmetric relation)
    {subset : SetObject} {least : Element}
    (leastIsLeast : LeastElement relation subset least) :
    MinimalElement (StrictPart relation) subset least := by
  sorry

/-- In a total order, every minimal element is least. -/
theorem MinimalElementIsLeastInTotalOrder
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.VolumeI.Relations.Endorelation Element}
    (relationIsTotalOrder : TotalOrder relation)
    {subset : SetObject} {minimal : Element}
    (minimalIsMinimal : MinimalElement (StrictPart relation) subset minimal) :
    LeastElement relation subset minimal := by
  sorry

/-- A least element is an infimum. -/
theorem LeastElementIsInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.VolumeI.Relations.Endorelation Element}
    {subset : SetObject} {least : Element}
    (leastIsLeast : LeastElement relation subset least) :
    Infimum relation subset least := by
  sorry

end LRA.VolumeI.Order
