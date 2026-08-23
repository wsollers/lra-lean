import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.LimitsAtInfinity.Definition

   
                                                                                          
                                                                         
                                                               
  

namespace LRA.Analysis.Limits

                                                                                                     
                                                      

             

       
                                                              
                              
                                                                   
   
  
theorem TendstoInftyUnique (f : ℝ → ℝ) (X : Set ℝ) (L₁ L₂ : ℝ)
    (hX : PlusInftyAdherent X)
    (h₁ : TendsToInfty f X L₁) (h₂ : TendsToInfty f X L₂) : L₁ = L₂ := by
  sorry

                                                                                       
                                                                           

             

       
                                                                 
                               
                                                                         
   
  
theorem TendstoNegInftyUnique (f : ℝ → ℝ) (X : Set ℝ) (L₁ L₂ : ℝ)
    (hX : MinusInftyAdherent X)
    (h₁ : TendsToNegInfty f X L₁) (h₂ : TendsToNegInfty f X L₂) : L₁ = L₂ := by
  sorry

                                                                                                  
                               

             

       
                                                                         
                                                                             
   
  
theorem LimitAtNegInfinityIffReflection (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) :
    TendsToNegInfty f X L ↔ TendsToInfty (fun x => f (-x)) {x : ℝ | -x ∈ X} L := by
  sorry

                                                                        
                                          
                                                                        

section AlgebraOfLimitsAtInfinity

variable {f g : ℝ → ℝ} {X : Set ℝ} {Lf Lg c : ℝ}

                                                                                                    
                  

             

       
                                                                               
                                                 
   
  
theorem TendstoInftyAdd (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg) :
    TendsToInfty (fun x => f x + g x) X (Lf + Lg) := by
  sorry

                                                                                                    
                  

             

       
                                                                               
                                                 
   
  
theorem TendstoInftySub (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg) :
    TendsToInfty (fun x => f x - g x) X (Lf - Lg) := by
  sorry

                                                                                                  

             

       
                                                               
                                              
   
  
theorem TendstoInftyScalar (hf : TendsToInfty f X Lf) (c : ℝ) :
    TendsToInfty (fun x => c * f x) X (c * Lf) := by
  sorry

                                                                                                    
                  

             

       
                                                                               
                                                 
   
  
theorem TendstoInftyMul (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg) :
    TendsToInfty (fun x => f x * g x) X (Lf * Lg) := by
  sorry

                                                                                       
                                                

             

       
                                                                             
                    
                                                 
   
  
theorem TendstoInftyDiv (hf : TendsToInfty f X Lf) (hg : TendsToInfty g X Lg)
    (hLg : Lg ≠ 0) :
    TendsToInfty (fun x => f x / g x) X (Lf / Lg) := by
  sorry

end AlgebraOfLimitsAtInfinity

                                                                        
                                                        
                                                                        

                                                                                        
                                                                                               
                         

             

       
                                                                       
                                    
                        
                                                         
                                                     
   
  
theorem SequentialCriterionTendstoInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ)
    (hX : ∀ M : ℝ, ∃ x ∈ X, x > M) :
    TendsToInfty f X L ↔
      ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ X) → EscapesToInfty xs →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - L| < ε := by
  sorry

end LRA.Analysis.Limits
