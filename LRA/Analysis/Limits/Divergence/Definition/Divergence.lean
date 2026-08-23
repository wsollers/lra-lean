import Mathlib.Data.Real.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Basic
import Mathlib.Topology.MetricSpace.Basic
import LRA.Analysis.Limits.Definition
import LRA.Analysis.Limits.LimitsAtInfinity.Definition

   
                                                                          
                                                                  
                                                                   
                                                            
  

namespace LRA.Analysis.Limits

open scoped Topology

                                                                            

             

       
                                                       
                                                                     
   
  
def HasJumpAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ L₁ L₂ : ℝ, TendsToLeft f A c L₁ ∧ TendsToRight f A c L₂ ∧ L₁ ≠ L₂

                                                                              

             

       
                                                               
                                                                
   
  
def DivergesToInftyAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → f x > M

                                                                              

             

       
                                                                  
                                                                
   
  
def DivergesToNegInftyAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → f x < M

                                                                                                    
                                                                                               
                                               

             

       
                                                                      
                                                        
   
  
def DivergesToInftyFromRight (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → f x > M

                                              

             

       
                                                                     
                                                        
   
  
def DivergesToInftyFromLeft (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → f x > M

                                               

             

       
                                                                         
                                                        
   
  
def DivergesToNegInftyFromRight (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → f x < M

                                              

             

       
                                                                        
                                                        
   
  
def DivergesToNegInftyFromLeft (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ M : ℝ, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → f x < M

                                                                                                  

             

       
                                                               
                            
   
  
def LimitDoesNotExist (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ¬ ∃ L : ℝ, TendsTo f A c L

                                                                                                 
                                                                            

             

       
                                                        
                                                                                
                          
                                                   
                                                   
   
  
def Oscillates (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∃ xs ys : ℕ → ℝ, ApproachesButNotEqual xs A c ∧ ApproachesButNotEqual ys A c ∧
    ∃ L₁ L₂ : ℝ, L₁ ≠ L₂ ∧
      Filter.Tendsto (f ∘ xs) Filter.atTop (𝓝 L₁) ∧
        Filter.Tendsto (f ∘ ys) Filter.atTop (𝓝 L₂)

                                                                                          
         

             

       
                                                        
                               
   
  
def DivergesAtInfinity (f : ℝ → ℝ) (X : Set ℝ) : Prop :=
  ¬ ∃ L : ℝ, TendsToInfty f X L

end LRA.Analysis.Limits
