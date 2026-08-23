import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u

                                                                     
structure Poset where
  Carrier : Type u
  NonStrictOrder : LRA.Relation.Endorelation Carrier
  NonStrictOrderIsPartialOrder : LRA.Order.PartialOrder NonStrictOrder

end LRA.Order
