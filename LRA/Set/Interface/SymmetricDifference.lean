import LRA.Set.Interface.Operations

namespace LRA.Set

universe u

   
                                                                     
                                                   

                                                                           
                                                                     
                                                                          
                                                                   
                                                                      
  
   
                                               

             

       
                               
                                                                     
                              
                                         
                                        
                                                    
                                        
                                                           
                                  
                                          
                                                     
                                                     
                                                    
                                 
                                      
                                                           
   
  

class SymmDiffLaws (α : Type u)
    [HasSymmDiff α] [Union α] [Inter α] [SDiff α] [EmptyCollection α]
    [HasSubset α] : Prop where
  SymmetricDifferenceAsUnionDifferences :
    ∀ A B : α, A ∆ B = (A \ B) ∪ (B \ A)
  SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : α, A ∆ B = (A ∪ B) \ (A ∩ B)
  SymmetricDifferenceCommutative : ∀ A B : α, A ∆ B = B ∆ A
  SymmetricDifferenceAssociative :
    ∀ A B C : α, (A ∆ B) ∆ C = A ∆ (B ∆ C)
  SymmetricDifferenceEmpty : ∀ A : α, A ∆ (∅ : α) = A
  EmptySymmetricDifference : ∀ A : α, (∅ : α) ∆ A = A
  SymmetricDifferenceSelf : ∀ A : α, A ∆ A = (∅ : α)
  SymmetricDifferenceEqEmptyIff :
    ∀ A B : α, A ∆ B = (∅ : α) ↔ A = B
  SymmetricDifferenceSubsetUnion : ∀ A B : α, A ∆ B ⊆ A ∪ B

variable {α : Type u}
variable [HasSymmDiff α] [Union α] [Inter α] [SDiff α]
variable [EmptyCollection α] [HasSubset α]
variable [SymmDiffLaws α]
   
                                                     

             

       
                                               
                                        
   
  
theorem SymmetricDifferenceAsUnionDifferences :
    ∀ A B : α, A ∆ B = (A \ B) ∪ (B \ A) := by
  sorry

   
                                            

             

       
                                                          
                                        
   
  
theorem SymmetricDifferenceAsUnionDifferenceIntersection :
    ∀ A B : α, A ∆ B = (A ∪ B) \ (A ∩ B) := by
  sorry

   
                                    

             

       
                                                                 
   
  
theorem SymmetricDifferenceCommutative : ∀ A B : α, A ∆ B = B ∆ A := by
  sorry

   
                                    

             

       
                                        
                                          
   
  
theorem SymmetricDifferenceAssociative :
    ∀ A B C : α, (A ∆ B) ∆ C = A ∆ (B ∆ C) := by
  sorry

   
                                                           

             

       
                                                           
   
  
theorem SymmetricDifferenceEmpty : ∀ A : α, A ∆ (∅ : α) = A := by
  sorry

   
                                                          

             

       
                                                           
   
  
theorem EmptySymmetricDifference : ∀ A : α, (∅ : α) ∆ A = A := by
  sorry

   
                                                        

             

       
                                                          
   
  
theorem SymmetricDifferenceSelf : ∀ A : α, A ∆ A = (∅ : α) := by
  sorry

   
                                      

             

       
                                       
                                      
   
  
theorem SymmetricDifferenceEqEmptyIff :
    ∀ A B : α, A ∆ B = (∅ : α) ↔ A = B := by
  sorry

   
                               

             

       
                                                                 
   
  
theorem SymmetricDifferenceSubsetUnion : ∀ A B : α, A ∆ B ⊆ A ∪ B := by
  sorry

end LRA.Set
