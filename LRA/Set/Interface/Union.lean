namespace LRA.Set

universe u

   
                                                 

                                                                
                                                                         
                                                                       
                                                                 
          

                                                                         
                                                                        
                                                                    
                                                                      

                                                                       
                                                                        
                                                                   
                                   
  
   
                                            

             

       
                            
                                                            
                                             
                                                           
                                       
                                       
                                      
                 
                                                            
                                                      
   
  

class UnionLaws (α : Type u)
    [Union α] [EmptyCollection α] [HasSubset α] : Prop where
  UnionCommutative : ∀ A B : α, A ∪ B = B ∪ A
  UnionAssociative : ∀ A B C : α, (A ∪ B) ∪ C = A ∪ (B ∪ C)
  EmptyUnion : ∀ A : α, (∅ : α) ∪ A = A
  UnionEmpty : ∀ A : α, A ∪ (∅ : α) = A
  UnionIdempotent : ∀ A : α, A ∪ A = A
  UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂
  SubsetIffUnionEqRight : ∀ A B : α, A ⊆ B ↔ A ∪ B = B

variable {α : Type u} [Union α] [EmptyCollection α] [HasSubset α]
variable [UnionLaws α]
   
                                                        

             

       
                                                   
   
  
theorem UnionCommutative : ∀ A B : α, A ∪ B = B ∪ A := by
  sorry

   
                     

             

       
                                                                 
   
  
theorem UnionAssociative : ∀ A B C : α, (A ∪ B) ∪ C = A ∪ (B ∪ C) := by
  sorry

   
                                           

             

       
                                             
   
  
theorem EmptyUnion : ∀ A : α, (∅ : α) ∪ A = A := by
  sorry

   
                                            

             

       
                                             
   
  
theorem UnionEmpty : ∀ A : α, A ∪ (∅ : α) = A := by
  sorry

   
                    

             

       
                                            
   
  
theorem UnionIdempotent : ∀ A : α, A ∪ A = A := by
  sorry

   
                                    

             

       
                       
                                                            
   
  
theorem UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : α, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂ := by
  sorry

   
                                                                 

             

       
                                                            
   
  
theorem SubsetIffUnionEqRight : ∀ A B : α, A ⊆ B ↔ A ∪ B = B := by
  sorry

end LRA.Set
