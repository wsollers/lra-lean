import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u

/-- A meet of two elements is their greatest lower bound. -/
def Meet {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha)
    (left right meet : alpha) : Prop :=
  relation meet left /\ relation meet right /\
    forall lower,
      relation lower left -> relation lower right -> relation lower meet

end LRA.Order
