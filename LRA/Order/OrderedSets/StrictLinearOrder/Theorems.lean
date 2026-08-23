import LRA.Order.OrderedSets.StrictLinearOrder.Definition

namespace LRA.Order

universe u

                                                       
theorem ExactlyTrichotomousImpliesIrreflexive
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsExactlyTrichotomous :
      LRA.Relation.ExactlyTrichotomous relation) :
    LRA.Relation.Irreflexive relation := by
  sorry

                                                   
theorem StrictLinearOrderIsStrictOrder
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsStrictLinearOrder : StrictLinearOrder relation) :
    StrictOrder relation := by
  sorry

                                                            
theorem StrictLinearOrderIsExactlyTrichotomous
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsStrictLinearOrder : StrictLinearOrder relation) :
    LRA.Relation.ExactlyTrichotomous relation := by
  sorry

end LRA.Order
