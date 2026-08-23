  
                                                             
                                                                                                     

                                                                     
                                         
  

import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits
import LRA.Analysis.Continuity.PointContinuity

namespace LRA.Analysis.Differentiation

                                                                     
                                                   

             

       
                                                                
                                                            
                                   
   
  
def Derivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ h : ℝ, c + h ∈ A → 0 < |h| → |h| < δ →
    |(f (c + h) - f c) / h - D| < ε

                                                                      
                                                         
                                                      

             

       
                                                                      
              
                                         
                                                      
   
  
def ZorichDerivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ α : ℝ → ℝ,
    LRA.Analysis.Limits.TendsTo α A c 0 ∧
      ∀ x ∈ A, f x = f c + D * (x - c) + α x * (x - c)

                                                                         
                                                                       
            

             

       
                                                              
                         
   
  
def IsDifferentiable (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ D, Derivative D f A c

                                                                   
                                                                        

             

       
                                                                   
                                                                                           
                                                    
   
  
def DerivativeTop (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ U : Set ℝ, (∃ δ > 0, U = LRA.Analysis.Continuity.RelativeNeighborhood A c δ) ∧
    ∀ x ∈ U, x ≠ c → |(f x - f c) / (x - c) - D| < ε

                                                                        
                                                                         
                                       

             

       
                                                                   
                                                   
                                                 
                                                                      
   
  
def DerivativeSeq (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ A) → (∀ n, xs n ≠ c) →
    (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε) →
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |(f (xs n) - f c) / (xs n - c) - D| < ε

                               
                                                                                                   
                                 

             

       
                                                                       
                                                                      
   
  
theorem DerivativeEquivalence (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    Derivative D f A c ↔ DerivativeTop D f A c ∧ DerivativeSeq D f A c := by
  sorry

                                                                                                   
                                                                            

             

       
                                                                            
                        
                                                             
                                        
   
  
theorem DerivativeHFormEquivalence (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    Derivative D f A c ↔
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ →
        |(f x - f c) / (x - c) - D| < ε) := by
  sorry

                                          
                                                                                      
                                                  

             

       
                                                                       
                                  
                                                   
   
  
theorem DifferentiableImpliesContinuous (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : IsDifferentiable f A c) :
    LRA.Analysis.Continuity.ContinuousAtPoint f A c := by
  sorry

                                     
                                                                            
                                                                                        
                                     

             

       
                                                              
                                                                           
                                                                   
   
  
theorem DerivativeUnique (f : ℝ → ℝ) (A : Set ℝ) (c D₁ D₂ : ℝ)
    (hacc : ∃ xs : ℕ → ℝ, LRA.Analysis.Limits.ApproachesButNotEqual xs A c)
    (h₁ : Derivative D₁ f A c) (h₂ : Derivative D₂ f A c) : D₁ = D₂ := by
  sorry

end LRA.Analysis.Differentiation
