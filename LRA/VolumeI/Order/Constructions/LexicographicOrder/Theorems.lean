import LRA.VolumeI.Order.Constructions.LexicographicOrder.Definition
import LRA.VolumeI.Order.StrictLinearOrder

namespace LRA.VolumeI.Order

universe u v

/-- The lexicographic product of strict linear orders is strict linear. -/
theorem LexicographicProductIsStrictLinearOrder
    {Alpha : Type u} {Beta : Type v}
    {leftRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    {rightRelation : LRA.VolumeI.Relations.Endorelation Beta}
    (leftIsStrictLinear : StrictLinearOrder leftRelation)
    (rightIsStrictLinear : StrictLinearOrder rightRelation) :
    StrictLinearOrder (LexicographicRelation leftRelation rightRelation) := by
  sorry

end LRA.VolumeI.Order
