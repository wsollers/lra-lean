namespace LRA.Set

universe u

   
                                                                       
                                                                

                                                                         
                                                                    
                                                        
  
   
                                                   

             

       
                                   
                                                            
                                                    
                                                                  
                                                    
                                                    
                                             
                        
                                                            
                                                            
   
  

class IntersectionLaws (α : Type u)
    [Inter α] [EmptyCollection α] [HasSubset α] : Prop where
  IntersectionCommutative : ∀ A B : α, A ∩ B = B ∩ A
  IntersectionAssociative : ∀ A B C : α, (A ∩ B) ∩ C = A ∩ (B ∩ C)
  EmptyIntersection : ∀ A : α, (∅ : α) ∩ A = (∅ : α)
  IntersectionEmpty : ∀ A : α, A ∩ (∅ : α) = (∅ : α)
  IntersectionIdempotent : ∀ A : α, A ∩ A = A
  IntersectionMonotone :
    ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂
  SubsetIffIntersectionEqLeft : ∀ A B : α, A ⊆ B ↔ A ∩ B = A

variable {α : Type u} [Inter α] [EmptyCollection α] [HasSubset α]
variable [IntersectionLaws α]
   
                            

             

       
                                                          
   
  
theorem IntersectionCommutative : ∀ A B : α, A ∩ B = B ∩ A := by
  sorry

   
                            

             

       
                                 
                                          
   
  
theorem IntersectionAssociative :
    ∀ A B C : α, (A ∩ B) ∩ C = A ∩ (B ∩ C) := by
  sorry

   
                                                   

             

       
                                                          
   
  
theorem EmptyIntersection : ∀ A : α, (∅ : α) ∩ A = (∅ : α) := by
  sorry

   
                                                    

             

       
                                                          
   
  
theorem IntersectionEmpty : ∀ A : α, A ∩ (∅ : α) = (∅ : α) := by
  sorry

   
                           

             

       
                                                   
   
  
theorem IntersectionIdempotent : ∀ A : α, A ∩ A = A := by
  sorry

   
                                           

             

       
                              
                                                            
   
  
theorem IntersectionMonotone :
    ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂ := by
  sorry

                                                              
             

             

       
                                                                  
   
  
theorem SubsetIffIntersectionEqLeft : ∀ A B : α, A ⊆ B ↔ A ∩ B = A := by
  sorry

end LRA.Set
