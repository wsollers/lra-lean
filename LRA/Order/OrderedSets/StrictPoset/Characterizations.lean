import LRA.Order.OrderedSets.StrictOrder.Characterizations
import LRA.Order.OrderedSets.StrictPoset.Definition

namespace LRA.Order.OrderedSets.StrictPoset

                                                                              
theorem StrictPosetRelationIsStrictOrder
    (poset : LRA.Order.StrictPoset) :
    LRA.Order.StrictOrder poset.StrictRelation := by
  sorry

                                                             
theorem StrictPosetRelationIsIrreflexive
    (poset : LRA.Order.StrictPoset) :
    LRA.Relation.Irreflexive poset.StrictRelation := by
  sorry

                                                            
theorem StrictPosetRelationIsTransitive
    (poset : LRA.Order.StrictPoset) :
    LRA.Relation.Transitive poset.StrictRelation := by
  sorry

end LRA.Order.OrderedSets.StrictPoset
