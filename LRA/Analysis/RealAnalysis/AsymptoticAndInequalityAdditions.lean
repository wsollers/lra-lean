  
                                                             
                                                                    
                                                                           
                                                                           
                                  

                                                                      
                                                                       
                                                                     

                                                                          
                                                                          
                                                                         
                                                                         
                        
                                                                     
                                                                          
                                                   
                                                                          
                                                                       
                                                            
  

import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.Convex.Basic

namespace LRA.Analysis.RealAnalysis

                                                                   
                                         
                                                          
                                                         
                                                                      

                                                                        
                                                                       
                                                            
                                                                        
                                                   

             

       
                                            
                                                                      
   
  
def IsBigOAt (f g : ℝ → ℝ) (a : ℝ) : Prop :=
  ∃ C > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x| ≤ C * |g x|

                                                                     
                                                            
                           

             

       
                                       
                                                  
   
  
def IsBigOAtTop (f g : ℝ → ℝ) : Prop :=
  ∃ C > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ C * |g x|

                                                                                                    
                                    

             

       
                            
                         
                                                                                 
                  
   
  
theorem LittleOImpliesBigOAt
    (f g : ℝ → ℝ) (a : ℝ)
    (ho : ∀ ε > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x| ≤ ε * |g x|) :
    IsBigOAt f g a := by
  sorry

                                                                                                   
     

             

       
                               
                 
                                                             
                   
   
  
theorem LittleOImpliesBigOAtTop
    (f g : ℝ → ℝ)
    (ho : ∀ ε > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ ε * |g x|) :
    IsBigOAtTop f g := by
  sorry

                                                                                                    
                                                           

             

       
                        
                                       
                                                                   
                                 
   
  
theorem YoungsInequality
    (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b)
    (p q : ℝ) (hp : 1 < p) (hq : 1 < q) (hpq : 1 / p + 1 / q = 1) :
    a * b ≤ a ^ p / p + b ^ q / q := by
  sorry

                                                                      
                                                                           
                                                                    
                                              

             

       
                                     
                                           
                                                             
   
  
def IsConvexOnR (φ : ℝ → ℝ) : Prop :=
  ∀ x y : ℝ, ∀ lam : ℝ, 0 ≤ lam → lam ≤ 1 →
    φ (lam * x + (1 - lam) * y) ≤ lam * φ x + (1 - lam) * φ y

                                                                                         
                                                                                   
                                                                                       

             

       
                               
                                    
                                            
                                  
                                            
                                              
                                                  
   
  
theorem JensensInequalityFinite
    (φ : ℝ → ℝ) (hφ : IsConvexOnR φ)
    (n : ℕ) (hn : 0 < n) (x lam : Fin n → ℝ)
    (hlam_nonneg : ∀ i, 0 ≤ lam i)
    (hlam_sum : (Finset.univ.sum lam) = 1) :
    φ (Finset.univ.sum (fun i => lam i * x i))
      ≤ Finset.univ.sum (fun i => lam i * φ (x i)) := by
  sorry

end LRA.Analysis.RealAnalysis
