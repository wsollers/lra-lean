import LRA.Set.Interface.Operations

namespace LRA.Set

universe u v w

   
                                                                  
                                                                     
                                                                   
                                                

                                                                  
                                                                  
                                                  
  

   
                                                                                

             

       
                           
                                                      
                                  
                                                                    
              
                          
                                                                  
                                                                         
                                 
                                                                  
                                                             
                                 
   
  
class IndexedMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject] :
    Prop where
  IndexedUnionMembership :
    ∀ {Index : Type w} (family : Index → SetObject) (x : Element),
      x ∈ HasIndexedUnion.indexedUnion family ↔ ∃ index, x ∈ family index
  IndexedIntersectionMembership :
    ∀ {Index : Type w} (family : Index → SetObject) (x : Element),
      x ∈ HasIndexedIntersection.indexedIntersection family ↔
        ∀ index, x ∈ family index

   
                                                                                    

             

       
                             
                                                      
                                  
                                                                        
              
                            
                                               
                                                   
                                 
                                   
                                               
                                                                 
                                 
   
  
class CountableMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject]
    [HasCountableUnion SetObject] [HasCountableIntersection SetObject] :
    Prop where
  CountableUnionMembership :
    ∀ (family : Nat → SetObject) (x : Element),
      x ∈ HasCountableUnion.countableUnion family ↔
        ∃ index, x ∈ family index
  CountableIntersectionMembership :
    ∀ (family : Nat → SetObject) (x : Element),
      x ∈ HasCountableIntersection.countableIntersection family ↔
        ∀ index, x ∈ family index

section Wrappers

variable {Element : Type u} {SetObject : Type v}

                                   

             

       
                              
                                  
                                                                  
                                             
                                                                 
                                                                       
   
  
theorem IndexedUnionMembership
    [Membership Element SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    [IndexedMembershipLaws Element SetObject]
    {Index : Type w} (family : Index → SetObject) (x : Element) :
    x ∈ HasIndexedUnion.indexedUnion family ↔ ∃ index, x ∈ family index := by
  sorry

                                          

             

       
                                     
                                  
                                                                  
                                             
                                                                 
                                                           
                               
   
  
theorem IndexedIntersectionMembership
    [Membership Element SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    [IndexedMembershipLaws Element SetObject]
    {Index : Type w} (family : Index → SetObject) (x : Element) :
    x ∈ HasIndexedIntersection.indexedIntersection family ↔
      ∀ index, x ∈ family index := by
  sorry

                                    

             

       
                                
                                  
                                                                      
                                               
                                              
                                                 
                               
   
  
theorem CountableUnionMembership
    [Membership Element SetObject]
    [HasCountableUnion SetObject] [HasCountableIntersection SetObject]
    [CountableMembershipLaws Element SetObject]
    (family : Nat → SetObject) (x : Element) :
    x ∈ HasCountableUnion.countableUnion family ↔
      ∃ index, x ∈ family index := by
  sorry

                                           

             

       
                                       
                                  
                                                                      
                                               
                                              
                                                               
                               
   
  
theorem CountableIntersectionMembership
    [Membership Element SetObject]
    [HasCountableUnion SetObject] [HasCountableIntersection SetObject]
    [CountableMembershipLaws Element SetObject]
    (family : Nat → SetObject) (x : Element) :
    x ∈ HasCountableIntersection.countableIntersection family ↔
      ∀ index, x ∈ family index := by
  sorry

end Wrappers

end LRA.Set
