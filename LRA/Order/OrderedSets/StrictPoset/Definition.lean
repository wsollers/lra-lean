import LRA.Order.OrderedSets.StrictOrder.Definition

namespace LRA.Order

universe u

/-- A strict poset is a carrier equipped with a strict order. -/
structure StrictPoset where
  Carrier : Type u
  StrictRelation : LRA.Relation.Endorelation Carrier
  StrictRelationIsStrictOrder : LRA.Order.StrictOrder StrictRelation

end LRA.Order
