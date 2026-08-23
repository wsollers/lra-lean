import LRA.Order.OrderedSets.StrictOrder.Characterizations

namespace LRA.Order.OrderedSets.StrictOrder

                                                         
theorem StrictOrderDoesNotRelateSelf
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (element : Carrier) :
    Not (order.relation element element) := by
  sorry

                                               
theorem StrictOrderHasNoTwoElementCycles
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (left right : Carrier)
    (leftRelatedToRight : order.relation left right) :
    Not (order.relation right left) := by
  sorry

end LRA.Order.OrderedSets.StrictOrder
