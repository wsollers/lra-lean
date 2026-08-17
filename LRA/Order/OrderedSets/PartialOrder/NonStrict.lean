import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order.OrderedSets.PartialOrder

universe u

/-- Compatibility name: a non-strict partial order is a partial-order relation. -/
abbrev NonStrictPartialOrder (Carrier : Type u) :=
  PartialOrderRelation Carrier

end LRA.Order.OrderedSets.PartialOrder
