import LRA.Order.OrderedSets.PartialOrder.Characterizations
import LRA.Order.OrderedSets.Poset.Definition

namespace LRA.Order.OrderedSets.Poset

   
                                                          

             

       
                                           
   
  
theorem PosetOrderIsPartialOrder
    (poset : LRA.Order.Poset) :
    LRA.Order.PartialOrder poset.NonStrictOrder := by
  sorry

   
                                                    

             

       
                                           
   
  
theorem PosetOrderIsReflexive
    (poset : LRA.Order.Poset) :
    LRA.Relation.Reflexive poset.NonStrictOrder := by
  sorry

   
                                                        

             

       
                                               
   
  
theorem PosetOrderIsAntisymmetric
    (poset : LRA.Order.Poset) :
    LRA.Relation.Antisymmetric poset.NonStrictOrder := by
  sorry

   
                                                     

             

       
                                            
   
  
theorem PosetOrderIsTransitive
    (poset : LRA.Order.Poset) :
    LRA.Relation.Transitive poset.NonStrictOrder := by
  sorry

end LRA.Order.OrderedSets.Poset
