import LRA.VolumeI.Order.Bounds.Infimum.Definition
import LRA.VolumeI.Order.Bounds.LeastElement.Definition
import LRA.VolumeI.Order.Bounds.MinimalElement.Definition
import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition
import LRA.VolumeI.Order.Relation.StrictPart.Definition
import LRA.VolumeI.Order.OrderedSets.LinearOrder.Definition

namespace LRA.Order

universe u v

/-- In an antisymmetric relation, every least element is minimal. -/
theorem LeastElementIsMinimal
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {least : Element}
    (leastIsLeast : LeastElement relation subset least) :
    MinimalElement (StrictPart relation) subset least := by
  sorry

/-- A least element is the unique minimal element of its represented subset. -/
theorem LeastElementIsUniqueMinimalElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {least minimal : Element}
    (leastIsLeast : LeastElement relation subset least)
    (minimalIsMinimal : MinimalElement (StrictPart relation) subset minimal) :
    minimal = least := by
  sorry

/-- In a linear order, every minimal element is least. -/
theorem MinimalElementIsLeastInLinearOrder
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsLinearOrder : LinearOrder relation)
    {subset : SetObject} {minimal : Element}
    (minimalIsMinimal : MinimalElement (StrictPart relation) subset minimal) :
    LeastElement relation subset minimal := by
  sorry

/-- A least element is an infimum. -/
theorem LeastElementIsInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    {subset : SetObject} {least : Element}
    (leastIsLeast : LeastElement relation subset least) :
    Infimum relation subset least := by
  sorry

/-- Being least is equivalent to being an infimum that belongs to the subset. -/
theorem LeastElementIffInfimumAndMembership
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    {subset : SetObject} {candidate : Element} :
    LeastElement relation subset candidate ↔
      Infimum relation subset candidate /\ candidate ∈ subset := by
  sorry

end LRA.Order
