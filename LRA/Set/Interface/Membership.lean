import LRA.Set.Interface.Operations

namespace LRA.Set

universe u v

   
                                                             

                                                                        
                                                                      
                                                                     
                                                                          
                                                                     
                                                   
                                                                       
                                                                   

                                                                   
                                                   
                                                                
                                                                    
                                                              
  

   
                                                                       

             

       
                                                                          
                                               
                     
                                                               
   
  
class ExtensionalityLaw (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] : Prop where
  SetExtensionality :
    ∀ {A B : SetObject}, (∀ x : Element, x ∈ A ↔ x ∈ B) → A = B

   
                                                                 

             

       
                                                                       
                                                                      
                                                                         
              
                                                      
                   
                                                                
                          
                                                                
                        
                                                                
                       
                                                           
   
  
class MembershipLaws (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject] :
    Prop where
  EmptyMembership : ∀ x : Element, x ∉ (∅ : SetObject)
  UnionMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B
  IntersectionMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∩ B ↔ x ∈ A ∧ x ∈ B
  DifferenceMembership :
    ∀ (A B : SetObject) (x : Element), x ∈ A \ B ↔ x ∈ A ∧ x ∉ B
  SubsetIffAllMembers :
    ∀ A B : SetObject, A ⊆ B ↔ ∀ x : Element, x ∈ A → x ∈ B

   
                                                                 

             

       
                                                                       
                                                                      
              
                        
                                                                
                                                                  
   
  
class SeparationLaws (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasSeparation Element SetObject] :
    Prop where
  SeparationMembership :
    ∀ (A : SetObject) (property : Element → Prop) (x : Element),
      x ∈ HasSeparation.separation A property ↔ x ∈ A ∧ property x

   
                                                                                    

             

       
                             
                                                      
                                                           
                                          
                                                          
                        
                                                   
   
  
class UniversalMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] : Prop where
  UniversalMembership : ∀ x : Element, x ∈ (𝒰 : SetObject)
  ComplementMembership :
    ∀ (A : SetObject) (x : Element), x ∈ Aᶜ ↔ x ∉ A

   
                                                                                   

             

       
                            
                                                      
                                                                       
                                 
                                      
                                                   
   
  
class SymmDiffMembershipLaws
    (Element : outParam (Type u)) (SetObject : Type v)
    [Membership Element SetObject] [HasSymmDiff SetObject] : Prop where
  SymmetricDifferenceMembership :
    ∀ (A B : SetObject) (x : Element),
      x ∈ A ∆ B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)

   
                                                                                  

             

       
                                                                       
                                                           
                                                   
                      
                                                                        
   
  
class PowersetMembershipLaws (SetObject : Type u) (Collection : Type v)
    [Membership SetObject Collection] [HasSubset SetObject]
    [HasPowerset SetObject Collection] : Prop where
  PowersetMembership :
    ∀ A B : SetObject, B ∈ (HasPowerset.powerset A : Collection) ↔ B ⊆ A

section Wrappers

variable {Element : Type u} {SetObject : Type v}

                                                                        
                                                                          
                                                                      
                                                       

             

       
                         
                                                                        
                                                                    
         
   
  
theorem SetExtensionality
    [Membership Element SetObject] [ExtensionalityLaw Element SetObject]
    {A B : SetObject} (sameMembers : ∀ x : Element, x ∈ A ↔ x ∈ B) :
    A = B := by
  sorry

                                         

             

       
                       
                                                                      
                                                                       
                                        
                                      
   
  
theorem EmptyMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ x : Element, x ∉ (∅ : SetObject) := by
  sorry

                          

             

       
                       
                                                                      
                                                                       
                                        
                                                                
   
  
theorem UnionMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B := by
  sorry

                                  

             

       
                              
                                                                      
                                                                       
                                        
                                                                
   
  
theorem IntersectionMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A ∩ B ↔ x ∈ A ∧ x ∈ B := by
  sorry

                               

             

       
                            
                                                                      
                                                                       
                                        
                                                                
   
  
theorem DifferenceMembership
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element), x ∈ A \ B ↔ x ∈ A ∧ x ∉ B := by
  sorry

                                           

             

       
                           
                                                                      
                                                                       
                                        
                                                           
   
  
theorem SubsetIffAllMembers
    [Membership Element SetObject] [Union SetObject] [Inter SetObject]
    [SDiff SetObject] [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject] :
    ∀ A B : SetObject, A ⊆ B ↔ ∀ x : Element, x ∈ A → x ∈ B := by
  sorry

                                     

             

       
                            
                                                                    
                                        
                                                                
                                                                  
   
  
theorem SeparationMembership
    [Membership Element SetObject] [HasSeparation Element SetObject]
    [SeparationLaws Element SetObject] :
    ∀ (A : SetObject) (property : Element → Prop) (x : Element),
      x ∈ HasSeparation.separation A property ↔ x ∈ A ∧ property x := by
  sorry

                                                

             

       
                           
                                                           
                                                                           
                                      
   
  
theorem UniversalMembership
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] [UniversalMembershipLaws Element SetObject] :
    ∀ x : Element, x ∈ (𝒰 : SetObject) := by
  sorry

                               

             

       
                            
                                                           
                                                                           
                                                   
   
  
theorem ComplementMembership
    [Membership Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject] [UniversalMembershipLaws Element SetObject] :
    ∀ (A : SetObject) (x : Element), x ∈ Aᶜ ↔ x ∉ A := by
  sorry

                                         

             

       
                                     
                                                          
                                                
                                      
                                                   
   
  
theorem SymmetricDifferenceMembership
    [Membership Element SetObject] [HasSymmDiff SetObject]
    [SymmDiffMembershipLaws Element SetObject] :
    ∀ (A B : SetObject) (x : Element),
      x ∈ A ∆ B ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A) := by
  sorry

                                                

             

       
                                                                     
                                                           
                                      
                                                   
                                                                        
   
  
theorem PowersetMembership {SetObject : Type u} {Collection : Type v}
    [Membership SetObject Collection] [HasSubset SetObject]
    [HasPowerset SetObject Collection]
    [PowersetMembershipLaws SetObject Collection] :
    ∀ A B : SetObject, B ∈ (HasPowerset.powerset A : Collection) ↔ B ⊆ A := by
  sorry

end Wrappers

end LRA.Set
