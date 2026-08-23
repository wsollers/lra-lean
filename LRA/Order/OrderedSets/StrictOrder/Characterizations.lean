import LRA.Order.OrderedSets.StrictOrder.Definition

namespace LRA.Order.OrderedSets.StrictOrder

                                                     
theorem StrictOrderIsIrreflexive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsStrictOrder : LRA.Order.StrictOrder relation) :
    LRA.Relation.Irreflexive relation := by
  sorry

                                                    
theorem StrictOrderIsTransitive
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsStrictOrder : LRA.Order.StrictOrder relation) :
    LRA.Relation.Transitive relation := by
  sorry

                                        
theorem StrictOrderIsAsymmetric
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsStrictOrder : LRA.Order.StrictOrder relation) :
    LRA.Relation.Asymmetric relation := by
  sorry

                                                      
theorem StrictOrderIsAntisymmetric
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier)
    (relationIsStrictOrder : LRA.Order.StrictOrder relation) :
    LRA.Relation.Antisymmetric relation := by
  sorry

                                                                       
theorem StrictOrderRelationIsIrreflexive
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Relation.Irreflexive order.relation := by
  sorry

end LRA.Order.OrderedSets.StrictOrder
