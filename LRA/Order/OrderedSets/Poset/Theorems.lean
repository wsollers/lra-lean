import LRA.Order.OrderedSets.Poset.Characterizations

namespace LRA.Order.OrderedSets.Poset

   
                                                                          

             

       
                                    
   
  
theorem PosetElementRelatesToItself
    (poset : LRA.Order.Poset)
    (element : poset.Carrier) :
    poset.NonStrictOrder element element := by
  sorry

   
                                                   

             

       
                                  
                                  
            
   
  
theorem PosetMutualOrderImpliesEqual
    (poset : LRA.Order.Poset)
    (left right : poset.Carrier)
    (leftBelowRight : poset.NonStrictOrder left right)
    (rightBelowLeft : poset.NonStrictOrder right left) :
    left = right := by
  sorry

   
                                                      

             

       
                                    
                                    
                                
   
  
theorem PosetOrderTrans
    (poset : LRA.Order.Poset)
    (first second third : poset.Carrier)
    (firstBelowSecond : poset.NonStrictOrder first second)
    (secondBelowThird : poset.NonStrictOrder second third) :
    poset.NonStrictOrder first third := by
  sorry

end LRA.Order.OrderedSets.Poset
