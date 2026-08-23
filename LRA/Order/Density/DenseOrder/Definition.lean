import LRA.Order.OrderedSets.StrictOrder.Definition
import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u

                                                                                           
def DenseOrder {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  StrictOrder relation /\ LRA.Relation.Dense relation

                                                              
class DenseOrderLaw (R : Type u) [LT R] : Prop where
  ExistsBetween :
    forall a b : R, a < b -> exists middle : R, a < middle /\ middle < b

section Wrappers

variable {R : Type u}

theorem ExistsBetween [LT R] [DenseOrderLaw R] :
    forall a b : R, a < b -> exists middle : R, a < middle /\ middle < b := by
  sorry

end Wrappers

end LRA.Order
