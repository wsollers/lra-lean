import LRA.Set.Interface.Operations

namespace LRA.Set

universe u v w

   
                                                                   
                                                              
                                                                   
                                                                  
          

                                                                   
                                                                      
                                                                       
                                                                      
                                                       
  

   
                                                                                      

             

       
                              
                                                                 
                         
                                                                    
                                             
                                                                 
                             
                                              
                                                         
                                               
                                    
                                              
                                         
                                                                          
                                                  
   
  
class CollectionMembershipLaws
    (Element : outParam (Type u)) (SetObject : outParam (Type v))
    (Collection : Type w)
    [Membership Element SetObject] [Membership SetObject Collection]
    [HasCollectionUnion SetObject Collection]
    [HasCollectionIntersection SetObject Collection] : Prop where
  CollectionUnionMembership :
    ∀ (collection : Collection) (x : Element),
      x ∈ HasCollectionUnion.collectionUnion collection ↔
        ∃ B : SetObject, B ∈ collection ∧ x ∈ B
  CollectionIntersectionMembership :
    ∀ (collection : Collection) (x : Element),
      (∃ B : SetObject, B ∈ collection) →
        (x ∈ HasCollectionIntersection.collectionIntersection collection ↔
          ∀ B : SetObject, B ∈ collection → x ∈ B)

section Wrappers

variable {Element : Type u} {SetObject : Type v} {Collection : Type w}
variable [Membership Element SetObject] [Membership SetObject Collection]
variable [HasCollectionUnion SetObject Collection]
variable [HasCollectionIntersection SetObject Collection]

                                                      

             

       
                                 
                                                           
                                             
                                                       
                                             
   
  
theorem CollectionUnionMembership
    [CollectionMembershipLaws Element SetObject Collection]
    (collection : Collection) (x : Element) :
    x ∈ HasCollectionUnion.collectionUnion collection ↔
      ∃ B : SetObject, B ∈ collection ∧ x ∈ B := by
  sorry

                                                                        

             

       
                                        
                                                           
                                           
                                                            
                                                                     
                                             
   
  
theorem CollectionIntersectionMembership
    [CollectionMembershipLaws Element SetObject Collection]
    (collection : Collection) (x : Element)
    (collectionNonempty : ∃ B : SetObject, B ∈ collection) :
    x ∈ HasCollectionIntersection.collectionIntersection collection ↔
      ∀ B : SetObject, B ∈ collection → x ∈ B := by
  sorry

end Wrappers

section Covers

variable {SetObject : Type v} {Collection : Type w}

                                                                        
      

             

       
                                
                                             
                                                            
                                                        
   
  
def Covers [HasSubset SetObject]
    [HasCollectionUnion SetObject Collection]
    (collection : Collection) (target : SetObject) : Prop :=
  target ⊆ HasCollectionUnion.collectionUnion collection

                                                                    

             

       
                                                         
                                             
                                                                          
                                                          
   
  
def Subcover [HasSubset SetObject] [HasSubset Collection]
    [HasCollectionUnion SetObject Collection]
    (subcollection collection : Collection) (target : SetObject) : Prop :=
  subcollection ⊆ collection ∧ Covers subcollection target

end Covers

end LRA.Set
