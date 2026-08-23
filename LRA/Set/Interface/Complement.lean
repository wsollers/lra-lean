import LRA.Set.Interface.Operations
import LRA.Set.Interface.Union
import LRA.Set.Interface.Intersection

namespace LRA.Set

universe u

   
                                                                      
                                                                   

                                                                       
                                                                       
                                                                   
                                                                      
                                                                 
                                                                   
                                                                         
                                                                

                                                                      
                                                         
                                                                         
                                       
  
   
                                                 

             

       
                                 
                                                                    
                                    
                                     
                                      
                                          
                                             
                                                    
                                               
                                                      
                                                                
                                                      
                                                 
   
  

class ComplementLaws (α : Type u)
    [HasComplement α] [HasUniversal α] [Union α] [Inter α] [SDiff α]
    [EmptyCollection α] : Prop where
  DoubleComplement : ∀ A : α, Aᶜᶜ = A
  ComplementEmpty : (∅ : α)ᶜ = (𝒰 : α)
  ComplementUniversal : (𝒰 : α)ᶜ = (∅ : α)
  UnionComplement : ∀ A : α, A ∪ Aᶜ = (𝒰 : α)
  IntersectionComplement : ∀ A : α, A ∩ Aᶜ = (∅ : α)
  DeMorganUnion : ∀ A B : α, (A ∪ B)ᶜ = Aᶜ ∩ Bᶜ
  DeMorganIntersection : ∀ A B : α, (A ∩ B)ᶜ = Aᶜ ∪ Bᶜ
  DifferenceAsIntersectionComplement : ∀ A B : α, A \ B = A ∩ Bᶜ
  DifferenceUniversal : ∀ A : α, A \ (𝒰 : α) = (∅ : α)
  UniversalDifference : ∀ A : α, (𝒰 : α) \ A = Aᶜ

variable {α : Type u}
variable [HasComplement α] [HasUniversal α] [Union α] [Inter α]
variable [SDiff α] [EmptyCollection α]
variable [ComplementLaws α]
   
                                       

             

       
                                           
   
  
theorem DoubleComplement : ∀ A : α, Aᶜᶜ = A := by
  sorry

   
                                                     

             

       
                                            
   
  
theorem ComplementEmpty : (∅ : α)ᶜ = (𝒰 : α) := by
  sorry

   
                                                     

             

       
                                                
   
  
theorem ComplementUniversal : (𝒰 : α)ᶜ = (∅ : α) := by
  sorry

   
                                       

             

       
                                                   
   
  
theorem UnionComplement : ∀ A : α, A ∪ Aᶜ = (𝒰 : α) := by
  sorry

   
                                         

             

       
                                                          
   
  
theorem IntersectionComplement : ∀ A : α, A ∩ Aᶜ = (∅ : α) := by
  sorry

   
                                

             

       
                                                     
   
  
theorem DeMorganUnion : ∀ A B : α, (A ∪ B)ᶜ = Aᶜ ∩ Bᶜ := by
  sorry

   
                                

             

       
                                                            
   
  
theorem DeMorganIntersection : ∀ A B : α, (A ∩ B)ᶜ = Aᶜ ∪ Bᶜ := by
  sorry

   
                                                                 

             

       
                                            
                             
   
  
theorem DifferenceAsIntersectionComplement :
    ∀ A B : α, A \ B = A ∩ Bᶜ := by
  sorry

   
                                                

             

       
                                                            
   
  
theorem DifferenceUniversal : ∀ A : α, A \ (𝒰 : α) = (∅ : α) := by
  sorry

   
                                                             

             

       
                                                       
   
  
theorem UniversalDifference : ∀ A : α, (𝒰 : α) \ A = Aᶜ := by
  sorry

   
                                                         
                                                                      
                                                                            
                                                                 
                                                                  
                                                                 
                                                     

             

       
                          
   
  
def Dual (A : α) : α := Aᶜ

   
                                                     

                                                                 
                                                                   
                                                                       
                                                                      
                                                                    
                                                                

             

       
                                                                       
                                      
   
  
theorem DualAntitone [HasSubset α] [UnionLaws α] [IntersectionLaws α] :
    ∀ A B : α, A ⊆ B ↔ Dual B ⊆ Dual A := by
  sorry

   
                                                                       
                                                                    

             

       
                                                             
   
  
theorem DualUnion : ∀ A B : α, Dual (A ∪ B) = Dual A ∩ Dual B :=
  DeMorganUnion

   
                                                                       
                                                                
          

             

       
                                                                    
   
  
theorem DualIntersection : ∀ A B : α, Dual (A ∩ B) = Dual A ∪ Dual B :=
  DeMorganIntersection

   
                                                                       
                                                   

             

       
                                                   
   
  
theorem DualInvolutive : ∀ A : α, Dual (Dual A) = A :=
  DoubleComplement

end LRA.Set
