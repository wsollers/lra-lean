  
                                                                                             
                                                                                             

                                                                     
                                                                     
                                                                         
                                                                          
                                                                  
                                                                       
                                                                      
                                                                          
                                                              
  

import Mathlib.Data.Real.Basic
import Mathlib.Algebra.BigOperators.Ring.Finset
import LRA.Analysis.Continuity.GlobalTheorems
import LRA.Analysis.Integration.Partitions

namespace LRA.Analysis.Integration

                                                         
                                                                                                           


             

       
                                                                         
                                                               
   
  
def CauchySum {a b : ℝ} (f : ℝ → ℝ) (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n, f (P.points i.castSucc) * SubintervalWidth P i

                                                                        
                                                                                         
     

             

       
                                                       
                                                                         
                           
   
  
def HasCauchyIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ P : IntegrationPartition a b, PartitionMesh P < δ →
    |CauchySum f P - L| < ε

                         
                                                                                     


             

       
                                                                                     
   
  
def IsCauchyIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop := ∃ L, HasCauchyIntegral f a b L

                                                                                               

             

       
                                                            
                                                    
   
  
theorem CauchyIntegralConstant (a b c : ℝ) (hab : a ≤ b) :
    HasCauchyIntegral (fun _ => c) a b (c * (b - a)) := by

                                                                                               

             

       
                                                            
                                                    
   
  
  sorry

                                  
                                                                                                    
                                                                                            
                                                    

             

       
                                                                                                 
                                                                                           
                                                                        
   
  
theorem cauchy_integral_linearity (hf : IsCauchyIntegrable f a b) (hg : IsCauchyIntegrable g a b)
    (α β Lf Lg : ℝ) (hLf : HasCauchyIntegral f a b Lf) (hLg : HasCauchyIntegral g a b Lg) :
    HasCauchyIntegral (fun x => α * f x + β * g x) a b (α * Lf + β * Lg) := by
  sorry

                                     
                                                                                                   
                                                     

             

       
                                                                                   
                                                                                     
   
  
theorem cauchy_integral_monotonicity (Lf Lg : ℝ) (hLf : HasCauchyIntegral f a b Lf)
    (hLg : HasCauchyIntegral g a b Lg) (hle : ∀ x ∈ Set.Icc a b, f x ≤ g x) : Lf ≤ Lg := by
  sorry

                                                                                       
                                                                                                
                                                                    

             

       
                                            
                                                                   
                                                
                                                                         
                                     
   
  
theorem cauchy_integral_bounds (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (L m M : ℝ) (hL : HasCauchyIntegral f a b L)
    (hm : ∀ x ∈ Set.Icc a b, m ≤ f x) (hM : ∀ x ∈ Set.Icc a b, f x ≤ M) :
    m * (b - a) ≤ L ∧ L ≤ M * (b - a) := by
  sorry

                                            
                                                                                                 
                             

             

       
                                                                                       
                                                                
   
  
theorem cauchy_integral_triangle_inequality (L L' : ℝ) (hL : HasCauchyIntegral f a b L)
    (hL' : HasCauchyIntegral (fun x => |f x|) a b L') : |L| ≤ L' := by
  sorry

                                            
                                                                                                   
                                                                                              
                  

             

       
                                                                               
                                                                                               
                                                          
   
  
theorem cauchy_integral_interval_additivity (c : ℝ) (hac : a ≤ c) (hcb : c ≤ b)
    (Lab Lac Lcb : ℝ) (hab' : HasCauchyIntegral f a b Lab) (hac' : HasCauchyIntegral f a c Lac)
    (hcb' : HasCauchyIntegral f c b Lcb) : Lab = Lac + Lcb := by
  sorry

                                           
                                                                                                      


             

       
                                                                    
   
   
  
noncomputable def IntervalOscillation (f : ℝ → ℝ) (I : Set ℝ) : ℝ :=
  0

                                     
                                                                                         
                                

             

       
                                                  
                                                                     
                            
   
  
theorem continuous_cauchy_integrable (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsCauchyIntegrable f a b := by
  sorry

                                
                                                                                   
                                                                                   
                                                                                               
                                                                   

             

       
                                             
                                                                   
                                              
                                                                                                        
                                                                                          
   
  
theorem cauchy_tag_independence (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b))
    (L : ℝ) (hL : HasCauchyIntegral f a b L) :
    ∀ ε > 0, ∃ δ > 0, ∀ P : TaggedPartitionIntegration a b, PartitionMesh P.toIntegrationPartition < δ →
      |(∑ i : Fin P.n, f (P.tag i) * SubintervalWidth P.toIntegrationPartition i) - L| < ε := by
  sorry

                                                                                             

             

       
                                              
                                                                      
   
  
theorem cauchy_step_function_failure_witness :
    IsCauchyIntegrable (fun x => if x < (1:ℝ)/2 then (0:ℝ) else 1) 0 1 := by
  sorry

end LRA.Analysis.Integration
