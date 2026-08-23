import LRA.Order.OrderedSets.PartialOrder.Relationships
import LRA.Order.OrderedSets.StrictOrder.Characterizations
import LRA.Order.Relation.LessThanOrEqual.Definition

namespace LRA.Order.OrderedSets.StrictOrder

universe u

                                               
def ReflexiveClosure
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.OrderedSets.OrderRelation Carrier :=
  LRA.Order.LessThanOrEqual order.relation

                                                                      
theorem ReflexiveClosureIff
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (left right : Carrier) :
    ReflexiveClosure order left right <->
      order.relation left right \/ left = right := by
  sorry

                                                                                         
theorem ReflexiveClosureRelationIsPartialOrder
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.PartialOrder (ReflexiveClosure order) := by
  sorry

                                                                                     
def ReflexiveClosureAsPartialOrder
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier where
  relation := ReflexiveClosure order
  relationIsPartialOrder := ReflexiveClosureRelationIsPartialOrder order

                                                                                
theorem ReflexiveClosureIsPartialOrder
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.PartialOrder (ReflexiveClosure order) := by
  sorry

                                                                                          
theorem StrictPartOfReflexiveClosureIff
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (left right : Carrier) :
    LRA.Order.OrderedSets.PartialOrder.StrictPart
      (ReflexiveClosureAsPartialOrder order) left right <->
      order.relation left right := by
  sorry

                                                                                              
theorem ReflexiveClosureOfStrictPartIff
    {Carrier : Type u}
    (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder
      Carrier)
    (left right : Carrier) :
    ReflexiveClosure
        (LRA.Order.OrderedSets.PartialOrder.StrictPartAsStrictOrder
          order) left right <->
      order.relation left right := by
  sorry

end LRA.Order.OrderedSets.StrictOrder
