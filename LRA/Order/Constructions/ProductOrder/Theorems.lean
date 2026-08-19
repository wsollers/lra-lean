import LRA.Order.Constructions.ProductOrder.Definition
import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u v

/-- The product of two partial orders is a partial order. -/
theorem ProductOfPartialOrdersIsPartialOrder
    {Alpha : Type u} {Beta : Type v}
    {leftRelation : LRA.Relation.Endorelation Alpha}
    {rightRelation : LRA.Relation.Endorelation Beta}
    (leftIsPartialOrder : PartialOrder leftRelation)
    (rightIsPartialOrder : PartialOrder rightRelation) :
    PartialOrder (ProductRelation leftRelation rightRelation) := by
  sorry

end LRA.Order
