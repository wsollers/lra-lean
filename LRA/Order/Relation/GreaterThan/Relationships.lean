import LRA.Order.Relation.GreaterThan.Definition
import LRA.Order.OrderedSets.PartialOrder.Definition
import LRA.Order.OrderedSets.StrictOrder.Definition
import LRA.Order.OrderedSets.LinearOrder.Definition
import LRA.Order.OrderedSets.StrictLinearOrder.Definition

namespace LRA.Order

universe u

                                                                     
theorem GreaterThanIsPartialOrderIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    PartialOrder (GreaterThan relation) ↔ PartialOrder relation := by
  sorry

                                                                    
theorem GreaterThanIsStrictOrderIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    StrictOrder (GreaterThan relation) ↔ StrictOrder relation := by
  sorry

                                                                    
theorem GreaterThanIsLinearOrderIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    LinearOrder (GreaterThan relation) ↔ LinearOrder relation := by
  sorry

                                                                           
theorem GreaterThanIsStrictLinearOrderIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    StrictLinearOrder (GreaterThan relation) ↔ StrictLinearOrder relation := by
  sorry

end LRA.Order
