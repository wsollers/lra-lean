import LRA.Order.Bounds.LeastElement.Definition
import LRA.Order.OrderedSets.LinearOrder.Definition

namespace LRA.Order

universe u v

                                                                           
                                                                       

                                                                        
                                                                 
def WellOrder
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  LinearOrder relation /\
    forall subset : SetObject,
      (exists element, element ∈ subset) ->
        exists least, LeastElement relation subset least

end LRA.Order
