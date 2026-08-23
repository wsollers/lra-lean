import LRA.Order.Constructions.StrictNonStrictCorrespondence.Definition
import LRA.Order.OrderedSets.LinearOrder.Definition
import LRA.Order.OrderedSets.StrictLinearOrder.Definition

namespace LRA.Order

universe u

                                                                 
theorem StrictOrderInducesPartialOrder
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    (strictRelationIsStrictOrder : StrictOrder strictRelation) :
    PartialOrder (NonStrictFromStrict strictRelation) := by
  sorry

                                                                
theorem PartialOrderInducesStrictOrder
    {Alpha : Type u}
    {nonStrictRelation : LRA.Relation.Endorelation Alpha}
    (nonStrictRelationIsPartialOrder : PartialOrder nonStrictRelation) :
    StrictOrder (StrictFromNonStrict nonStrictRelation) := by
  sorry

                                                                       
theorem StrictLinearOrderInducesLinearOrder
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    (strictRelationIsStrictLinearOrder : StrictLinearOrder strictRelation) :
    LinearOrder (NonStrictFromStrict strictRelation) := by
  sorry

                                                                             
theorem StrictNonStrictInverseCorrespondence
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    (strictRelationIsIrreflexive : LRA.Relation.Irreflexive strictRelation) :
    StrictFromNonStrict (NonStrictFromStrict strictRelation) = strictRelation := by
  sorry

                                                                           
theorem NonStrictStrictInverseCorrespondence
    {Alpha : Type u}
    {nonStrictRelation : LRA.Relation.Endorelation Alpha}
    (nonStrictRelationIsReflexive : LRA.Relation.Reflexive nonStrictRelation) :
    NonStrictFromStrict (StrictFromNonStrict nonStrictRelation) = nonStrictRelation := by
  sorry

                                                              
theorem PosetOfStrictPosetOfPoset (poset : Poset) :
    PosetOfStrictPoset (StrictPosetOfPoset poset) = poset := by
  sorry

                                                                         
theorem StrictPosetOfPosetOfStrictPoset (strictPoset : StrictPoset) :
    StrictPosetOfPoset (PosetOfStrictPoset strictPoset) = strictPoset := by
  sorry

end LRA.Order
