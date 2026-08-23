import LRA.Order
import LRA.Set.Interop.Mathlib.PredicateSet

   
                                                      

                                                                        
                                                                          
                                                 

                                                                       
                                                                      
  

universe u v w x

                                      

namespace LRA.Order

   
                                                                    
  

                                                                           
def NaturalAdditionForOrderCompatibility :
    LRA.Operation.BinaryEndoOperation Nat :=
  fun left right => left + right

   
                                                                 

                                                           
  
theorem NaturalAdditionRightTranslationPreservesLessEqual :
    RightTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalAdditionForOrderCompatibility := by
  sorry

                                                                               
def NaturalSubtractionForOrderCompatibilityExample :
    LRA.Operation.BinaryEndoOperation Nat :=
  fun left right => left - right

   
                                                                    

                                                                
  
theorem NaturalSubtractionRightTranslationPreservesLessEqual :
    RightTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalSubtractionForOrderCompatibilityExample := by
  sorry

end LRA.Order

                                   

namespace LRA.Order.OrderedSets.PartialOrder

   
                                                                        
                                                             

             

       
                                                              
   
  
theorem NaturalNumberLessEqualIsPartialOrder :
    LRA.Order.PartialOrder (fun left right : Nat => left <= right) := by
  sorry

   
                                    

                                                                                    

             

       
                         
   
  
def NaturalNumberNonStrictPartialOrder :
    NonStrictPartialOrder Nat where
  relation := fun left right => left <= right
  relationIsPartialOrder := NaturalNumberLessEqualIsPartialOrder

   
                                                                                      
                   

             

       
                                                                  
   
  
example :
    LRA.Order.PartialOrder
      NaturalNumberNonStrictPartialOrder.relation := by
  exact NaturalNumberNonStrictPartialOrder.relationIsPartialOrder

   
                                                                      
                                 

             

       
                                                              
   
  
theorem BooleanEqualityIsPartialOrder :
    LRA.Order.PartialOrder (fun left right : Bool => left = right) := by
  sorry

   
                                      

                                                              

             

       
                          
   
  
def BooleanEqualityNonStrictPartialOrder :
    NonStrictPartialOrder Bool where
  relation := fun left right => left = right
  relationIsPartialOrder := BooleanEqualityIsPartialOrder

   
                                                                                        
                   

             

       
                                                                    
   
  
example :
    LRA.Order.PartialOrder
      BooleanEqualityNonStrictPartialOrder.relation := by
  exact BooleanEqualityNonStrictPartialOrder.relationIsPartialOrder

   
                                                                               
                                                                

                                                                              
  
theorem DivisibilityIsPartialOrder :
    LRA.Order.PartialOrder
      (fun left right : Nat => left ∣ right) := by
  sorry

   
                                                             

                                                                                    
  
theorem PredicateSetInclusionIsPartialOrder (Alpha : Type u) :
    LRA.Order.PartialOrder
      (fun left right : Set Alpha => left ⊆ right) := by
  sorry

end LRA.Order.OrderedSets.PartialOrder

                            

namespace LRA.Order.OrderedSets.Poset

   
                                                                      
                   

             

       
                                                              
   
  
theorem NaturalNumberOrderIsPartialOrder :
    LRA.Order.PartialOrder (fun left right : Nat => left <= right) := by
  sorry

   
                    

                                                                              

             

       
                     
                
                                                   
   
  
def NaturalNumberPoset : LRA.Order.Poset where
  Carrier := Nat
  NonStrictOrder := fun left right => left <= right
  NonStrictOrderIsPartialOrder := NaturalNumberOrderIsPartialOrder

   
                                                                                          

             

       
                                                        
   
  
example :
    LRA.Order.PartialOrder NaturalNumberPoset.NonStrictOrder := by
  exact NaturalNumberPoset.NonStrictOrderIsPartialOrder

end LRA.Order.OrderedSets.Poset

                               

namespace LRA.Order.OrderedSets.Preorder

   
                                                                          

             

       
                                           
   
  
theorem BooleanUniversalRelationIsPreorder :
    LRA.Order.Preorder (fun _ _ : Bool => True) := by
  sorry

   
                          

                                                            

             

       
                     
   
  
def BooleanUniversalPreorder : PreorderRelation Bool where
  relation := fun _ _ => True
  isPreorder := BooleanUniversalRelationIsPreorder

   
                                                                           

                                                                     
  
example : LRA.Order.Preorder BooleanUniversalPreorder.relation := by
  exact BooleanUniversalPreorder.isPreorder

end LRA.Order.OrderedSets.Preorder

                                  

namespace LRA.Order.OrderedSets.StrictOrder

   
                                                                               
     

             

       
                                                            
   
  
theorem NaturalNumberLessThanIsStrictOrder :
    LRA.Order.StrictOrder (fun left right : Nat => left < right) := by
  sorry

   
                          

                                                                       

             

       
                       
   
  
def NaturalNumberStrictOrder :
    StrictOrderRelation Nat where
  relation := fun left right => left < right
  relationIsStrictOrder := NaturalNumberLessThanIsStrictOrder

   
                                                                                         
     

             

       
                                                       
   
  
example :
    LRA.Order.StrictOrder NaturalNumberStrictOrder.relation := by
  exact NaturalNumberStrictOrder.relationIsStrictOrder

end LRA.Order.OrderedSets.StrictOrder
