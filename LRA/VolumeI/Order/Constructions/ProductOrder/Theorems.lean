import LRA.VolumeI.Order.Constructions.ProductOrder.Definition
import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition

namespace LRA.VolumeI.Order

universe u v

/-- The product of two partial orders is a partial order. -/
theorem ProductOfPartialOrdersIsPartialOrder
    {Alpha : Type u} {Beta : Type v}
    {leftRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    {rightRelation : LRA.VolumeI.Relations.Endorelation Beta}
    (leftIsPartialOrder : PartialOrder leftRelation)
    (rightIsPartialOrder : PartialOrder rightRelation) :
    PartialOrder (ProductRelation leftRelation rightRelation) := by
  sorry

end LRA.VolumeI.Order
