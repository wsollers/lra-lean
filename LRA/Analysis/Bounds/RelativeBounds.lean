  
                                                             
                                                                         
                                                                            
                                                                   
                                                                  
                                                                             
                                                                           
                                                                     

                                                                          
                                                                          
                                                                            
                                                                             
  

import Mathlib.Order.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt
import Mathlib.Data.Rat.Cast.Defs

namespace LRA.Analysis.Bounds

variable {T : Type*} [Preorder T]

                          

             

       
                                                        
                        
   
  
def IsRelativeUpperBound (u : T) (A S : Set T) : Prop :=
  u ∈ S ∧ ∀ a ∈ A, a ≤ u

                          

             

       
                                                        
                        
   
  
def IsRelativeLowerBound (l : T) (A S : Set T) : Prop :=
  l ∈ S ∧ ∀ a ∈ A, l ≤ a

                                    

             

       
                                                      
                                                                
   
  
def IsRelativeSupremum (s : T) (A S : Set T) : Prop :=
  IsRelativeUpperBound s A S ∧ ∀ u ∈ S, (∀ a ∈ A, a ≤ u) → s ≤ u

                                    

             

       
                                                     
                                                                
   
  
def IsRelativeInfimum (i : T) (A S : Set T) : Prop :=
  IsRelativeLowerBound i A S ∧ ∀ l ∈ S, (∀ a ∈ A, l ≤ a) → l ≤ i

                                                                   
                                                  
                                                                      

                                                                                                    
     

             

       
                                             
                                                          
                            
   
  
theorem OrdinarySupremumInSIsRelativeSupremum
    (A S : Set T) (s : T) (hs : IsLUB A s) (hsS : s ∈ S) :
    IsRelativeSupremum s A S := by
  sorry

                                                                                                   
     

             

       
                                           
                                                          
                           
   
  
theorem OrdinaryInfimumInSIsRelativeInfimum
    (A S : Set T) (i : T) (hi : IsGLB A i) (hiS : i ∈ S) :
    IsRelativeInfimum i A S := by
  sorry

                                                                     
                                                                  
         

             

       
                                                
                                            
   
  
def RationalsWithSquareLessThanTwoInR : Set ℝ :=
  {x : ℝ | ∃ q : ℚ, x = (q : ℝ) ∧ q ^ 2 < 2}

                                                                                          
                           

             

       
                                              
                                                                     
                               
   
  
theorem NoRelativeSupremumOfRationalsExample :
    ¬ ∃ s : ℝ, IsRelativeSupremum s RationalsWithSquareLessThanTwoInR
      (Set.range ((↑) : ℚ → ℝ)) := by
  sorry

                                                                                           
                    

             

       
                                               
                                                                      
                        
   
  
theorem RelativeSupremumOfRationalsInRExample :
    IsRelativeSupremum (Real.sqrt 2) RationalsWithSquareLessThanTwoInR
      (Set.univ : Set ℝ) := by
  sorry

end LRA.Analysis.Bounds
