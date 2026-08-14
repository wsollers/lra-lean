import LRA.VolumeI.Order.Lattices.JoinSemilattice.Definition
import LRA.VolumeI.Order.Lattices.Lattice.Definition
import LRA.VolumeI.Order.Lattices.MeetSemilattice.Definition

namespace LRA.VolumeI.Order

universe u

/-- A lattice is exactly both a join-semilattice and a meet-semilattice. -/
theorem LatticeIffJoinAndMeetSemilattice
    {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) :
    Lattice relation ↔ JoinSemilattice relation /\ MeetSemilattice relation := by
  sorry

/-- Lattice structure is invariant under order duality. -/
theorem ConverseIsLatticeIff
    {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) :
    Lattice (LRA.VolumeI.Relations.Converse relation) ↔ Lattice relation := by
  sorry

end LRA.VolumeI.Order
