import LRA.VolumeI.Order.Lattices.Meet.Definition

namespace LRA.Order

universe u

/-- A meet-semilattice is a partial order in which every pair has a meet. -/
def MeetSemilattice
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  PartialOrder relation /\
    forall left right, exists meet, Meet relation left right meet

end LRA.Order
