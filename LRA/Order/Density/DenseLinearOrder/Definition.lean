import LRA.Order.OrderedSets.StrictLinearOrder.Definition
import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u

                                                                                    
def DenseLinearOrder {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  StrictLinearOrder relation /\ LRA.Relation.Dense relation

end LRA.Order
