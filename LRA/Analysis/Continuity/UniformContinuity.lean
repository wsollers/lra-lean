  
                                                             
                                                                                          

                                                                  
                                         
  

import Mathlib.Data.Real.Basic
import Mathlib.Analysis.Real.Sqrt
import LRA.Analysis.Continuity.GlobalTheorems

namespace LRA.Analysis.Continuity

                             

             

       
                                                           
                                                                   
   
  
def IsUniformlyContinuous (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, ∀ y ∈ A, |x - y| < δ → |f x - f y| < ε

                                              
                                                                                  
                                                                                

             

       
                                       
                                                                       
                                                
   
  
theorem UcAdd (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hg : IsUniformlyContinuous g A) :
    IsUniformlyContinuous (fun x => f x + g x) A := by
  sorry

                                                                                                    
                                                                                                
                 

             

       
                                                
                                                                     
                                                       
                                                
   
  
theorem UcMulOfBounded (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hg : IsUniformlyContinuous g A)
    (hfB : BoundedOnSet f A) (hgB : BoundedOnSet g A) :
    IsUniformlyContinuous (fun x => f x * g x) A := by
  sorry

                                              
                                                                                                    
                                                                                        

             

       
                                          
                                                             
                                      
                                              
   
  
theorem UcComp (f g : ℝ → ℝ) (A B : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hfA : ∀ x ∈ A, f x ∈ B)
    (hg : IsUniformlyContinuous g B) :
    IsUniformlyContinuous (fun x => g (f x)) A := by
  sorry

                                                                                                    
                                                                                               
                              

             

       
                                                 
                               
                                                          
                                                        
                                                            
   
  
theorem UcIffSequential (f : ℝ → ℝ) (A : Set ℝ) :
    IsUniformlyContinuous f A ↔
      ∀ xs ys : ℕ → ℝ, (∀ n, xs n ∈ A) → (∀ n, ys n ∈ A) →
        (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - ys n| < ε) →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f (ys n)| < ε := by
  sorry

                                                                                                   
                                                                                               
                                                    

             

       
                                                    
                                                                       
                                                                       
                                                                 
   
  
theorem UcMapsCauchyToCauchy (f : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (xs : ℕ → ℝ) (hxs : ∀ n, xs n ∈ A)
    (hCauchy : ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |xs m - xs n| < ε) :
    ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |f (xs m) - f (xs n)| < ε := by
  sorry

                                                                
                                                                        
                                                                     
                                        

             

       
                                                           
                                                     
   
  
def IsLipschitzOn (f : ℝ → ℝ) (A : Set ℝ) (K : ℝ) : Prop :=
  K ≥ 0 ∧ ∀ x ∈ A, ∀ y ∈ A, |f x - f y| ≤ K * |x - y|

                                                                                    
                            

             

       
                                                          
                                                          
   
  
theorem LipschitzImpliesUc (f : ℝ → ℝ) (A : Set ℝ) (K : ℝ)
    (hf : IsLipschitzOn f A K) : IsUniformlyContinuous f A := by
  sorry

                       

             

       
                                                               
                                   
                                                         
   
  
def IsBiLipschitzOn (f : ℝ → ℝ) (A : Set ℝ) (α K : ℝ) : Prop :=
  0 < α ∧ α ≤ K ∧ ∀ x ∈ A, ∀ y ∈ A,
    α * |x - y| ≤ |f x - f y| ∧ |f x - f y| ≤ K * |x - y|

                                         
                                                                                                  
                                                                                  

             

       
                                                                       
                                                 
                                       
                                       
   
  
theorem BiLipschitzInverseIsLipschitz (f : ℝ → ℝ) (A : Set ℝ) (α K : ℝ)
    (hf : IsBiLipschitzOn f A α K) (finv : ℝ → ℝ)
    (hfinv : ∀ x ∈ A, finv (f x) = x) :
    IsLipschitzOn finv (f '' A) (1 / α) := by
  sorry

                                                                                                 
                               

             

       
                            
                                                       
                                                      
   
  
theorem SqrtUcNotLipschitz :
    IsUniformlyContinuous Real.sqrt (Set.Icc (0:ℝ) 1) ∧
    ¬ ∃ K, IsLipschitzOn Real.sqrt (Set.Icc (0:ℝ) 1) K := by
  sorry

end LRA.Analysis.Continuity
