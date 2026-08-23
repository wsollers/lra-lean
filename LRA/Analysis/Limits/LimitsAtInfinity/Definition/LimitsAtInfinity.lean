  
                                                                                          
                                                     
  

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Limits

                                                                    
                                                                 
                                                                       

             

       
                                                                   
   
  
def PlusInftyAdherent (A : Set ℝ) : Prop := ∀ M : ℝ, ∃ x ∈ A, x > M

   
                                                                           

             

       
                                                                    
   
  
def MinusInftyAdherent (A : Set ℝ) : Prop := ∀ M : ℝ, ∃ x ∈ A, x < M

                                                                    
                       

             

       
                                                          
                                                  
   
  
def TendsToInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ M : ℝ, ∀ x ∈ X, x > M → |f x - L| < ε

                                                                   
                                                

             

       
                                                             
                                                  
   
  
def TendsToNegInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ M : ℝ, ∀ x ∈ X, x < M → |f x - L| < ε

                                                                       
                                                                     
                                             

             

       
                                         
                                     
   
  
def EscapesToInfty (xs : ℕ → ℝ) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, xs n > M

end LRA.Analysis.Limits
