import LRA.Order.OrderedSets.StrictLinearOrder.Definition
import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u

/-- A dense linear order is a strict linear order whose strict relation is dense. -/
def DenseLinearOrder {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  StrictLinearOrder relation /\ LRA.Relation.Dense relation

end LRA.Order
