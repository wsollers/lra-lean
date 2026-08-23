  
                                                             
                                                                                                     

                                                                     
                                         
  

import Mathlib.Data.Real.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition

namespace LRA.Analysis.Differentiation

                               

             

       
                                                                    
                                                
                                   
   
  
def LeftDerivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c →
    |(f x - f c) / (x - c) - D| < ε

                                

             

       
                                                                     
                                                
                                   
   
  
def RightDerivative (D : ℝ) (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ →
    |(f x - f c) / (x - c) - D| < ε

                                                    
                                                                                                   
                                   

             

       
                                                                                   
                            
                                                           
   
  
theorem DifferentiableIffOneSidedDerivativesAgree (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    IsDifferentiable f A c ↔
      ∃ D, LeftDerivative D f A c ∧ RightDerivative D f A c := by
  sorry

end LRA.Analysis.Differentiation
