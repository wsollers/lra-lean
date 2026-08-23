import LRA.Order.Lattices.Join.Definition
import LRA.Order.Lattices.Meet.Definition

namespace LRA.Order

universe u

                                                      
def Lattice {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  PartialOrder relation /\
    forall left right : alpha,
      (exists join, Join relation left right join) /\
        (exists meet, Meet relation left right meet)

end LRA.Order
