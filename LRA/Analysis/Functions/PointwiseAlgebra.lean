  
                                                             
                                                                   
                                                            

                                                                    
                                                               
                                                                   
                                                                   
                                                                     
                           

                                                                    
                                                               
                                                                       
                                                                        
                                                                      
                                                                        

                                                                       
                                                                       
                                                                    
                                                                    
                                                                      
                                                                        
                                                                      
                                                   
  

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Functions

                                     

             

       
                                                            
   
  
def PointwiseSum (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x + g x

                                            

             

       
                                                             
   
  
def PointwiseDiff (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x - g x

                                         

             

       
                                                             
   
  
def PointwiseProd (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x * g x

                                                  

             

       
                                                                          
   
  
def PointwiseScalarMul (lam : ℝ) (f : ℝ → ℝ) : ℝ → ℝ := fun x => lam * f x

                                                 

             

       
                                                      
   
  
def PointwiseAbs (f : ℝ → ℝ) : ℝ → ℝ := fun x => |f x|

                                             

             

       
                                                                  
   
  
def PointwiseMax (f g : ℝ → ℝ) : ℝ → ℝ := fun x => max (f x) (g x)

                                             

             

       
                                                                  
   
  
def PointwiseMin (f g : ℝ → ℝ) : ℝ → ℝ := fun x => min (f x) (g x)

                                                                     
                                                                 
                                                          

             

       
                                                                               
   
  
noncomputable def PointwiseQuotient (f g : ℝ → ℝ) : ℝ → ℝ := fun x => f x / g x

                                             

             

       
                                                                             
   
  
noncomputable def PointwiseReciprocal (f : ℝ → ℝ) : ℝ → ℝ := fun x => 1 / f x

                                 
                                                                                                    
                                                                                                
                                                                                              
                                                                                         

             

       
                                                                    
                                               
                                                  
                                                  
                                                         
                                           
                                                       
                                                     
   
  
theorem FunctionAlgebraClosure (f g : ℝ → ℝ) (lam : ℝ) (A : Set ℝ) :
    (∀ x ∈ A, PointwiseSum f g x = f x + g x) ∧
      (∀ x ∈ A, PointwiseDiff f g x = f x - g x) ∧
      (∀ x ∈ A, PointwiseProd f g x = f x * g x) ∧
      (∀ x ∈ A, PointwiseScalarMul lam f x = lam * f x) ∧
      (∀ x ∈ A, PointwiseAbs f x = |f x|) ∧
      (∀ x ∈ A, PointwiseMax f g x = max (f x) (g x)) ∧
      (∀ x ∈ A, PointwiseMin f g x = min (f x) (g x)) := by
  sorry

                                  
                                                                                                    
                 

             

       
                                                         
                                                                         
   
  
theorem FunctionQuotientClosure (f g : ℝ → ℝ) (A : Set ℝ)
    (h : ∀ x ∈ A, g x ≠ 0) : ∀ x ∈ A, PointwiseQuotient f g x = f x / g x := by
  sorry

                                                                                                    
                                                          

             

       
                                                                        
                                                                 
                                                        
   
  
theorem PointwiseMaxMinAbsoluteValueFormulas (f g : ℝ → ℝ) (A : Set ℝ) :
    ∀ x ∈ A, PointwiseMax f g x = (f x + g x + |f x - g x|) / 2 ∧
      PointwiseMin f g x = (f x + g x - |f x - g x|) / 2 := by
  sorry

                                                                                                   
                                                             

             

       
                                                         
                                                                  
                                                         
   
  
theorem PointwiseMaxMinBounds (f g : ℝ → ℝ) (A : Set ℝ) :
    ∀ x ∈ A, PointwiseMin f g x ≤ f x ∧ f x ≤ PointwiseMax f g x ∧
      PointwiseMin f g x ≤ g x ∧ g x ≤ PointwiseMax f g x := by
  sorry

                                                                                                   
                 

             

       
                                                              
                                                         
                        
   
  
theorem QuotientUndefinedWhenDenominatorVanishes (f g : ℝ → ℝ)
    (A : Set ℝ) (x₀ : ℝ) (hx₀ : x₀ ∈ A) (hg : g x₀ = 0) :
    ¬ (∀ x ∈ A, g x ≠ 0) := by
  sorry

end LRA.Analysis.Functions
