  
                                                             
                                                                 
                             

                                                                        
                                                              
                                                                        
                                                  
  

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Continuity

                                                                        
             

             

       
                                           
       
                          
                         
                                   
                                                                     
   
  
structure IntervalPartition (a b : ℝ) where
  n : ℕ
  points : Fin (n + 1) → ℝ
  first_eq : points 0 = a
  last_eq : points (Fin.last n) = b
  mono : ∀ i j : Fin (n + 1), (i : ℕ) < (j : ℕ) → points i < points j

                                                                         
          

             

       
                                                                       
                 
                                                                            
   
  
structure TaggedPartition (a b : ℝ) extends IntervalPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc (points i.castSucc) (points i.succ)

                                                                 
                                                            

             

       
                                           
                            
   
  
def IsGauge (a b : ℝ) (δ : ℝ → ℝ) : Prop :=
  ∀ x ∈ Set.Icc a b, δ x > 0

                                                                      
                                                    

             

       
                                                                         
                
                                                 
                                           
   
  
def IsDeltaFine {a b : ℝ} (P : TaggedPartition a b) (δ : ℝ → ℝ) : Prop :=
  ∀ i : Fin P.n,
    P.points i.castSucc ≥ P.tag i - δ (P.tag i) ∧
    P.points i.succ ≤ P.tag i + δ (P.tag i)

                        
                                                                                       
                                      

             

       
                                                          
                          
                                              
   
  
theorem CousinsTheorem (a b : ℝ) (hab : a ≤ b) (δ : ℝ → ℝ)
    (hδ : IsGauge a b δ) :
    ∃ P : TaggedPartition a b, IsDeltaFine P δ := by
  sorry

                                                          

             

       
                                                                     
   
   
  
noncomputable def MeshOf {a b : ℝ} (P : IntervalPartition a b) : ℝ :=
  0

                                                                          
                            

             

       
                                                                    
                                                                   
   
  
def IsRefinementOf {a b : ℝ} (Q P : IntervalPartition a b) : Prop :=
  ∀ i : Fin (P.n + 1), ∃ j : Fin (Q.n + 1), Q.points j = P.points i

                                                                         
                                      

             

       
                                                                           
                                                                        
   
  
def HasCommonRefinement {a b : ℝ} (P₁ P₂ : IntervalPartition a b) : Prop :=
  ∃ Q : IntervalPartition a b, IsRefinementOf Q P₁ ∧ IsRefinementOf Q P₂

                                                                                        

             

       
                                                                          
                             
   
  
theorem CommonRefinementExists {a b : ℝ} (P₁ P₂ : IntervalPartition a b) :
    HasCommonRefinement P₁ P₂ := by
  sorry

                                   
                                                                                                    
                                         

             

       
                                                                    
                                                                                         
   
  
theorem EveryPointCoveredByTag {a b : ℝ} (P : TaggedPartition a b) :
    ∀ x ∈ Set.Icc a b, ∃ i : Fin P.n, x ∈ Set.Icc (P.points i.castSucc) (P.points i.succ) := by
  sorry

end LRA.Analysis.Continuity
