  
                                                             
                                                                                                   
                                                                                  

                                                                      
                                                                      
                                                                         
                                                                       
                                    
  

import Mathlib.Data.Real.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition
import LRA.Analysis.Differentiation.MeanValueTheorem
import LRA.Analysis.Differentiation.GraphReading
import LRA.Analysis.Limits

namespace LRA.Analysis.Differentiation

variable {f g : ℝ → ℝ} {A : Set ℝ} {c Df Dg α : ℝ}

                               
                                                                                                  

             

       
                                                                 
                                              
   
  
theorem ConstantMultipleRule (hf : Derivative Df f A c) (α : ℝ) :
    Derivative (α * Df) (fun x => α * f x) A c := by
  sorry

                 
                                                                                                   
                   

             

       
                                                                       
                                                 
   
  
theorem SumRule (hf : Derivative Df f A c) (hg : Derivative Dg g A c) :
    Derivative (Df + Dg) (fun x => f x + g x) A c := by
  sorry

                     
                                                                                                    
                              

             

       
                                                                           
                                                             
   
  
theorem ProductRule (hf : Derivative Df f A c) (hg : Derivative Dg g A c) :
    Derivative (Df * g c + f c * Dg) (fun x => f x * g x) A c := by
  sorry

                      
                                                                                                    
                                                              

             

       
                                                                          
                     
                                                                           
   
  
theorem QuotientRule (hf : Derivative Df f A c) (hg : Derivative Dg g A c)
    (hgc : g c ≠ 0) :
    Derivative ((Df * g c - f c * Dg) / (g c) ^ 2) (fun x => f x / g x) A c := by
  sorry

                                                                                             
                                                                                                
     

             

       
                                                                                    
                                               
                                                                   
   
  
theorem FiniteSumRule (n : ℕ) (fs : Fin n → ℝ → ℝ) (αs : Fin n → ℝ) (Ds : Fin n → ℝ)
    (hfs : ∀ i, Derivative (Ds i) (fs i) A c) :
    Derivative (∑ i, αs i * Ds i) (fun x => ∑ i, αs i * fs i x) A c := by
  sorry

                                                                                                    
                                                                                               
   

             

       
                                                                         
                                               
                                                              
                                
   
  
theorem ExtendedProductRule (n : ℕ) (fs : Fin n → ℝ → ℝ) (Ds : Fin n → ℝ)
    (hfs : ∀ i, Derivative (Ds i) (fs i) A c) :
    Derivative (∑ k, Ds k * ∏ i ∈ Finset.univ.erase k, fs i c)
      (fun x => ∏ i, fs i x) A c := by
  sorry

                                                                                                  
                   

             

       
                                                                 
                                                                  
   
  
theorem PowerRuleSpecialCase (hf : Derivative Df f A c) (n : ℕ) :
    Derivative (n * (f c) ^ (n - 1) * Df) (fun x => (f x) ^ n) A c := by
  sorry

                                       
                                                                                             
                                                                                                
     

             

       
                                                                                 
                                                                
                                                                   
   
  
theorem FiniteLinearCombinationRule (n : ℕ) (fs : Fin n → ℝ → ℝ) (αs : Fin n → ℝ)
    (Ds : Fin n → ℝ) (hfs : ∀ i, Derivative (Ds i) (fs i) A c) :
    Derivative (∑ i, αs i * Ds i) (fun x => ∑ i, αs i * fs i x) A c := by
  sorry

                                                                        
                                                                   
                                                                      
                                                     

                                        
                                                                                                    
                                                                                           
                                                                                                
                                                                                        

             

       
                                                                     
                                         
                                                                                     
                                                             
                                                                  
                                                                            
   
  
theorem IntervalFormsOfAlgebraRules (I : Set ℝ) (hI : I.OrdConnected)
    (f g : ℝ → ℝ) (fD gD : ℝ → ℝ) (α : ℝ)
    (hf : ∀ x ∈ I, Derivative (fD x) f I x) (hg : ∀ x ∈ I, Derivative (gD x) g I x) :
    (∀ x ∈ I, Derivative (α * fD x) (fun y => α * f y) I x) ∧
    (∀ x ∈ I, Derivative (fD x + gD x) (fun y => f y + g y) I x) ∧
    (∀ x ∈ I, Derivative (fD x * g x + f x * gD x) (fun y => f y * g y) I x) := by
  sorry

                                                                        
                           
                                                                        

                                              
                                                                                                   
                                                                                               
                                                                                                
                                                                            

             

       
                                                                                     
                                                                         
                                                                  
                       
                                                                    
                                          
                                                       
   
  
theorem InverseFunctionTheoremOneVariable (f fD1 : ℝ → ℝ) (I : Set ℝ) (hI : IsOpen I)
    (hclass : IsClassC1 f fD1 I) (c : ℝ) (hc : c ∈ I) (hnz : fD1 c ≠ 0) :
    ∃ U V : Set ℝ, IsOpen U ∧ IsOpen V ∧ c ∈ U ∧ f c ∈ V ∧ U ⊆ I ∧
      Set.BijOn f U V ∧
      ∃ g : ℝ → ℝ, (∀ x ∈ U, g (f x) = x) ∧ (∀ y ∈ V, f (g y) = y) ∧
        ∃ gD1 : ℝ → ℝ, IsClassC1 g gD1 V ∧
          ∀ y ∈ V, ∃ x ∈ U, f x = y ∧ gD1 y * fD1 x = 1 := by
  sorry

                                                                                                   
                                                                                                
                                                             

             

       
                                                                 
                                                                       
                             
                                                                  
                                             
   
  
theorem InverseFunctionDerivative (f g fD1 : ℝ → ℝ) (U V : Set ℝ)
    (hf : ∀ x ∈ U, Derivative (fD1 x) f U x) (hnz : ∀ x ∈ U, fD1 x ≠ 0)
    (hgVU : ∀ y ∈ V, g y ∈ U)
    (hinv : ∀ x ∈ U, g (f x) = x) (hinv' : ∀ y ∈ V, f (g y) = y) :
    ∀ y ∈ V, Derivative (1 / fD1 (g y)) g V y := by
  sorry

                                                                        
                                         
                                                                        

open LRA.Analysis.Limits in
                                
                                                                                        
                                                                                              
                                                                                               
                                                                                             
                                                                                               
                                                                                          
                                                      

             

       
                                                                  
                                                                
                                                                
                                                                          
                                                                                     
                                                                                  
                                                                   
                                                                          
                                                       
   
  
theorem LhopitalZeroOverZero (f g : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hg : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x)
    (hgD : ∀ x ∈ Set.Ioo a b, ∀ D, Derivative D g (Set.Ioo a b) x → D ≠ 0)
    (hf0 : TendsToRight f (Set.Ioo a b) a 0) (hg0 : TendsToRight g (Set.Ioo a b) a 0)
    (fD gD : ℝ → ℝ) (hfD : ∀ x ∈ Set.Ioo a b, Derivative (fD x) f (Set.Ioo a b) x)
    (hgD' : ∀ x ∈ Set.Ioo a b, Derivative (gD x) g (Set.Ioo a b) x)
    (L : ℝ) (hL : TendsToRight (fun x => fD x / gD x) (Set.Ioo a b) a L) :
    TendsToRight (fun x => f x / g x) (Set.Ioo a b) a L := by
  sorry

open LRA.Analysis.Limits in
                                        
                                                                                        
                                                                                              
                                                                                               
                                                                                            
                                                                                               
                                                                                                
                                   

             

       
                                                                          
                                                                
                                                                
                                                                          
                                                                        
                                                                                  
                                                                   
                                                                          
                                                       
   
  
theorem LhopitalInfinityOverInfinity (f g : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf : ∀ x ∈ Set.Ioo a b, IsDifferentiable f (Set.Ioo a b) x)
    (hg : ∀ x ∈ Set.Ioo a b, IsDifferentiable g (Set.Ioo a b) x)
    (hgD : ∀ x ∈ Set.Ioo a b, ∀ D, Derivative D g (Set.Ioo a b) x → D ≠ 0)
    (hgInf : ∀ M > 0, ∃ δ > 0, ∀ x ∈ Set.Ioo a b, x < a + δ → |g x| > M)
    (fD gD : ℝ → ℝ) (hfD : ∀ x ∈ Set.Ioo a b, Derivative (fD x) f (Set.Ioo a b) x)
    (hgD' : ∀ x ∈ Set.Ioo a b, Derivative (gD x) g (Set.Ioo a b) x)
    (L : ℝ) (hL : TendsToRight (fun x => fD x / gD x) (Set.Ioo a b) a L) :
    TendsToRight (fun x => f x / g x) (Set.Ioo a b) a L := by
  sorry

end LRA.Analysis.Differentiation
