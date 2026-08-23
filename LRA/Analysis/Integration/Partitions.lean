  
                                                                                             
                                                                                   

                                                                        
                                                                        
                                                                     
  

import Mathlib.Data.Real.Basic
import Mathlib.Algebra.Order.Archimedean.Real.Basic

namespace LRA.Analysis.Integration

                                                                         
                                                                          
                

             

       
                                              
       
                          
                         
                                   
                                                       
   
  
structure IntegrationPartition (a b : ℝ) where
  n : ℕ
  points : Fin (n + 1) → ℝ
  first_eq : points 0 = a
  last_eq : points (Fin.last n) = b
  mono : ∀ i : Fin n, points i.castSucc < points i.succ

                                        
                                                                                                                    


             

       
                                                                                  
                                       
   
  
def SubintervalWidth {a b : ℝ} (P : IntegrationPartition a b) (i : Fin P.n) : ℝ :=
  P.points i.succ - P.points i.castSucc

                         
                                                                                                                 


             

       
                                                                               
                                                                
   
  
noncomputable def PartitionMesh {a b : ℝ} (P : IntegrationPartition a b) : ℝ :=
  sSup ({0} ∪ {w : ℝ | ∃ i : Fin P.n, w = SubintervalWidth P i})

                                                                       
                                                                                                                 
                    

             

       
                                                                                     
                 
                                                                            
   
  
structure TaggedPartitionIntegration (a b : ℝ) extends IntegrationPartition a b where
  tag : Fin n → ℝ
  tag_mem : ∀ i : Fin n, tag i ∈ Set.Icc (points i.castSucc) (points i.succ)

                                                                         
                                                                                                            
                             

             

       
                                                                          
                                                                     
   
  
def RefinesPartition {a b : ℝ} (P' P : IntegrationPartition a b) : Prop :=
  ∀ i : Fin (P.n + 1), ∃ j : Fin (P'.n + 1), P'.points j = P.points i

                                     
                                                                                             
                                             

             

       
                                                                                 
                                                                               
   
  
theorem common_refinement_partitions {a b : ℝ} (P Q : IntegrationPartition a b) :
    ∃ R : IntegrationPartition a b, RefinesPartition R P ∧ RefinesPartition R Q := by
  sorry

end LRA.Analysis.Integration
