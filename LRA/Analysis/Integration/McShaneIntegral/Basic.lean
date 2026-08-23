  
                                                                                             
                                                                                               

                                                                      
                                                                                                            
                                                                        
                                                           
                                                                      
                                                                        
                                                                      
                                                                         
  

import Mathlib.Data.Real.Basic
import LRA.Analysis.Integration.Partitions
import LRA.Analysis.Integration.RiemannIntegral.Basic
import LRA.Analysis.Integration.HenstockKurzweil.Basic
import LRA.Analysis.Integration.MeasureZero

namespace LRA.Analysis.Integration

                                                                      
                                                                         
                                                                        
                                                                    
                                                                       
                                                                                                             
                          

             

       
                                                                                 
                 
                                            
   
  
structure McShaneTaggedPartition (a b : ℝ) extends IntegrationPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc a b

                                                                       
                                                                                                                         
                              

             

       
                                                                                       
                
                                                 
                                           
   
  
def IsMcShaneDeltaFine {a b : ℝ} (P : McShaneTaggedPartition a b) (δ : ℝ → ℝ) : Prop :=
  ∀ i : Fin P.n,
    P.points i.castSucc ≥ P.tag i - δ (P.tag i) ∧
    P.points i.succ ≤ P.tag i + δ (P.tag i)

                           
                                                                                          


             

       
                                                        
                                         
                                                              
                                                                                          
   
  
def HasMcShaneIntegral (f : ℝ → ℝ) (a b L : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ : ℝ → ℝ, IsGaugeOn a b δ ∧
    ∀ P : McShaneTaggedPartition a b, IsMcShaneDeltaFine P δ →
      |(∑ i : Fin P.n, f (P.tag i) * SubintervalWidth P.toIntegrationPartition i) - L| < ε

                          
                                                                                      


             

       
                                                                                       
   
  
def IsMcShaneIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop := ∃ L, HasMcShaneIntegral f a b L

variable {f : ℝ → ℝ} {a b : ℝ}

                                      
                                                                                                    
                                                      

             

       
                                                             
                                                               
                                                        
   
  
theorem riemann_mcshane_hk_inclusions (hab : a ≤ b) (L : ℝ) :
    (HasRiemannIntegral f a b L → HasMcShaneIntegral f a b L) ∧
    (HasMcShaneIntegral f a b L → HasHKIntegral f a b L) := by
  sorry

                                                                       
                                                                    
                     

end LRA.Analysis.Integration
