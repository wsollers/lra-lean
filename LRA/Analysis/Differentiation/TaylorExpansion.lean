  
                                                             
                                                                                            
                        

                                                                     
                                                                       
                                                                     
                                                                       
                      
  

import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Exp
import LRA.Analysis.Differentiation.DerivativeDefinition
import LRA.Analysis.Differentiation.ChainRule
import LRA.Analysis.Differentiation.GraphReading
import LRA.Analysis.Differentiation.AlgebraOfDerivatives

namespace LRA.Analysis.Differentiation

                                                                        
                                  
                                                                        

                                       

             

       
                                                                        
                                                                               
   
  
noncomputable def TaylorPoly (fD : ℕ → ℝ → ℝ) (n : ℕ) (a : ℝ) : ℝ → ℝ :=
  fun x => ∑ k ∈ Finset.range (n + 1), fD k a / (Nat.factorial k) * (x - a) ^ k

                           

             

       
                                                                                         
                                    
   
  
noncomputable def TaylorRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (n : ℕ) (a : ℝ) : ℝ → ℝ :=
  fun x => f x - TaylorPoly fD n a x

                                                                      

             

       
                                                                   
                   
   
  
noncomputable def MaclaurinPoly (fD : ℕ → ℝ → ℝ) (n : ℕ) : ℝ → ℝ :=
  TaylorPoly fD n 0

                                          
                                                                                                 
                                                                                             
                                                                                                 
                                                                                   
                                             

             

       
                                                                             
                         
                                                                                 
                                                                                   
                                                     
                                              
                                                                                    
   
  
theorem TaylorTheoremLagrangeRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (a b : ℝ)
    (hab : a < b) (n : ℕ)
    (hcont : ∀ k ≤ n, LRA.Analysis.Continuity.ContinuousOn' (fD k) (Set.Icc a b))
    (hchain : ∀ x ∈ Set.Ioo a b, HigherDerivativeAt f fD (Set.Ioo a b) (n + 1) x) :
    ∀ x ∈ Set.Ioo a b, ∃ c, (a < c ∧ c < x) ∧ ∃ Dnp1,
      Derivative Dnp1 (fD n) (Set.Ioo a b) c ∧
      f x = TaylorPoly fD n a x + Dnp1 / (Nat.factorial (n + 1)) * (x - a) ^ (n + 1) := by
  sorry

                                                                                                   
                                                  
                                                                                     
                                                                              

             

       
                                                                                      
                                                                      
                                                                    
                                                                       
                                       
   
  
theorem TaylorExpansionPeanoRemainder (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (I : Set ℝ) (a : ℝ)
    (n : ℕ) (ha : a ∈ interior I) (hD : HigherDerivativeAt f fD I n a)
    (hcont : LRA.Analysis.Continuity.ContinuousAtPoint (fD n) I a) :
    Filter.Tendsto (fun x => (f x - TaylorPoly fD n a x) / (x - a) ^ n)
      (nhdsWithin a (I \ {a})) (nhds 0) := by
  sorry

                                                                                     
                                                        
                                                     

             

       
                                                                  
                               
                                                           
                                                         
   
  
theorem FirstOrderPeanoRemainder (f : ℝ → ℝ) (A : Set ℝ) (c D : ℝ)
    (hf : Derivative D f A c) :
    Filter.Tendsto (fun h => (f (c + h) - f c - D * h) / h)
      (nhdsWithin 0 {h : ℝ | c + h ∈ A ∧ h ≠ 0}) (nhds 0) := by
  sorry

                                                              
                                                                     

             

       
                                                                                             
   
  
noncomputable def FlatFunction : ℝ → ℝ := fun x => if x = 0 then 0 else Real.exp (-1 / x ^ 2)

                                                                                             
                                                                             

             

       
                                                                              
                                            
                           
                                            
   
  
theorem FlatFunctionProperties (fD : ℕ → ℝ → ℝ) (hfD0 : fD 0 = FlatFunction) :
    IsClassCInfty FlatFunction fD Set.univ ∧
    (∀ n : ℕ, fD n 0 = 0) ∧
    ¬ IsClassCOmega FlatFunction fD Set.univ := by
  sorry

                                                                        
                                               
                                                                        

                                                                       
                                                                   

             

       
                                                              
                  
                                                                                      
   
  
def DifferentiableByDifferential (f : ℝ → ℝ) (c : ℝ) : Prop :=
  ∃ L : ℝ →ₗ[ℝ] ℝ,
    Filter.Tendsto (fun h => (f (c + h) - f c - L h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)

                                          
                                                                               
                                                            

             

       
                                                                      
                           
                                                             
   
  
theorem DifferentialAndDerivativeAgree (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A) :
    IsDifferentiable f A c ↔ DifferentiableByDifferential f c := by
  sorry

                                       
                                                                                                   
                                                                                               
                                                             

             

       
                                                                           
                                                                                              
                                                                                                
           
   
  
theorem UniquenessOfTheDifferential (f : ℝ → ℝ) (c : ℝ) (L₁ L₂ : ℝ →ₗ[ℝ] ℝ)
    (h₁ : Filter.Tendsto (fun h => (f (c + h) - f c - L₁ h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0))
    (h₂ : Filter.Tendsto (fun h => (f (c + h) - f c - L₂ h) / h) (nhdsWithin 0 {0}ᶜ) (nhds 0)) :
    L₁ = L₂ := by
  sorry

                                          
                                                                                                
                                                  

             

       
                                                                       
                                            
                                                   
   
  
theorem DifferentialContinuityCriterion (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : DifferentiableByDifferential f c) :
    LRA.Analysis.Continuity.ContinuousAtPoint f A c := by
  sorry

                                     
                                                                                     
                                                                                                

             

       
                                                       
                                                                                         
                                                     
   
  
theorem ChainRuleForDifferentials (f g : ℝ → ℝ) (c : ℝ)
    (hf : DifferentiableByDifferential f c) (hg : DifferentiableByDifferential g (f c)) :
    DifferentiableByDifferential (fun x => g (f x)) c := by
  sorry

                                      
                                                                                         
                                                                                               
      

             

       
                                                            
                                                                                     
                                                               
   
  
theorem LinearityOfTheDifferential (f g : ℝ → ℝ) (c α β : ℝ)
    (hf : DifferentiableByDifferential f c) (hg : DifferentiableByDifferential g c) :
    DifferentiableByDifferential (fun x => α * f x + β * g x) c := by
  sorry

end LRA.Analysis.Differentiation
