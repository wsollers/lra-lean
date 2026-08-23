import LRA.Order.OrderedSets.Preorder.Definition

namespace LRA.Order.OrderedSets.Preorder

                                                                             
theorem PreorderRelationIsReflexive
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Reflexive preorder.relation := by
  sorry

                                                                              
theorem PreorderRelationIsTransitive
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) :
    LRA.Relation.Transitive preorder.relation := by
  sorry

end LRA.Order.OrderedSets.Preorder
