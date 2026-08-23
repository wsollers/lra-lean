import LRA.Order.OrderedSets.StrictOrder.Definition

namespace LRA.Order

universe u

                                                                     
def StrictLinearOrder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  StrictOrder relation ∧
    LRA.Relation.ExactlyTrichotomous relation

end LRA.Order
