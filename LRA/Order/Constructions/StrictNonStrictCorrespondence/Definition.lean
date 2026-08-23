import LRA.Order.OrderedSets.PartialOrder.Definition
import LRA.Order.OrderedSets.Poset.Definition
import LRA.Order.OrderedSets.StrictOrder.Definition
import LRA.Order.OrderedSets.StrictPoset.Definition
import LRA.Order.Relation.StrictPart.Definition
import LRA.Order.Relation.LessThanOrEqual.Definition

namespace LRA.Order

universe u

                                            
def NonStrictFromStrict {Alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  LessThanOrEqual strictRelation

                                                  
def StrictFromNonStrict {Alpha : Type u}
    (nonStrictRelation : LRA.Relation.Endorelation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  StrictPart nonStrictRelation

                                                                        
theorem StrictRelationOfPosetIsStrictOrder (poset : Poset) :
    LRA.Order.StrictOrder (StrictFromNonStrict poset.NonStrictOrder) := by
  sorry

                                                                           
def StrictPosetOfPoset (poset : Poset) : StrictPoset where
  Carrier := poset.Carrier
  StrictRelation := StrictFromNonStrict poset.NonStrictOrder
  StrictRelationIsStrictOrder := StrictRelationOfPosetIsStrictOrder poset

                                                                                      
theorem NonStrictRelationOfStrictPosetIsPartialOrder
    (strictPoset : StrictPoset) :
    LRA.Order.PartialOrder
      (NonStrictFromStrict strictPoset.StrictRelation) := by
  sorry

                                                                               
def PosetOfStrictPoset (strictPoset : StrictPoset) : Poset where
  Carrier := strictPoset.Carrier
  NonStrictOrder := NonStrictFromStrict strictPoset.StrictRelation
  NonStrictOrderIsPartialOrder :=
    NonStrictRelationOfStrictPosetIsPartialOrder strictPoset

end LRA.Order
