namespace LRA.Set

universe u

   
                                                                        
                                            

                                                            
                                                                      
                                                                    
                                                                      
                                                                    
                                 
  
   
                                                 

             

       
                                 
                                                                     
              
                          
                                            
                           
                                            
                                            
                                                  
                                           
                                                                
                                                                       
                              
                                                
                                     
                                                
                                             
                                                            
   
  

class DifferenceLaws (α : Type u)
    [SDiff α] [Union α] [Inter α] [EmptyCollection α] [HasSubset α] :
    Prop where
  DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : α, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B
  DifferenceAntitoneRight :
    ∀ A B₁ B₂ : α, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁
  DifferenceEmpty : ∀ A : α, A \ (∅ : α) = A
  EmptyDifference : ∀ A : α, (∅ : α) \ A = (∅ : α)
  DifferenceSelf : ∀ A : α, A \ A = (∅ : α)
  DifferenceUnion : ∀ A B C : α, A \ (B ∪ C) = (A \ B) ∩ (A \ C)
  DifferenceIntersection : ∀ A B C : α, A \ (B ∩ C) = (A \ B) ∪ (A \ C)
  UnionDifferenceDistributes :
    ∀ A B C : α, (A ∪ B) \ C = (A \ C) ∪ (B \ C)
  IntersectionDifferenceDistributes :
    ∀ A B C : α, (A ∩ B) \ C = (A \ C) ∩ (B \ C)
  DifferenceSubsetLeft : ∀ A B : α, A \ B ⊆ A
  DifferenceDisjointRight : ∀ A B : α, (A \ B) ∩ B = (∅ : α)

variable {α : Type u}
variable [SDiff α] [Union α] [Inter α] [EmptyCollection α] [HasSubset α]
variable [DifferenceLaws α]
   
                                            

             

       
                                
                                            
   
  
theorem DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : α, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B := by
  sorry

   
                                             

             

       
                                 
                                            
   
  
theorem DifferenceAntitoneRight :
    ∀ A B₁ B₂ : α, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁ := by
  sorry

   
                                 

             

       
                                                  
   
  
theorem DifferenceEmpty : ∀ A : α, A \ (∅ : α) = A := by
  sorry

   
                                      

             

       
                                                        
   
  
theorem EmptyDifference : ∀ A : α, (∅ : α) \ A = (∅ : α) := by
  sorry

   
                                          

             

       
                                                 
   
  
theorem DifferenceSelf : ∀ A : α, A \ A = (∅ : α) := by
  sorry

   
                                                            

             

       
                         
                                                
   
  
theorem DifferenceUnion :
    ∀ A B C : α, A \ (B ∪ C) = (A \ B) ∩ (A \ C) := by
  sorry

   
                                                            

             

       
                                
                                                
   
  
theorem DifferenceIntersection :
    ∀ A B C : α, A \ (B ∩ C) = (A \ B) ∪ (A \ C) := by
  sorry

   
                                              

             

       
                                    
                                                
   
  
theorem UnionDifferenceDistributes :
    ∀ A B C : α, (A ∪ B) \ C = (A \ C) ∪ (B \ C) := by
  sorry

   
                                                     

             

       
                                           
                                                
   
  
theorem IntersectionDifferenceDistributes :
    ∀ A B C : α, (A ∩ B) \ C = (A \ C) ∩ (B \ C) := by
  sorry

   
                           

             

       
                                                   
   
  
theorem DifferenceSubsetLeft : ∀ A B : α, A \ B ⊆ A := by
  sorry

   
                             

             

       
                                 
                                    
   
  
theorem DifferenceDisjointRight :
    ∀ A B : α, (A \ B) ∩ B = (∅ : α) := by
  sorry

end LRA.Set
