import LRA.Order.Lattices.Join.Definition

namespace LRA.Order

universe u

/-- A join-semilattice is a partial order in which every pair has a join. -/
def JoinSemilattice
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  PartialOrder relation /\
    forall left right, exists join, Join relation left right join

end LRA.Order
