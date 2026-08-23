namespace LRA.Set

universe u

   
                                                                    
                                                                       
                                                                      
                                                                     
                         
  
   
                                                     

             

       
                                                                      
                                    
                                                
                                    
                                                
                                                          
                                                          
   
  

class DistributivityLaws (α : Type u) [Union α] [Inter α] : Prop where
  IntersectionDistributesOverUnion :
    ∀ A B C : α, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
  UnionDistributesOverIntersection :
    ∀ A B C : α, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
  AbsorptionUnionIntersection : ∀ A B : α, A ∪ (A ∩ B) = A
  AbsorptionIntersectionUnion : ∀ A B : α, A ∩ (A ∪ B) = A

variable {α : Type u} [Union α] [Inter α] [DistributivityLaws α]
   
                                    

             

       
                                          
                                                
   
  
theorem IntersectionDistributesOverUnion :
    ∀ A B C : α, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) := by
  sorry

   
                                    

             

       
                                          
                                                
   
  
theorem UnionDistributesOverIntersection :
    ∀ A B C : α, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C) := by
  sorry

   
                              

             

       
                                                                
   
  
theorem AbsorptionUnionIntersection : ∀ A B : α, A ∪ (A ∩ B) = A := by
  sorry

   
                              

             

       
                                                                
   
  
theorem AbsorptionIntersectionUnion : ∀ A B : α, A ∩ (A ∪ B) = A := by
  sorry

end LRA.Set
