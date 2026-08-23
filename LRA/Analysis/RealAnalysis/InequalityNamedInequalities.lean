  
                                                             
                                                                          
                                                              
                                                                           
                                                                        
                                                                        
                                            
  

import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.SpecialFunctions.Pow.Real

namespace LRA.Analysis.RealAnalysis

                       
                                                                                            

             

       
                                                         
                                   
   
  
theorem IneqAmGmTwo (a b : ℝ) (ha : a ≥ 0) (hb : b ≥ 0) :
    Real.sqrt (a * b) ≤ (a + b) / 2 := by
  sorry

                                                                         
                     

             

       
                                                               
                         
   
  
noncomputable def ArithmeticMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  (Finset.univ.sum a) / n

                                          

             

       
                                                              
                                      
   
  
noncomputable def GeometricMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  (Finset.univ.prod a) ^ ((1 : ℝ) / n)

                                         

             

       
                                                             
                                        
   
  
noncomputable def HarmonicMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  n / Finset.univ.sum (fun i => 1 / a i)

                   
                                                                                                   
                      

             

       
                                                                           
                                          
   
  
theorem IneqAmGm (n : ℕ) (hn : 0 < n) (a : Fin n → ℝ) (ha : ∀ i, a i > 0) :
    GeometricMean n a ≤ ArithmeticMean n a := by
  sorry

                      
                                                                                                    
                                                            

             

       
                                                                             
                                                                                 
   
  
theorem IneqAmGmHm (n : ℕ) (hn : 0 < n) (a : Fin n → ℝ) (ha : ∀ i, a i > 0) :
    HarmonicMean n a ≤ GeometricMean n a ∧ GeometricMean n a ≤ ArithmeticMean n a := by
  sorry

                            
                                                                                               
                                                                                       

             

       
                                                     
                                            
                                                      
                                                      
   
  
theorem IneqCauchySchwarz (n : ℕ) (a b : Fin n → ℝ) :
    |Finset.univ.sum (fun j => a j * b j)| ≤
      Real.sqrt (Finset.univ.sum (fun j => a j ^ 2)) *
        Real.sqrt (Finset.univ.sum (fun j => b j ^ 2)) := by
  sorry

                           
                                                                                                   
                                                                                      

             

       
                                                               
                                         
                                                 
                                           
   
  
theorem IneqChebyshevSum (n : ℕ) (hn : 0 < n) (a b : Fin n → ℝ)
    (ha : Monotone a) (hb : Monotone b) :
    (ArithmeticMean n a) * (ArithmeticMean n b) ≤
      ArithmeticMean n (fun j => a j * b j) := by
  sorry

                           
                                                                                                
                                                                                               
                                                                                                

             

       
                                                                                       
                              
                                                    
                                                
                                              
                                          
   
  
theorem IneqRearrangement (n : ℕ) (a b : Fin n → ℝ) (ha : Monotone a) (hb : Monotone b)
    (σ : Equiv.Perm (Fin n)) :
    Finset.univ.sum (fun j => a j * b (Fin.rev j)) ≤
      Finset.univ.sum (fun j => a j * b (σ j)) ∧
    Finset.univ.sum (fun j => a j * b (σ j)) ≤
      Finset.univ.sum (fun j => a j * b j) := by
  sorry

                    
                                                                                                   
                                                                                             
                                                                  

             

       
                                                              
                                                 
                                            
                                                        
                                                        
   
  
theorem IneqHolder (n : ℕ) (p q : ℝ) (hp : p > 1) (hq : q > 1)
    (hpq : 1 / p + 1 / q = 1) (a b : Fin n → ℝ) :
    Finset.univ.sum (fun j => |a j * b j|) ≤
      (Finset.univ.sum (fun j => |a j| ^ p)) ^ (1 / p) *
        (Finset.univ.sum (fun j => |b j| ^ q)) ^ (1 / q) := by
  sorry

                       
                                                                                                    
                                                                                
                                                  

             

       
                                                                      
                                                            
                                                        
                                                        
   
  
theorem IneqMinkowski (n : ℕ) (p : ℝ) (hp : p ≥ 1) (a b : Fin n → ℝ) :
    (Finset.univ.sum (fun j => |a j + b j| ^ p)) ^ (1 / p) ≤
      (Finset.univ.sum (fun j => |a j| ^ p)) ^ (1 / p) +
        (Finset.univ.sum (fun j => |b j| ^ p)) ^ (1 / p) := by
  sorry

                       
                                                                              

             

       
                                                     
                           
   
  
theorem IneqBernoulli (x : ℝ) (n : ℕ) (hx : x ≥ -1) :
    (1 + x) ^ n ≥ 1 + n * x := by
  sorry

end LRA.Analysis.RealAnalysis
