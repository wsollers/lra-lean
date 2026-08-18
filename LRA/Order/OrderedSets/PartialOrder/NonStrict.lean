import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order.OrderedSets.PartialOrder

universe u

/-- A non-strict partial order is a partial-order relation.

Mathematics names the same object twice: `≤` is called simply a partial order
when no strict order is in view, and a *non-strict* partial order when it is
being contrasted with the strict order `<` of `LRA.Order.OrderedSets.StrictOrder`.
Both names are in standard use, so both are provided. -/
abbrev NonStrictPartialOrder (Carrier : Type u) :=
  PartialOrderRelation Carrier

end LRA.Order.OrderedSets.PartialOrder
