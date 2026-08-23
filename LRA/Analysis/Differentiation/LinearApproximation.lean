  
                                                             
                                                                                                   

                                                                    
                                                                        
                                                                       
                                                         
                                                                     
                              
  

import Mathlib.Data.Real.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition

namespace LRA.Analysis.Differentiation

                                                                 
                                                          

             

       
                                                          
                                                        
                                           
   
  
def HasLinearApproximation (f : ℝ → ℝ) (a L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x : ℝ, 0 < |x - a| → |x - a| < δ →
    |f x - f a - L * (x - a)| ≤ ε * |x - a|

                                                                                    
                              

             

       
                                                                                 
                                                              
   
  
theorem DifferentiableIffHasLinearApproximation (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    IsDifferentiable f A c ↔ ∃ L, HasLinearApproximation f c L := by
  sorry

                                                                                                 
                                            

             

       
                                                                              
                                                                           
         
   
  
theorem LinearApproximationSlopeEqDerivative (f : ℝ → ℝ) (A : Set ℝ) (c D : ℝ)
    (hD : Derivative D f A c) (L : ℝ) (hL : HasLinearApproximation f c L) :
    L = D := by
  sorry

end LRA.Analysis.Differentiation
