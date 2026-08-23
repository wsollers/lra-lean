  
                                                             
                                                                                               

                                                                  
                                         
  

import Mathlib.Data.Real.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition
import LRA.Analysis.Continuity.GlobalTheorems
import LRA.Analysis.Continuity.UniformContinuity

namespace LRA.Analysis.Differentiation

                       
                                                          
                                                                                   
                                                                                                
                     

             

       
                                                         
                                                                   
                                                                   
                        
                                                     
   
  
theorem RollesTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hfab : f a = f b) :
    ∃ c ∈ Set.Ioo a b, Derivative 0 f (Set.Ioo a b) c := by
  sorry

                           
                                                          
                                                                                    
                                                                                               
                       

             

       
                                                            
                                                                   
                                                                     
                                                                           
   
  
theorem MeanValueTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x) :
    ∃ c ∈ Set.Ioo a b, Derivative ((f b - f a) / (b - a)) f (Set.Ioo a b) c := by
  sorry

                                  
                                                             
                                                                 
                                                                                    
                                                                                               
                                                                                                
                                                                                               
                  

             

       
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                 
                                                                 
                                       
                                         
   
  
theorem CauchyMeanValueTheorem (f g : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hfcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hgcont : LRA.Analysis.Continuity.ContinuousOn' g (Set.Icc a b))
    (hfdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hgdiff : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x)
    (hgD : ∀ x ∈ Set.Ioo a b, ¬ Derivative 0 g (Set.Ioo a b) x) :
    ∃ c ∈ Set.Ioo a b, ∃ Df Dg, Derivative Df f (Set.Ioo a b) c ∧
      Derivative Dg g (Set.Ioo a b) c ∧
      Df * (g b - g a) = Dg * (f b - f a) := by
  sorry

                                            
                                                                                                    
                                                                       

             

       
                                                                                      
                                               
                                                             
   
  
theorem NondecreasingIffNonnegDerivative (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, IsDifferentiable f I x) :
    MonotoneOn f I ↔ ∀ x ∈ I, ∀ D, Derivative D f I x → D ≥ 0 := by
  sorry

                                                                                         
                                                                                             
                                                       

             

       
                                                                                     
                                                                  
                                                           
                                               
   
  
theorem DerivativeBoundImpliesLipschitz (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hdiff : ∀ x ∈ I, IsDifferentiable f I x) (M : ℝ) (hM : M ≥ 0)
    (hbound : ∀ x ∈ I, ∀ D, Derivative D f I x → |D| ≤ M) :
    LRA.Analysis.Continuity.IsLipschitzOn f I M := by
  sorry

end LRA.Analysis.Differentiation
