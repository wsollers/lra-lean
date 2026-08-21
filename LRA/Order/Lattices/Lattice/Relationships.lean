import LRA.Relation.Operations.Converse.Definition
import LRA.Order.Lattices.Join.Relationships
import LRA.Order.Lattices.Meet.Relationships
import LRA.Order.Lattices.JoinSemilattice.Definition
import LRA.Order.Lattices.Lattice.Definition
import LRA.Order.Lattices.MeetSemilattice.Definition
import LRA.Order.OrderedSets.PartialOrder.Relationships

namespace LRA.Order

universe u

/-- A lattice is exactly both a join-semilattice and a meet-semilattice. -/
theorem LatticeIffJoinAndMeetSemilattice
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    Lattice relation ↔ JoinSemilattice relation /\ MeetSemilattice relation := by
  sorry

/-- Lattice structure is invariant under order duality. -/
theorem ConverseIsLatticeIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    Lattice (LRA.Relation.Converse relation) ↔ Lattice relation := by
  sorry

/-- The dual of a partial order swaps the roles of join and meet: a join
under `order` is a meet under `Dual order`.

Equivalently: unfolding `Dual`'s relation to `LRA.Relation.Converse
order.relation`, this is exactly `JoinOfConverseIffMeet` restated
through the bundled `Dual` construction rather than the raw converse. -/
theorem JoinIffMeetOfDual
    {Carrier : Type u}
    (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier)
    (left right value : Carrier) :
    Join order.relation left right value ↔
      Meet (LRA.Order.OrderedSets.PartialOrder.Dual order).relation
        left right value := by
  sorry

/-- The dual of a partial order swaps the roles of meet and join: a meet
under `order` is a join under `Dual order`. -/
theorem MeetIffJoinOfDual
    {Carrier : Type u}
    (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier)
    (left right value : Carrier) :
    Meet order.relation left right value ↔
      Join (LRA.Order.OrderedSets.PartialOrder.Dual order).relation
        left right value := by
  sorry

end LRA.Order
