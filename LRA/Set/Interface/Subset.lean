namespace LRA.Set

universe u

   
                                                                 
                                         

                                                              
                                                                         
                                                                  
                                                                 
                                                
  
   
                                             

             

       
                                                        
                                  
                                                       
                                                               
   
  

class SubsetLaws (α : Type u) [HasSubset α] : Prop where
  SubsetReflexive : ∀ A : α, A ⊆ A
  SubsetTransitive : ∀ A B C : α, A ⊆ B → B ⊆ C → A ⊆ C
  SetEqualityIffMutualSubset : ∀ A B : α, A = B ↔ A ⊆ B ∧ B ⊆ A

variable {α : Type u} [HasSubset α] [SubsetLaws α]
   
                    

             

       
                                        
   
  
theorem SubsetReflexive : ∀ A : α, A ⊆ A := by
  sorry

   
                     

             

       
                                                             
   
  
theorem SubsetTransitive : ∀ A B C : α, A ⊆ B → B ⊆ C → A ⊆ C := by
  sorry

   
                                                              

             

       
                                                                     
   
  
theorem SetEqualityIffMutualSubset : ∀ A B : α, A = B ↔ A ⊆ B ∧ B ⊆ A := by
  sorry

end LRA.Set
