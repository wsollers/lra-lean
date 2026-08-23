  
                                                             
                                                                              
                                                                              
                           

                                                                           
                                                                        
                                                                     
                                                                         
                                                                  
                            
  

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.StructureOfRealLine

                    

             

       
                                                   
   
  
def OpenBall (x r : ℝ) : Set ℝ := {y | |x - y| < r}

                                

             

       
                                                                          
   
  
def IsNeighborhood (N : Set ℝ) (x : ℝ) : Prop := ∃ r > 0, OpenBall x r ⊆ N

                   

             

       
                                                                      
   
  
def IsOpenSet (U : Set ℝ) : Prop := ∀ x ∈ U, ∃ r > 0, OpenBall x r ⊆ U

                              
                                                                    

             

       
                                                                            
   
  
theorem OpenIntervalIsOpen (a b : ℝ) (hab : a < b) : IsOpenSet (Set.Ioo a b) := by
  sorry

                                    
                                                                                                    
                                                                                                
                                          

             

       
                                  
                                                          
                                                                                   
                                                                                  
   
  
theorem OpenSetClosureOperations :
    IsOpenSet (∅ : Set ℝ) ∧ IsOpenSet (Set.univ : Set ℝ) ∧
    (∀ (ι : Type) (U : ι → Set ℝ), (∀ i, IsOpenSet (U i)) → IsOpenSet (⋃ i, U i)) ∧
    (∀ (n : ℕ) (U : Fin n → Set ℝ), (∀ i, IsOpenSet (U i)) → IsOpenSet (⋂ i, U i)) := by
  sorry

                     

             

       
                                                  
   
  
def IsClosedSet (F : Set ℝ) : Prop := IsOpenSet Fᶜ

                                         
                                                                                                 
   

             

       
                                                  
                                                                            
   
  
theorem ClosedIffContainsLimitPoints (F : Set ℝ) :
    IsClosedSet F ↔ ∀ x : ℝ, (∀ r > 0, (OpenBall x r \ {x}) ∩ F ≠ ∅) → x ∈ F := by
  sorry

                         

             

       
                                                                           
   
  
def IsInteriorPoint (A : Set ℝ) (x : ℝ) : Prop := ∃ r > 0, OpenBall x r ⊆ A

                         

             

       
                                                                            
   
  
def IsExteriorPoint (A : Set ℝ) (x : ℝ) : Prop := ∃ r > 0, OpenBall x r ⊆ Aᶜ

                         

             

       
                                                 
                                                                    
   
  
def IsBoundaryPoint (A : Set ℝ) (x : ℝ) : Prop :=
  (∀ r > 0, OpenBall x r ∩ A ≠ ∅) ∧ (∀ r > 0, OpenBall x r ∩ Aᶜ ≠ ∅)

                          

             

       
                                                              
   
  
def Interior' (A : Set ℝ) : Set ℝ := {x | IsInteriorPoint A x}

                      

             

       
                                                                                          
   
  
def IsLimitPoint (A : Set ℝ) (x : ℝ) : Prop := ∀ r > 0, ∃ a ∈ A, 0 < |a - x| ∧ |a - x| < r

                         

             

       
                                                 
                                         
   
  
def IsIsolatedPoint (A : Set ℝ) (x : ℝ) : Prop :=
  x ∈ A ∧ ∃ r > 0, OpenBall x r ∩ A = {x}

                                      
                                                                                                    
                                                                                              
                                                        

             

       
                                    
                                                              
                                                                                       
                                                                                      
   
  
theorem ClosedSetClosureOperations :
    IsClosedSet (∅ : Set ℝ) ∧ IsClosedSet (Set.univ : Set ℝ) ∧
    (∀ (ι : Type) (F : ι → Set ℝ), (∀ i, IsClosedSet (F i)) → IsClosedSet (⋂ i, F i)) ∧
    (∀ (n : ℕ) (F : Fin n → Set ℝ), (∀ i, IsClosedSet (F i)) → IsClosedSet (⋃ i, F i)) := by
  sorry

end LRA.Analysis.StructureOfRealLine
