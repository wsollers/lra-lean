import LRA.VolumeI.Order.OrderedSets.LinearOrder.Definition

namespace LRA.Order

universe u

/-- A total relation is reflexive. -/
theorem TotalImpliesReflexive
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsTotal : LRA.Relation.Total relation) :
    LRA.Relation.Reflexive relation := by
  sorry

/-- Every linear order is a partial order. -/
theorem LinearOrderIsPartialOrder
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLinearOrder : LinearOrder relation) :
    PartialOrder relation :=
  relationIsLinearOrder.1

/-- Every linear order is total. -/
theorem LinearOrderIsTotal
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLinearOrder : LinearOrder relation) :
    LRA.Relation.Total relation :=
  relationIsLinearOrder.2

end LRA.Order
