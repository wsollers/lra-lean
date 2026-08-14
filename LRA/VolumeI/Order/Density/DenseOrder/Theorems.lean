import LRA.VolumeI.Order.Density.DenseOrder.Definition
import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition
import LRA.VolumeI.Order.Relations.CoverRelation.Definition
import LRA.VolumeI.Order.Relations.StrictPart.Definition

namespace LRA.VolumeI.Order

universe u

/-- For a partial order, density of its strict part is exactly dense order. -/
theorem DenseOrderOfStrictPartIffDense
    {Alpha : Type u}
    {relation : LRA.VolumeI.Relations.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation) :
    DenseOrder (StrictPart relation) ↔
      LRA.VolumeI.Relations.Dense (StrictPart relation) := by
  sorry

/-- A dense strict order has no cover pairs and hence no Hasse edges. -/
theorem DenseOrderHasNoCovers
    {Alpha : Type u}
    {strictRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    (strictRelationIsDenseOrder : DenseOrder strictRelation) :
    forall lower upper, Not (CoverRelation strictRelation lower upper) := by
  sorry

end LRA.VolumeI.Order
