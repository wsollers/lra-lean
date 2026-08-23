import LRA.Order.Relation.CoverRelation.Definition

namespace LRA.Order

universe u

                                                                     
theorem CoverRelationImpliesStrictRelation
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    {lower upper : Alpha}
    (lowerIsCoveredByUpper : CoverRelation strictRelation lower upper) :
    strictRelation lower upper := by
  sorry

   
                                                                             
                                                                             
             
  

end LRA.Order
