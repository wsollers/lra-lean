import LRA.Relation.Definition

namespace LRA.Order.OrderedSets

universe u

/-- An order relation is an endorelation on a carrier. -/
abbrev OrderRelation (Carrier : Type u) :=
  LRA.Relation.Endorelation Carrier

end LRA.Order.OrderedSets
