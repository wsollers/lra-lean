import LRA.Order.OrderedSets.PartialOrder.NonStrict

namespace LRA.Order.OrderedSets.PartialOrder

                                                    
theorem PartialOrderIsReflexive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
    LRA.Relation.Reflexive relation := by
  sorry

                                                        
theorem PartialOrderIsAntisymmetric
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
    LRA.Relation.Antisymmetric relation := by
  sorry

                                                     
theorem PartialOrderIsTransitive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsPartialOrder : LRA.Order.PartialOrder relation) :
    LRA.Relation.Transitive relation := by
  sorry

                                                                      
theorem PartialOrderRelationIsReflexive
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Reflexive order.relation := by
  sorry

                                                                          
theorem PartialOrderRelationIsAntisymmetric
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Antisymmetric order.relation := by
  sorry

                                                                       
theorem PartialOrderRelationIsTransitive
    {Carrier : Type u}
    (order : PartialOrderRelation Carrier) :
    LRA.Relation.Transitive order.relation := by
  sorry

end LRA.Order.OrderedSets.PartialOrder
