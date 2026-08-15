import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u

/--
Linear-order laws for a non-strict endorelation. A linear order is also
called a total order.

Totality already implies reflexivity by comparing an element with itself. The
`PartialOrder` conjunct retains reflexivity explicitly to keep the standard
partial-order-plus-totality presentation.
-/
def LinearOrder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  PartialOrder relation /\ LRA.Relation.Total relation

/-- `TotalOrder` is the standard synonym for `LinearOrder`. -/
abbrev TotalOrder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  LinearOrder relation

end LRA.Order
