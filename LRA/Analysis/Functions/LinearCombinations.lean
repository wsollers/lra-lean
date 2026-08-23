  
                                                             
                                                                
                                          

                                                                    
                                                                    
                                                                      
                                                                    
                                                                   
                                                                       
                                           

                                                                
                                                                       
                                                                       
                
  

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Functions

                                                      

             

       
                                                                             
   
  
def LinearCombo (a b : ℝ) (f g : ℝ → ℝ) : ℝ → ℝ := fun x => a * f x + b * g x

                                                                                                   
           

             

       
                                                                      
                                                      
   
  
theorem LinearCombinationClosure (f g : ℝ → ℝ) (a b : ℝ) (A : Set ℝ) :
    ∀ x ∈ A, LinearCombo a b f g x = a * f x + b * g x := by
  sorry

                                                                                                    
                                                                                 

             

       
                                                                    
                                                                           
                                                 
   
  
theorem BoundedLinearCombination (f g : ℝ → ℝ) (A : Set ℝ) (a b : ℝ)
    (hf : ∃ B > 0, ∀ x ∈ A, |f x| ≤ B) (hg : ∃ B > 0, ∀ x ∈ A, |g x| ≤ B) :
    ∃ B > 0, ∀ x ∈ A, |LinearCombo a b f g x| ≤ B := by
  sorry

                                                                   
                                                                     

             

       
                                                               
                                                           
   
  
def IsClosedUnderLinearCombinations (C : Set (ℝ → ℝ)) : Prop :=
  ∀ f g, f ∈ C → g ∈ C → ∀ a b : ℝ, LinearCombo a b f g ∈ C

                           

             

       
                                                                  
                                                                               
   
  
def IsRealLinearRule (C : Set (ℝ → ℝ)) (T : (ℝ → ℝ) → ℝ) : Prop :=
  ∀ f g, f ∈ C → g ∈ C → ∀ a b : ℝ, T (LinearCombo a b f g) = a * T f + b * T g

                                                                                               
                                                                                                
                                               

             

       
                                            
                                                                
                          
                                                                    
                                                               
   
  
theorem RealLinearRuleTest (C : Set (ℝ → ℝ))
    (hC : IsClosedUnderLinearCombinations C) (T : (ℝ → ℝ) → ℝ) :
    IsRealLinearRule C T ↔
      ((∀ f g, f ∈ C → g ∈ C → T (fun x => f x + g x) = T f + T g) ∧
        (∀ f, f ∈ C → ∀ a : ℝ, T (fun x => a * f x) = a * T f)) := by
  sorry

                                                                                            
                                                                                               
                                

             

       
                                                   
                                                              
                                                                   
                                                              
   
  
theorem RealLinearRuleBasicValues (C : Set (ℝ → ℝ))
    (hC : IsClosedUnderLinearCombinations C) (T : (ℝ → ℝ) → ℝ)
    (hT : IsRealLinearRule C T) (h0 : (fun _ : ℝ => (0 : ℝ)) ∈ C) :
    T (fun _ => 0) = 0 ∧ ∀ f, f ∈ C → T (fun x => -f x) = -T f := by
  sorry

end LRA.Analysis.Functions
