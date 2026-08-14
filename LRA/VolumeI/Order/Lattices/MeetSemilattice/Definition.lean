import LRA.VolumeI.Order.Lattices.Meet.Definition

namespace LRA.VolumeI.Order

universe u

/-- A meet-semilattice is a partial order in which every pair has a meet. -/
def MeetSemilattice
    {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha) : Prop :=
  PartialOrder relation /\
    forall left right, exists meet, Meet relation left right meet

end LRA.VolumeI.Order
