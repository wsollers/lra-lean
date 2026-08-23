  
                                                                   
                                                                      
                                                                           
                                                                          
                                                                       
  

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Limits

                                                                        
                                        

             

       
                                                       
                                                                      
   
  
def TendsTo (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x - L| < ε

                           

             

       
                                                            
                                                              
   
  
def TendsToRight (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L| < ε

                          

             

       
                                                           
                                                              
   
  
def TendsToLeft (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L| < ε

                                                                         
                                                                        
                                           

             

       
                                                                    
                                     
                                             
   
  
def ApproachesButNotEqual (xs : ℕ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  (∀ n, xs n ∈ A) ∧ (∀ n, xs n ≠ c) ∧
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε

end LRA.Analysis.Limits
