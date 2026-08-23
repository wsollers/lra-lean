  
                                                                                             
                                                                                                 

                                                                    
                                                                         
                                                                         
                                                                    
                                                                     
                                                                       
               
  

import Mathlib.Data.Real.Basic
import Mathlib.Algebra.Order.Archimedean.Real.Basic
import Mathlib.Algebra.BigOperators.Ring.Finset
import LRA.Analysis.Integration.Partitions
import LRA.Analysis.Integration.RiemannIntegral.Basic
import LRA.Analysis.Continuity.GlobalTheorems
import LRA.Analysis.Continuity.PointContinuity
import LRA.Analysis.Continuity.MonotoneFunctions
import LRA.Analysis.Differentiation.GraphReading

namespace LRA.Analysis.Integration

                                                                              
                                                                       
                                                                    
                                                                   
                                                                                    
                                              

             

       
                                                  
                                          
                                                                       
   
  
def VariationSums (α : ℝ → ℝ) (a b : ℝ) : Set ℝ :=
  {v : ℝ | ∃ P : IntegrationPartition a b,
    v = ∑ i : Fin P.n, |α (P.points i.succ) - α (P.points i.castSucc)|}

                                        
                                                                                      


             

       
                                                                                      
   
  
def HasBoundedVariation (α : ℝ → ℝ) (a b : ℝ) : Prop := BddAbove (VariationSums α a b)

                                               
                                                                                            


             

       
                                                                                        
   
  
noncomputable def TotalVariation (α : ℝ → ℝ) (a b : ℝ) : ℝ := sSup (VariationSums α a b)

                                                                                                
                            

             

       
                                                                      
                                                                    
   
  
theorem monotone_bounded_variation (α : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hmono : MonotoneOn α (Set.Icc a b)) : HasBoundedVariation α a b := by
  sorry

variable {f α β : ℝ → ℝ} {a b : ℝ}

                                     
                                                                                                     


             

       
                                                                   
                                                         
                                                
                                  
                                                                 
   
  
def HasRiemannStieltjesIntegral (f α : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ P : TaggedPartitionIntegration a b,
    PartitionMesh P.toIntegrationPartition < δ →
    |(∑ i : Fin P.n, f (P.tag i) *
        (α (P.points i.succ) - α (P.points i.castSucc))) - L| < ε

                                   
                                                                                                    


             

       
                                                                  
                                            
   
  
def IsRiemannStieltjesIntegrable (f α : ℝ → ℝ) (a b : ℝ) : Prop :=
  ∃ L, HasRiemannStieltjesIntegral f α a b L

                                   
                                                                                          
                                                                               

             

       
                                                
                                                                   
                                                                            
   
  
theorem rs_continuous_bv_existence (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (hbv : HasBoundedVariation α a b) : IsRiemannStieltjesIntegrable f α a b := by
  sorry

                       
                                                                                                  
                                                                                               
                                                                                              
                                                                                         

             

       
                                                                                   
                                                                
                                                                                            
                                                         
                                                                                             
   
  
theorem rs_bilinearity (Lfα Lgα : ℝ) (hf : HasRiemannStieltjesIntegral f α a b Lfα)
    (hg : HasRiemannStieltjesIntegral g α a b Lgα) (lam μ : ℝ) :
    HasRiemannStieltjesIntegral (fun x => lam * f x + μ * g x) α a b (lam * Lfα + μ * Lgα) ∧
    (∀ Lfβ : ℝ, HasRiemannStieltjesIntegral f β a b Lfβ →
      HasRiemannStieltjesIntegral f (fun x => lam * α x + μ * β x) a b (lam * Lfα + μ * Lfβ)) := by
  sorry

                               
                                                                                                   
                                                                         
                                                                 

             

       
                                                                              
                                                    
                                                    
                                                                      
   
  
theorem rs_interval_additivity (c Lab Lac Lcb : ℝ) (hac : a ≤ c) (hcb : c ≤ b)
    (hab' : HasRiemannStieltjesIntegral f α a b Lab)
    (hac' : HasRiemannStieltjesIntegral f α a c Lac)
    (hcb' : HasRiemannStieltjesIntegral f α c b Lcb) : Lab = Lac + Lcb := by
  sorry

                                
                                                                             
                                                                         

             

       
                                                                                      
                                                                                 
   
  
theorem rs_integration_by_parts (L : ℝ) (hL : HasRiemannStieltjesIntegral f α a b L) :
    ∃ L', HasRiemannStieltjesIntegral α f a b L' ∧ L + L' = f b * α b - f a * α a := by
  sorry

                        
                                                         
                                                                                     
                                                                                            
                                                

             

       
                                     
                                                                                 
                                                                   
                                                                 
                                            
   
  
theorem rs_c1_reduction (hab : a ≤ b)
    (αD : ℝ → ℝ) (hα : LRA.Analysis.Differentiation.IsClassC1 α αD (Set.Icc a b))
    (hf : IsRiemannIntegrable (fun x => f x * αD x) a b) (Lint : ℝ)
    (hLint : HasRiemannIntegral (fun x => f x * αD x) a b Lint) :
    HasRiemannStieltjesIntegral f α a b Lint := by
  sorry

                                      
                                                                                                    
                                                                                  
                                                                                          
                                                                           
                                                              

             

       
                                                                                           
                      
                                                                                                  
                                                                                
                                                                                    
                                                               
   
  
theorem rs_step_integrator_finite_sum (n : ℕ) (c : Fin n → ℝ) (hc : ∀ i, c i ∈ Set.Icc a b)
    (jump : Fin n → ℝ)
    (hstep : ∀ x ∈ Set.Icc a b, (∀ i, x ≠ c i) → ∃ k, ∀ y ∈ Set.Icc a b, (∀ i, y ≠ c i) → α y = k)
    (hjump : ∀ i, LRA.Analysis.Continuity.JumpOf α (Set.Icc a b) (c i) (jump i))
    (hcont : ∀ i, LRA.Analysis.Continuity.ContinuousAtPoint f (Set.Icc a b) (c i)) :
    HasRiemannStieltjesIntegral f α a b (∑ i, f (c i) * jump i) := by
  sorry

                                                                                                   
                                                                  

             

       
                                                                           
                                                                        
                                               
   
  
theorem rs_shared_jump_failure_witness (c : ℝ) (hc : c ∈ Set.Ioo (0:ℝ) 1) :
    ¬ IsRiemannStieltjesIntegrable (fun x => if x ≥ c then (1:ℝ) else 0)
      (fun x => if x ≥ c then (1:ℝ) else 0) 0 1 := by
  sorry

end LRA.Analysis.Integration
