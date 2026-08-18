import LRA.Order.OrderedSets.StrictOrder.Definition

namespace LRA.Order

universe u

/-- A strict linear order is a strict order with exact trichotomy. -/
def StrictLinearOrder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  StrictOrder relation ∧
    LRA.Relation.ExactlyTrichotomous relation

end LRA.Order
