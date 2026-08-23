import LRA.Order.Lattices.Join.Definition

namespace LRA.Order

universe u

                                                                            
def JoinSemilattice
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  PartialOrder relation /\
    forall left right, exists join, Join relation left right join

end LRA.Order
