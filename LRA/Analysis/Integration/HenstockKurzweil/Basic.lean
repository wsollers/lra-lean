  
                                                                                             
                                                                                                 

                                                                        
                                                                        
                                                                        
                                                                         
                                                               
                                                          
                                                                       
  

import Mathlib.Data.Real.Basic
import LRA.Analysis.Integration.Partitions
import LRA.Analysis.Integration.RiemannIntegral.Basic
import LRA.Analysis.Differentiation.DerivativeDefinition

namespace LRA.Analysis.Integration

                            
                                                                            


             

       
                                                                        
   
  
def IsGaugeOn (a b : ℝ) (δ : ℝ → ℝ) : Prop := ∀ x ∈ Set.Icc a b, δ x > 0

                                                                      
                                                                    
                                                                   
                                                                                                                        
                                                          

             

       
                                                                                      
                
                                                 
                                           
   
  
def IsHKDeltaFine {a b : ℝ} (P : TaggedPartitionIntegration a b) (δ : ℝ → ℝ) : Prop :=
  ∀ i : Fin P.n,
    P.points i.castSucc ≥ P.tag i - δ (P.tag i) ∧
    P.points i.succ ≤ P.tag i + δ (P.tag i)

                                     
                                                                                     


             

       
                                                   
                                         
                                                             
                              
   
  
def HasHKIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ : ℝ → ℝ, IsGaugeOn a b δ ∧
    ∀ P : TaggedPartitionIntegration a b, IsHKDeltaFine P δ →
      |RiemannSum f P - L| < ε

                     
                                                                                 


             

       
                                                                             
   
  
def IsHKIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop := ∃ L, HasHKIntegral f a b L

               
                                                                                         
                                                   

             

       
                                                                                  
                                                           
   
  
theorem cousins_lemma (a b : ℝ) (hab : a ≤ b) (δ : ℝ → ℝ) (hδ : IsGaugeOn a b δ) :
    ∃ P : TaggedPartitionIntegration a b, IsHKDeltaFine P δ := by
  sorry

variable {f : ℝ → ℝ} {a b : ℝ}

                                                 
                                                                                                  
   

             

       
                                                                      
                                                             
   
  
theorem riemann_integrable_implies_hk_integrable (hab : a ≤ b) (L : ℝ)
    (hR : HasRiemannIntegral f a b L) : HasHKIntegral f a b L := by
  sorry

                    
                                                      
                                                                                      
                                                                                               
                                 

             

       
                                                
                                                                    
                                                                                 
                                                                              
   
  
theorem hk_straddle (F : ℝ → ℝ) (ξ : ℝ) (Dξ : ℝ)
    (hF : LRA.Analysis.Differentiation.Derivative Dξ F Set.univ ξ) :
    ∀ ε > 0, ∃ δξ > 0, ∀ u v : ℝ, u ≤ ξ → ξ ≤ v → u ∈ Set.Ioo (ξ - δξ) (ξ + δξ) →
      v ∈ Set.Ioo (ξ - δξ) (ξ + δξ) → |F v - F u - Dξ * (v - u)| ≤ ε * (v - u) := by
  sorry

                               
                                                                  
                                                                                      
               

             

       
                                                           
                                                                                           
                                    
   
  
theorem hk_fundamental_theorem (F FD : ℝ → ℝ) (hab : a ≤ b)
    (hF : ∀ x ∈ Set.Icc a b, LRA.Analysis.Differentiation.Derivative (FD x) F Set.univ x) :
    HasHKIntegral FD a b (F b - F a) := by
  sorry

                                 
                                                                                         
                            

             

       
                                              
                                                                     
                        
   
  
theorem continuous_hk_integrable (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsHKIntegrable f a b := by
  sorry

                                                                        
                                                                

end LRA.Analysis.Integration
