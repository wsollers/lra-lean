import LRA.Order.Relation.OrderRelation.Definition
import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u

                                                                 
def StrictOrder {Alpha : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Alpha) : Prop :=
  LRA.Relation.Irreflexive relation ∧
    LRA.Relation.Transitive relation

end LRA.Order

namespace LRA.Order.OrderedSets.StrictOrder

universe u

                                                                 
structure StrictOrderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  relationIsStrictOrder : LRA.Order.StrictOrder relation

end LRA.Order.OrderedSets.StrictOrder
