import LRA.Relation.Operations.Converse.Definition
import LRA.Order.Lattices.JoinSemilattice.Definition
import LRA.Order.Lattices.Lattice.Definition
import LRA.Order.Lattices.MeetSemilattice.Definition

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

end LRA.Order
