import LRA.Order.Lattices.JoinSemilattice.Definition

namespace LRA.Order

universe u

                                                   
theorem JoinSemilatticeHasJoin
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsJoinSemilattice : JoinSemilattice relation)
    (left right : Alpha) :
    exists join, Join relation left right join := by
  sorry

end LRA.Order
