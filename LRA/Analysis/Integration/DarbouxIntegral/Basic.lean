  
                                                                                             
                                                                                               

                                                                
                                         
  

import Mathlib.Data.Real.Basic
import Mathlib.Algebra.Order.Archimedean.Real.Basic
import LRA.Analysis.Integration.Partitions
import LRA.Analysis.Integration.RiemannIntegral.Basic
import LRA.Analysis.Continuity.MonotoneFunctions

namespace LRA.Analysis.Integration

variable {f g : ℝ → ℝ} {a b : ℝ}

                                                     
                                                                                                                               


             

       
                                                                                             
                
                          
                                                                 
   
  
noncomputable def LowerDarbouxSum (f : ℝ → ℝ) {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n,
    SubintervalWidth P i *
      sInf (f '' Set.Icc (P.points i.castSucc) (P.points i.succ))

                      
                                                                                                                               


             

       
                                                                                             
                
                          
                                                                 
   
  
noncomputable def UpperDarbouxSum (f : ℝ → ℝ) {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  ∑ i : Fin P.n,
    SubintervalWidth P i *
      sSup (f '' Set.Icc (P.points i.castSucc) (P.points i.succ))

                                   
                                                                                                    
                                                                                             
                     

             

       
                                                                                                  
                                                
                                                 
                                              
   
  
theorem darboux_refinement_squeeze (P P' : IntegrationPartition a b) (h : RefinesPartition P' P) :
    LowerDarbouxSum f P ≤ LowerDarbouxSum f P' ∧
    LowerDarbouxSum f P' ≤ UpperDarbouxSum f P' ∧
    UpperDarbouxSum f P' ≤ UpperDarbouxSum f P := by
  sorry

                                
                                                                                         


             

       
                                                       
                                                                                        
   
  
def IsDarbouxIntegrable (f : ℝ → ℝ) (a b : ℝ) : Prop :=
  ∀ ε > 0, ∃ P : IntegrationPartition a b, UpperDarbouxSum f P - LowerDarbouxSum f P < ε

                          
                                                                          
                                                                                           
                         

             

       
                                                                                         
                               
                                                                                            
   
  
theorem darboux_criterion (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsDarbouxIntegrable f a b ↔
      ∀ ε > 0, ∃ P : IntegrationPartition a b, UpperDarbouxSum f P - LowerDarbouxSum f P < ε := by
  sorry

                                    
                                                                                       
                                                             

             

       
                                                 
                                                                   
                                                         
   
  
theorem riemann_darboux_equivalence (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b)) :
    IsRiemannIntegrable f a b ↔ IsDarbouxIntegrable f a b := by
  sorry

                                      
                                                                                         
                                 

             

       
                                                   
                                                                     
                             
   
  
theorem continuous_darboux_integrable (hab : a ≤ b)
    (hcont : LRA.Analysis.Continuity.ContinuousOn' f (Set.Icc a b)) :
    IsDarbouxIntegrable f a b := by
  sorry

                                    
                                                                                                

             

       
                                                                                        
                             
   
  
theorem monotone_darboux_integrable (hab : a ≤ b) (hmono : MonotoneOn f (Set.Icc a b)) :
    IsDarbouxIntegrable f a b := by
  sorry

                                                  
                                                                                        
                                                                                    
                                                

             

       
                                                               
                                                                 
                                                                                                        
                             
   
  
theorem finite_discontinuities_darboux_integrable (hab : a ≤ b)
    (hbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b))
    (hfin : {x ∈ Set.Icc a b | LRA.Analysis.Continuity.PointOfDiscontinuity f (Set.Icc a b) x}.Finite) :
    IsDarbouxIntegrable f a b := by
  sorry

                                               
                                                                                                 
                                                       

             

       
                                                                               
                                                
                                                        
   
  
theorem darboux_integrable_linear_combinations (hf : IsDarbouxIntegrable f a b)
    (hg : IsDarbouxIntegrable g a b) (α β : ℝ) :
    IsDarbouxIntegrable (fun x => α * f x + β * g x) a b := by
  sorry

                                    
                                                                                  
                                               

             

       
                                                                                                       
                                                
   
  
theorem darboux_integrable_products (hf : IsDarbouxIntegrable f a b) (hg : IsDarbouxIntegrable g a b) :
    IsDarbouxIntegrable (fun x => f x * g x) a b := by
  sorry

                                          
                                                                                         

             

       
                                                                            
                                            
   
  
theorem darboux_integrable_absolute_value (hf : IsDarbouxIntegrable f a b) :
    IsDarbouxIntegrable (fun x => |f x|) a b := by
  sorry

                                                  
                                                                  
                                                                                      
                                                                    
                                             

             

       
                                                                                  
                                                                  
                                                       
                                                      
                                              
   
  
theorem darboux_integrable_continuous_composition (hf : IsDarbouxIntegrable f a b)
    (hfbdd : LRA.Analysis.Continuity.BoundedOnSet f (Set.Icc a b))
    (J : Set ℝ) (hJ : f '' Set.Icc a b ⊆ J) (φ : ℝ → ℝ)
    (hφ : LRA.Analysis.Continuity.ContinuousOn' φ J) :
    IsDarbouxIntegrable (fun x => φ (f x)) a b := by
  sorry

                                                                      
        

             

       
                                          
                         
                  
                 
                                                                                  
   
  
theorem dirichlet_not_darboux_integrable :
    ¬ IsDarbouxIntegrable
      (fun x => by
        classical
        exact if LRA.Analysis.Completeness.IsIrrational x then (0 : ℝ) else 1) 0 1 := by
  sorry

end LRA.Analysis.Integration
