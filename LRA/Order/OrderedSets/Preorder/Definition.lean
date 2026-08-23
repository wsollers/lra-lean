import LRA.Order.Relation.OrderRelation.Definition
import LRA.Relation.Properties.Definition

namespace LRA.Order

universe u

                                                          
def Preorder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  LRA.Relation.Reflexive relation ∧
    LRA.Relation.Transitive relation

end LRA.Order

namespace LRA.Order.OrderedSets.Preorder

universe u

                                                         
structure PreorderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  isPreorder : LRA.Order.Preorder relation

end LRA.Order.OrderedSets.Preorder
