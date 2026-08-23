  
                                                                                             
                                                                                               

                                                                       
                                                                      
                                                                         
                                                            
                                                               
                                                                  
                                                                       
     
  

import Mathlib.Data.Real.Basic
import LRA.Analysis.Integration.Partitions
import LRA.Analysis.Completeness.Density
import LRA.Analysis.Integration.CauchyIntegral.Basic

namespace LRA.Analysis.Integration

                      
                                                                                                                  


             

       
                                                                                
                                                                          
   
  
def RiemannSum {a b : ℝ} (f : ℝ → ℝ) (P : TaggedPartitionIntegration a b) : ℝ :=
  ∑ i : Fin P.n, f (P.tag i) * SubintervalWidth P.toIntegrationPartition i

                                                               
                                                                                          


             

       
                                                        
                                                         
                                                                         
   
  
def HasRiemannIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ P : TaggedPartitionIntegration a b,
    PartitionMesh P.toIntegrationPartition < δ → |RiemannSum f P - L| < ε

                          
                                                                                      


             

       
                                                                                       
   
  
def IsRiemannIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop := ∃ L, HasRiemannIntegral f a b L

variable {f g : ℝ → ℝ} {a b : ℝ}

                                      
                                                                                         
                                 

             

       
                                                   
                                                                     
                             
   
  
theorem continuous_riemann_integrable (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsRiemannIntegrable f a b := by
  sorry

                                                   
                                                                                      
                                                                         

             

       
                                                  
                                
                                                            
                                                                             
                              
   
  
theorem thomae_riemann_integrable_zero (T : ℝ → ℝ)
    (hT : ∀ x ∈ Set.Icc (0:ℝ) 1,
      (LRA.Analysis.Completeness.IsIrrational x → T x = 0) ∧
      (∀ p q : ℕ, q > 0 → Nat.Coprime p q → x = (p : ℝ) / q → T x = 1 / q)) :
    HasRiemannIntegral T 0 1 0 := by
  sorry

                                   
                                                                                                   
                                                                                  

             

       
                                                                                      
                                         
                                                                         
   
  
theorem riemann_integral_linearity (α β Lf Lg : ℝ) (hLf : HasRiemannIntegral f a b Lf)
    (hLg : HasRiemannIntegral g a b Lg) :
    HasRiemannIntegral (fun x => α * f x + β * g x) a b (α * Lf + β * Lg) := by
  sorry

                                      
                                                                                                 
                                                         

             

       
                                                                                     
                                                                                      
   
  
theorem riemann_integral_monotonicity (Lf Lg : ℝ) (hLf : HasRiemannIntegral f a b Lf)
    (hLg : HasRiemannIntegral g a b Lg) (hle : ∀ x ∈ Set.Icc a b, f x ≤ g x) : Lf ≤ Lg := by
  sorry

                                             
                                                                                                 
                                                                                    

             

       
                                                                               
                                              
                                                                                     
              
   
  
theorem riemann_integral_triangle_inequality (hf : IsRiemannIntegrable f a b) :
    IsRiemannIntegrable (fun x => |f x|) a b ∧
    ∀ L L', HasRiemannIntegral f a b L → HasRiemannIntegral (fun x => |f x|) a b L' →
      |L| ≤ L' := by
  sorry

                                             
                                                                                      
                                                       

             

       
                                                                                  
                                                                                     
   
  
theorem riemann_integral_interval_additivity (c : ℝ) (hac : a ≤ c) (hcb : c ≤ b) :
    IsRiemannIntegrable f a b ↔ IsRiemannIntegrable f a c ∧ IsRiemannIntegrable f c b := by
  sorry

                                                                                                    
                                                                                             
           

             

       
                                                                                                  
                                                                               
                                                           
   
  
theorem riemann_integral_interval_additivity_value (c Lab Lac Lcb : ℝ) (hac : a ≤ c) (hcb : c ≤ b)
    (hab' : HasRiemannIntegral f a b Lab) (hac' : HasRiemannIntegral f a c Lac)
    (hcb' : HasRiemannIntegral f c b Lcb) : Lab = Lac + Lcb := by
  sorry

                                 
                                                                                       
                                                                                           
                                                                                         
                                       

             

       
                                              
                                                                   
                               
                                                               
                                                                                                 
                                             
   
  
theorem riemann_cauchy_criterion (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔
      ∀ ε > 0, ∃ δ > 0, ∀ P Q : TaggedPartitionIntegration a b,
        PartitionMesh P.toIntegrationPartition < δ → PartitionMesh Q.toIntegrationPartition < δ →
        |RiemannSum f P - RiemannSum f Q| < ε := by
  sorry

end LRA.Analysis.Integration
