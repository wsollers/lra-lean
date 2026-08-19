import LRA.Order.Bounds.GreatestElement.Definition
import LRA.Order.Bounds.MaximalElement.Definition
import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.Relation.StrictPart.Definition
import LRA.Order.OrderedSets.LinearOrder.Definition
import LRA.Relation.Properties.Definition

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

/-- A greatest element is the unique maximal element of its represented subset. -/
theorem GreatestElementIsUniqueMaximalElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsAntisymmetric : LRA.Relation.Antisymmetric relation)
    {subset : SetObject} {greatest maximal : Element}
    (greatestIsGreatest : GreatestElement relation subset greatest)
    (maximalIsMaximal : MaximalElement (StrictPart relation) subset maximal) :
    maximal = greatest := by
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

/-- Being greatest is equivalent to being a supremum that belongs to the subset. -/
theorem GreatestElementIffSupremumAndMembership
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsReflexive : LRA.Relation.Reflexive relation)
    {subset : SetObject} {candidate : Element} :
    GreatestElement relation subset candidate ↔
      Supremum relation subset candidate /\ candidate ∈ subset := by
  sorry

end LRA.Order
