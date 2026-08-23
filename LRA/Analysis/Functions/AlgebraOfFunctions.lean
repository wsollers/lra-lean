  
                                                             
                                                             
                                                                   
                                                                      
                                                                        
                
                                                                                                      
                                                                      
                                                                  
                                                                     
                                                                    
                                                                      
                                                                  
                                                                        
                                                                   
                                                                   
                                                                      
                                                                    

                                                                    
                                                                       
                                                                     
                                                                 
                                                   

                                                                    
                                                                         
                                                                     
                                                                    
                                                                      
                                                                      
                                                                        
                                     

                                                                 
                                                                       
                                                               
                                                                       
                                                                       
                                                                        
                                                                       
                                                                       
                                                                     
                                                                       
     

                                                                     
                                                                          
                                                                       
                                                                      
                                                                     
                                                                  
                                                                      
                                                                 
                                                                  
                                                                    
                                                                    
                                                                        
                                                                 
                                                                    
                                                                      
                                                                   

                                                                        
                                                                      
                                                                      
                                                 
  

import Mathlib.Logic.Function.Basic
import Mathlib.Data.Set.Basic

namespace LRA.Analysis.Functions

variable {A B C : Type*}

                                                       

             

       
                                                                          
   
  
def IsInjectiveOn (f : A → B) : Prop := ∀ a₁ a₂ : A, f a₁ = f a₂ → a₁ = a₂

                                                        

             

       
                                                                  
   
  
def IsSurjectiveOn (f : A → B) : Prop := ∀ b : B, ∃ a : A, f a = b

                                                       

             

       
                                                                          
   
  
def IsBijectiveOn (f : A → B) : Prop := IsInjectiveOn f ∧ IsSurjectiveOn f

                                                                    

             

       
                                                         
                                                 
   
  
def IsInverseFunctionOf (g : B → A) (f : A → B) : Prop :=
  (∀ a : A, g (f a) = a) ∧ (∀ b : B, f (g b) = b)

                                                                                         
                        

             

       
                                                    
                                                                         
   
  
theorem CompositionInjective {f : A → B} {g : B → C}
    (hf : IsInjectiveOn f) (hg : IsInjectiveOn g) : IsInjectiveOn (g ∘ f) := by
  sorry

                                                                                           
                         

             

       
                                                     
                                                     
                          
   
  
theorem CompositionSurjective {f : A → B} {g : B → C}
    (hf : IsSurjectiveOn f) (hg : IsSurjectiveOn g) :
    IsSurjectiveOn (g ∘ f) := by
  sorry

                                                                                         
                        

             

       
                                                    
                                                                         
   
  
theorem CompositionBijective {f : A → B} {g : B → C}
    (hf : IsBijectiveOn f) (hg : IsBijectiveOn g) : IsBijectiveOn (g ∘ f) := by
  sorry

                                                                                           
                 

             

       
                                                             
                                                          
   
  
theorem InverseBijection {f : A → B} (hf : IsBijectiveOn f) :
    ∃ g : B → A, IsInverseFunctionOf g f ∧ IsBijectiveOn g := by
  sorry

                                                                                                  
                                         

             

       
                                                             
                                       
                                         
                           
   
  
theorem PreimageUnionIntersection {f : A → B} (S T : Set B) :
    f ⁻¹' (S ∪ T) = f ⁻¹' S ∪ f ⁻¹' T ∧
      f ⁻¹' (S ∩ T) = f ⁻¹' S ∩ f ⁻¹' T ∧
      f ⁻¹' Sᶜ = (f ⁻¹' S)ᶜ := by
  sorry

end LRA.Analysis.Functions
