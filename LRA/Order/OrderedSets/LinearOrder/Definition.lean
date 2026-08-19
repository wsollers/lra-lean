import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u

/-- A linear (total) order is a partial order whose relation is total. -/
def LinearOrder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  PartialOrder relation ∧ LRA.Relation.Total relation

/-- Standard synonym for `LinearOrder`. -/
abbrev TotalOrder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  LinearOrder relation

end LRA.Order
