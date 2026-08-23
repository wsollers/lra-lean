import LRA.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u

                                                         
def Join {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha)
    (left right join : alpha) : Prop :=
  relation left join /\ relation right join /\
    forall upper,
      relation left upper -> relation right upper -> relation join upper

end LRA.Order
