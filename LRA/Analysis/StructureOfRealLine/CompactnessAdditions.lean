  
                                                             
                                                                  
                                                                            
                                                                             
                                                                  
                                                                             
                     

                                                                           
                                                                           
                                                                        
                                                                         
                                                                 
                                                                            
              

                                                                           
                                                                          
                                                                         
                                                                        
  

import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.Basic

namespace LRA.Analysis.StructureOfRealLine

                                                                       
                                        

             

       
                                 
                                                
   
  
def IsOpenR (U : Set ℝ) : Prop :=
  ∀ x ∈ U, ∃ r > 0, ∀ y : ℝ, |x - y| < r → y ∈ U

                                                                        

             

       
                                   
                        
   
  
def IsClosedR (F : Set ℝ) : Prop :=
  IsOpenR (Set.univ \ F)

                                                                            
                                                                            
                                      

             

       
                                    
                               
                                         
                                    
   
  
def IsCompactR (K : Set ℝ) : Prop :=
  ∀ (ι : Type) (U : ι → Set ℝ),
    (∀ i, IsOpenR (U i)) → K ⊆ ⋃ i, U i →
    ∃ J : Finset ι, K ⊆ ⋃ i ∈ J, U i

                                                                   
                                                                       
                                                                      

                                                                              

             

       
                                      
                                                                        
                
   
  
theorem ClosedSubsetOfCompactIsCompact
    (F K : Set ℝ) (hFK : F ⊆ K) (hF : IsClosedR F) (hK : IsCompactR K) :
    IsCompactR F := by
  sorry

                                                                          
                                                                    
                                                                        
                                                                      
                                   

             

       
                                       
                               
                               
                                                           
   
  
def IsSeqCompactR (K : Set ℝ) : Prop :=
  ∀ x : ℕ → ℝ, (∀ n, x n ∈ K) →
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ L ∈ K, Filter.Tendsto (x ∘ φ) Filter.atTop (nhds L)

                                                           

             

       
                                                                  
                                  
   
  
theorem SequentialCompactnessIffOpenCoverCompactness (K : Set ℝ) :
    IsSeqCompactR K ↔ IsCompactR K := by
  sorry

end LRA.Analysis.StructureOfRealLine
