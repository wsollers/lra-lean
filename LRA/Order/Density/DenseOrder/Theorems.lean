import LRA.Order.Density.DenseOrder.Definition
import LRA.Order.OrderedSets.PartialOrder.Definition
import LRA.Order.Relation.CoverRelation.Definition
import LRA.Order.Relation.StrictPart.Definition

namespace LRA.Order

universe u

                                                                              
theorem DenseOrderOfStrictPartIffDense
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation) :
    DenseOrder (StrictPart relation) ↔
      LRA.Relation.Dense (StrictPart relation) := by
  sorry

                                                                        
theorem DenseOrderHasNoCovers
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    (strictRelationIsDenseOrder : DenseOrder strictRelation) :
    forall lower upper, Not (CoverRelation strictRelation lower upper) := by
  sorry

end LRA.Order
