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

end LRA.Order
