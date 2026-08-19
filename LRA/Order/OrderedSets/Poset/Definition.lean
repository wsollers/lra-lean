import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u

/-- A poset is a carrier equipped with a non-strict partial order. -/
structure Poset where
  Carrier : Type u
  NonStrictOrder : LRA.Relation.Endorelation Carrier
  NonStrictOrderIsPartialOrder : LRA.Order.PartialOrder NonStrictOrder

end LRA.Order
