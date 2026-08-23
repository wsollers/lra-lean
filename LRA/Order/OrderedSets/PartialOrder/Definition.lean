import LRA.Order.OrderedSets.Preorder.Definition

namespace LRA.Order

universe u

                                                                   
def PartialOrder {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  LRA.Relation.Reflexive relation ∧
    LRA.Relation.Antisymmetric relation ∧
      LRA.Relation.Transitive relation

end LRA.Order

namespace LRA.Order.OrderedSets.PartialOrder

universe u

                                                                   
structure PartialOrderRelation (Carrier : Type u) where
  relation : LRA.Order.OrderedSets.OrderRelation Carrier
  relationIsPartialOrder : LRA.Order.PartialOrder relation

end LRA.Order.OrderedSets.PartialOrder
