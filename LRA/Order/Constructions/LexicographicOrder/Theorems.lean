import LRA.Order.Constructions.LexicographicOrder.Definition
import LRA.Order.OrderedSets.StrictLinearOrder.Definition

namespace LRA.Order

universe u v

                                                                          
theorem LexicographicProductIsStrictLinearOrder
    {Alpha : Type u} {Beta : Type v}
    {leftRelation : LRA.Relation.Endorelation Alpha}
    {rightRelation : LRA.Relation.Endorelation Beta}
    (leftIsStrictLinear : StrictLinearOrder leftRelation)
    (rightIsStrictLinear : StrictLinearOrder rightRelation) :
    StrictLinearOrder (LexicographicRelation leftRelation rightRelation) := by
  sorry

end LRA.Order
