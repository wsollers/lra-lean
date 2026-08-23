import LRA.Order.OrderedSets.LinearOrder.Definition

namespace LRA.Order

universe u

                                     
theorem TotalImpliesReflexive
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsTotal : LRA.Relation.Total relation) :
    LRA.Relation.Reflexive relation := by
  sorry

                                             
theorem LinearOrderIsPartialOrder
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLinearOrder : LinearOrder relation) :
    PartialOrder relation := by
  sorry

                                   
theorem LinearOrderIsTotal
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLinearOrder : LinearOrder relation) :
    LRA.Relation.Total relation := by
  sorry

end LRA.Order
