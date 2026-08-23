                                              
                                                                      
                                                             

import LRA.Set.Interface.CartesianProduct
import LRA.Set.Interface.RelationSets
import LRA.Set.Interface.Membership

namespace LRA.Set

universe u v

   
                                                    
                                                   
                                                                   
                                                                  
                                                            

                                                                   
                                                                  
                                                                       
                                                                   
                                                                      
                                                                      
                

                                                                      
                                                                       
                                                              
                                                             
                                     
  

section CartesianProductLaws

variable {Left Right Pair : Type u}
variable {DomainObject RangeObject RelationObject : Type v}
variable [HasPairing Left Right Pair] [HasSeparation Pair RelationObject]
variable [Membership Left DomainObject] [Membership Right RangeObject]
variable [Membership Pair RelationObject]
variable [SeparationLaws Pair RelationObject]
variable [PairingLaws Left Right Pair]

                                             

                                                                       
                                                                       

             

       
                                 
                                               
                                                            
                                                              
                                                                    
   
  
theorem RelatesCartesianProductOf
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) (a : Left) (b : Right) :
    Relates (CartesianProductOf left right ambientPairs) a b ↔
      (OrderedPair a b : Pair) ∈ ambientPairs ∧ a ∈ left ∧ b ∈ right := by
  sorry

                                                

                                                                    
                                                                  

             

       
                                    
                                               
                                     
                                                                      
   
  
theorem CartesianProductOfIsPairwise
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    IsPairwise Left Right (CartesianProductOf left right ambientPairs) := by
  sorry

variable [Union DomainObject] [Inter DomainObject] [SDiff DomainObject]
variable [EmptyCollection DomainObject] [HasSubset DomainObject]
variable [Union RangeObject] [Inter RangeObject] [SDiff RangeObject]
variable [EmptyCollection RangeObject] [HasSubset RangeObject]
variable [Union RelationObject] [Inter RelationObject] [SDiff RelationObject]
variable [EmptyCollection RelationObject] [HasSubset RelationObject]
variable [MembershipLaws Left DomainObject] [MembershipLaws Right RangeObject]
variable [MembershipLaws Pair RelationObject]

                                                                   
     

             

       
                                       
                                               
                                     
                                                             
   
  
theorem CartesianProductOfSubsetAmbient
    (left : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left right ambientPairs ⊆ ambientPairs := by
  sorry

                                                     

             

       
                                      
                                                         
                                                                    
                                                   
                                                  
   
  
theorem CartesianProductOfMonotoneLeft
    (smaller larger : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) (inclusion : smaller ⊆ larger) :
    CartesianProductOf smaller right ambientPairs ⊆
      CartesianProductOf larger right ambientPairs := by
  sorry

                                                      

             

       
                                       
                                                        
                                                                    
                                                  
                                                 
   
  
theorem CartesianProductOfMonotoneRight
    (left : DomainObject) (smaller larger : RangeObject)
    (ambientPairs : RelationObject) (inclusion : smaller ⊆ larger) :
    CartesianProductOf left smaller ambientPairs ⊆
      CartesianProductOf left larger ambientPairs := by
  sorry

                                                   

             

       
                                   
                                                           
                                                              
                          
   
  
theorem CartesianProductOfEmptyLeft
    (right : RangeObject) (ambientPairs : RelationObject) :
    CartesianProductOf (∅ : DomainObject) right ambientPairs =
      (∅ : RelationObject) := by
  sorry

                                                    

             

       
                                    
                                                           
                                                            
                          
   
  
theorem CartesianProductOfEmptyRight
    (left : DomainObject) (ambientPairs : RelationObject) :
    CartesianProductOf left (∅ : RangeObject) ambientPairs =
      (∅ : RelationObject) := by
  sorry

                                                          
                                    

             

       
                                   
                                                     
                                     
                                                          
                                                  
                                                   
   
  
theorem CartesianProductOfUnionLeft
    (left left' : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf (left ∪ left') right ambientPairs =
      CartesianProductOf left right ambientPairs ∪
        CartesianProductOf left' right ambientPairs := by
  sorry

                                                           
                                    

             

       
                                    
                                                      
                                     
                                                           
                                                  
                                                   
   
  
theorem CartesianProductOfUnionRight
    (left : DomainObject) (right right' : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left (right ∪ right') ambientPairs =
      CartesianProductOf left right ambientPairs ∪
        CartesianProductOf left right' ambientPairs := by
  sorry

                                                                 
                                    

             

       
                                          
                                                     
                                     
                                                          
                                                  
                                                   
   
  
theorem CartesianProductOfIntersectionLeft
    (left left' : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf (left ∩ left') right ambientPairs =
      CartesianProductOf left right ambientPairs ∩
        CartesianProductOf left' right ambientPairs := by
  sorry

                                                                  
                                    

             

       
                                           
                                                      
                                     
                                                           
                                                  
                                                   
   
  
theorem CartesianProductOfIntersectionRight
    (left : DomainObject) (right right' : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left (right ∩ right') ambientPairs =
      CartesianProductOf left right ambientPairs ∩
        CartesianProductOf left right' ambientPairs := by
  sorry

                                                                   
                                                                    
                                    

             

       
                                       
                                         
                                          
                                     
                                                          
                                                                
                        
                                                                        
   
  
theorem IntersectionOfCartesianProducts
    (leftFirst leftSecond : DomainObject)
    (rightFirst rightSecond : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf leftFirst rightFirst ambientPairs ∩
        CartesianProductOf leftSecond rightSecond ambientPairs =
      CartesianProductOf
        (leftFirst ∩ leftSecond) (rightFirst ∩ rightSecond) ambientPairs := by
  sorry

                                                               
                                    

             

       
                                        
                                                     
                                     
                                                          
                                                  
                                                   
   
  
theorem CartesianProductOfDifferenceLeft
    (left left' : DomainObject) (right : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf (left \ left') right ambientPairs =
      CartesianProductOf left right ambientPairs \
        CartesianProductOf left' right ambientPairs := by
  sorry

                                                                
                                    

             

       
                                         
                                                      
                                     
                                                           
                                                  
                                                   
   
  
theorem CartesianProductOfDifferenceRight
    (left : DomainObject) (right right' : RangeObject)
    (ambientPairs : RelationObject) :
    CartesianProductOf left (right \ right') ambientPairs =
      CartesianProductOf left right ambientPairs \
        CartesianProductOf left right' ambientPairs := by
  sorry

                                                                       
                                                                    
theorem CartesianProductOfCongr
    (leftFirst leftSecond : DomainObject)
    (rightFirst rightSecond : RangeObject)
    (ambientPairs : RelationObject)
    (sameLeft : ∀ a : Left, a ∈ leftFirst ↔ a ∈ leftSecond)
    (sameRight : ∀ b : Right, b ∈ rightFirst ↔ b ∈ rightSecond) :
    CartesianProductOf leftFirst rightFirst ambientPairs =
      CartesianProductOf leftSecond rightSecond ambientPairs := by
  sorry

end CartesianProductLaws

end LRA.Set
