  
                                                             
                                                               
                                          

                                                                       
                                                                        
                                                                     
                                                                  
                                                                 
                                                                     
                                                                 
                                                               

                                                                        
                                                                         
                                                                         
                                                                  
                                                                   
  

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Functions

                                    

             

       
                                                                      
   
  
def PointwiseEq (f g : ℝ → ℝ) (A : Set ℝ) : Prop := ∀ x ∈ A, f x = g x

                                                                         

             

       
                                                                      
   
  
def PointwiseLe (f g : ℝ → ℝ) (A : Set ℝ) : Prop := ∀ x ∈ A, f x ≤ g x

                                                                         

             

       
                                                                      
   
  
def PointwiseLt (f g : ℝ → ℝ) (A : Set ℝ) : Prop := ∀ x ∈ A, f x < g x

                             
                                                                                                 
                                                                                                
                      

             

       
                                        
                                      
                                                                                  
                                                                                  
   
  
theorem PointwiseOrderLaws (A : Set ℝ) :
    (∀ f : ℝ → ℝ, PointwiseLe f f A) ∧
      (∀ f g : ℝ → ℝ, PointwiseLe f g A → PointwiseLe g f A → PointwiseEq f g A) ∧
      (∀ f g h : ℝ → ℝ, PointwiseLe f g A → PointwiseLe g h A → PointwiseLe f h A) := by
  sorry

                                                                                            

             

       
                                                                 
                                               
   
  
theorem StrictPointwiseOrderImpliesWeak (f g : ℝ → ℝ) (A : Set ℝ)
    (h : PointwiseLt f g A) : PointwiseLe f g A := by
  sorry

                                   
                                                                                                  
                                                                                               
                                                                                                
                                                                                          
                                                           

             

       
                                                                  
                                                             
                                                             
                                                     
                           
                                                                  
                           
                                                                  
                                                               
   
  
theorem PointwiseOrderArithmetic (f g h f₂ g₂ : ℝ → ℝ) (A : Set ℝ)
    (hfg : PointwiseLe f g A) (hf₂g₂ : PointwiseLe f₂ g₂ A) :
    PointwiseLe (fun x => f x + h x) (fun x => g x + h x) A ∧
      PointwiseLe (fun x => -g x) (fun x => -f x) A ∧
      (∀ lam : ℝ, 0 ≤ lam →
        PointwiseLe (fun x => lam * f x) (fun x => lam * g x) A) ∧
      (∀ lam : ℝ, lam ≤ 0 →
        PointwiseLe (fun x => lam * g x) (fun x => lam * f x) A) ∧
      PointwiseLe (fun x => f x + f₂ x) (fun x => g x + g₂ x) A := by
  sorry

                                                                                                    
                                                                                             
   

             

       
                                                                          
                                          
                                            
                                                               
   
  
theorem PointwiseProductOrderNonnegative (f₁ g₁ f₂ g₂ : ℝ → ℝ) (A : Set ℝ)
    (h₁ : ∀ x ∈ A, 0 ≤ f₁ x ∧ f₁ x ≤ g₁ x)
    (h₂ : ∀ x ∈ A, 0 ≤ f₂ x ∧ f₂ x ≤ g₂ x) :
    PointwiseLe (fun x => f₁ x * f₂ x) (fun x => g₁ x * g₂ x) A := by
  sorry

                                                                                                    
                                    

             

       
                                                         
                                        
                                                       
   
  
theorem ReciprocalOrderReversal (f g : ℝ → ℝ) (A : Set ℝ)
    (h : ∀ x ∈ A, 0 < f x ∧ f x ≤ g x) :
    PointwiseLe (fun x => 1 / g x) (fun x => 1 / f x) A := by
  sorry

                                                                                                    
                                                                                             
   

             

       
                                                                     
                                          
                                            
                                                               
   
  
theorem QuotientOrderSignControlled (f₁ g₁ f₂ g₂ : ℝ → ℝ) (A : Set ℝ)
    (h₁ : ∀ x ∈ A, 0 ≤ f₁ x ∧ f₁ x ≤ g₁ x)
    (h₂ : ∀ x ∈ A, 0 < f₂ x ∧ f₂ x ≤ g₂ x) :
    PointwiseLe (fun x => f₁ x / g₂ x) (fun x => g₁ x / f₂ x) A := by
  sorry

                                                                                                    
                                                                    

             

       
                                         
                                          
                                                   
                                                                   
   
  
theorem NoUnconditionalQuotientOrderLaw :
    ¬ ∀ (f₁ g₁ f₂ g₂ : ℝ → ℝ) (A : Set ℝ),
        PointwiseLe f₁ g₁ A → PointwiseLe f₂ g₂ A →
        PointwiseLe (fun x => f₁ x / f₂ x) (fun x => g₁ x / g₂ x) A := by
  sorry

end LRA.Analysis.Functions
