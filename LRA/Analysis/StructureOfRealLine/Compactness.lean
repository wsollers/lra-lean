  
                                                             
                                                                           
                                

                                                                           
                                                                          
                                                                         
                                                          
                                                                        
                                                                    
                                                                  
                                                                     
            
  

import Mathlib.Data.Real.Basic
import LRA.Analysis.StructureOfRealLine.OpenClosedSets
import LRA.Analysis.StructureOfRealLine.CompactnessAdditions

namespace LRA.Analysis.StructureOfRealLine

                          

             

       
                                                       
                                         
   
  
def IsOpenCover (𝒰 : Set (Set ℝ)) (K : Set ℝ) : Prop :=
  (∀ U ∈ 𝒰, IsOpenSet U) ∧ K ⊆ ⋃ U ∈ 𝒰, U

                          

             

       
                                                                              
                                   
   
  
def IsFiniteSubcover (𝒱 : Set (Set ℝ)) (𝒰 : Set (Set ℝ)) (K : Set ℝ) : Prop :=
  𝒱 ⊆ 𝒰 ∧ 𝒱.Finite ∧ K ⊆ ⋃ U ∈ 𝒱, U

                      

             

       
                                      
                                                                  
   
  
def IsCompactSet (K : Set ℝ) : Prop :=
  ∀ 𝒰 : Set (Set ℝ), IsOpenCover 𝒰 K → ∃ 𝒱, IsFiniteSubcover 𝒱 𝒰 K

                                       
                                                                                                

             

       
                                                                       
                                             
   
  
theorem CompactImpliesClosedBounded (K : Set ℝ) (hK : IsCompactSet K) :
    IsClosedSet K ∧ ∃ M > 0, ∀ x ∈ K, |x| ≤ M := by
  sorry

                                        
                                                                       

             

       
                                                              
                              
   
  
theorem ClosedBoundedIntervalCompact (a b : ℝ) (hab : a ≤ b) :
    IsCompactSet (Set.Icc a b) := by
  sorry

                                                          

             

       
                                                                             
   
  
theorem IsCompactSetIffIsCompactR (K : Set ℝ) : IsCompactSet K ↔ IsCompactR K := by
  sorry

                                                        

             

       
                                                                         
   
  
theorem IsClosedSetIffIsClosedR (F : Set ℝ) : IsClosedSet F ↔ IsClosedR F := by
  sorry

                    
                                                                                       

             

       
                                
                                                              
   
  
theorem HeineBorel (K : Set ℝ) :
    IsCompactSet K ↔ IsClosedSet K ∧ ∃ M > 0, ∀ x ∈ K, |x| ≤ M := by
  sorry

end LRA.Analysis.StructureOfRealLine
