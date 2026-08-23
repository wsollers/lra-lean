  
                                                             
                                                                                  
                      

                                                                      
                                                                         
                                                                       
                                         
  

import Mathlib.Data.Real.Basic
import Mathlib.Algebra.BigOperators.Ring.Finset
import LRA.Analysis.Differentiation.DerivativeDefinition

namespace LRA.Analysis.Differentiation

                                                           
                                                                                                    
                                                                                      

             

       
                                                                        
                        
                            
                                                         
                                          
   
  
theorem CaratheodoryCharacterization (f : ℝ → ℝ) (A : Set ℝ) (c D : ℝ) :
    Derivative D f A c ↔
      ∃ φ : ℝ → ℝ, φ c = D ∧
        LRA.Analysis.Continuity.ContinuousAtPoint φ A c ∧
        ∀ x ∈ A, f x - f c = (x - c) * φ x := by
  sorry

                   
                                                                                                    
                                                                                                
   

             

       
                                                           
                                                        
                                    
                                               
   
  
theorem ChainRule (f g : ℝ → ℝ) (A B : Set ℝ) (c Df Dg : ℝ)
    (hf : Derivative Df f A c) (hfAB : ∀ x ∈ A, f x ∈ B)
    (hg : Derivative Dg g B (f c)) :
    Derivative (Dg * Df) (fun x => g (f x)) A c := by
  sorry

                                                                         
                                                                
                                                                          
                                                                     
                                                        

             

       
                                                                                      
                                                          
   
  
def NthDerivativeAt (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (A : Set ℝ) (n : ℕ) (c : ℝ) : Prop :=
  fD 0 = f ∧ ∀ k < n, Derivative (fD (k + 1) c) (fD k) A c

                     
                                                                                          
                                                                                                
                                                                                               
              

             

       
                                                                                    
                                                                       
                                                          
                                                                                 
   
  
theorem LeibnizRule (f g : ℝ → ℝ) (fD gD hD : ℕ → ℝ → ℝ) (A : Set ℝ) (n : ℕ) (c : ℝ)
    (hf : NthDerivativeAt f fD A n c) (hg : NthDerivativeAt g gD A n c)
    (hh : NthDerivativeAt (fun x => f x * g x) hD A n c) :
    hD n c = ∑ k ∈ Finset.range (n + 1), (n.choose k : ℝ) * fD k c * gD (n - k) c := by
  sorry

                     
                                                                                                    
                                                                                      
                                                                                                
             

             

       
                                                                                        
                                                               
                                         
                                                        
                                                            
   
  
theorem FaaDiBrunoSecondOrder (f g : ℝ → ℝ) (fD gD hD : ℕ → ℝ → ℝ) (A B : Set ℝ) (c : ℝ)
    (hf : NthDerivativeAt f fD A 2 c) (hfAB : ∀ x ∈ A, f x ∈ B)
    (hg : NthDerivativeAt g gD B 2 (f c))
    (hh : NthDerivativeAt (fun x => g (f x)) hD A 2 c) :
    hD 2 c = gD 2 (f c) * (fD 1 c) ^ 2 + gD 1 (f c) * fD 2 c := by
  sorry

end LRA.Analysis.Differentiation
