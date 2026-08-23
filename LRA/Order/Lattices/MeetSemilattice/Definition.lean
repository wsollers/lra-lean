import LRA.Order.Lattices.Meet.Definition

namespace LRA.Order

universe u

                                                                            
def MeetSemilattice
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  PartialOrder relation /\
    forall left right, exists meet, Meet relation left right meet

end LRA.Order
