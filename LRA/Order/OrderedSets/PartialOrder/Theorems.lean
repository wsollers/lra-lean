import LRA.Order.OrderedSets.PartialOrder.Characterizations

namespace LRA.Order.OrderedSets.PartialOrder

   
                                                                               
      

             

       
                              
   
  
theorem NonStrictRelatesSelf
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (element : Carrier) :
    order.relation element element := by
  sorry

   
                                                                          
                

             

       
                            
                            
            
   
  
theorem NonStrictMutualRelationImpliesEqual
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier)
    (leftRelatedToRight : order.relation left right)
    (rightRelatedToLeft : order.relation right left) :
    left = right := by
  sorry

   
                                                                              
                                                      

             

       
                                                                      
   
  
theorem PartialOrderHasNoNontrivialTwoElementCycles
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier)
    (leftRelatedToRight : order.relation left right)
    (rightRelatedToLeft : order.relation right left) :
    left = right := by
  sorry

end LRA.Order.OrderedSets.PartialOrder
