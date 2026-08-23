import LRA.Order.OrderedSets.WellOrder.Definition
import LRA.Order.Relation.StrictPart.Definition
import LRA.Relation.Properties.WellFounded

namespace LRA.Order

universe u v

                                                                             
                                                                     
             
theorem WellOrderIffLinearAndStrictPartWellFounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {nonStrictRelation : LRA.Relation.Endorelation Element} :
    WellOrder SetObject nonStrictRelation ↔
      LinearOrder nonStrictRelation /\
        LRA.Relation.WellFounded SetObject
          (StrictPart nonStrictRelation) := by
  sorry

   
                                                                            
                                                                             
  

end LRA.Order
