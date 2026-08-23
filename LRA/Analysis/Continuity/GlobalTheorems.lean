  
                                                             
                                                                        

                                                                    
                                                                        
                           
  

import Mathlib.Data.Real.Basic
import LRA.Analysis.Continuity.PointContinuity

namespace LRA.Analysis.Continuity

                                                                

             

       
                                                   
                                  
   
  
def ContinuousOn' (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, ContinuousAtPoint f A x

                                                                    
                                                                          
                                                         

             

       
                                                  
                             
   
  
def BoundedOnSet (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ M > 0, ∀ x ∈ A, |f x| ≤ M

                            
                                                                                                
                               

             

       
                                                              
                                                                       
   
  
theorem BoundednessTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) : BoundedOnSet f (Set.Icc a b) := by
  sorry

                           

             

       
                                                               
                            
   
  
def IsAbsoluteMaximum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∀ x ∈ A, f x ≤ f c

   
                                                                         

             

       
                                                               
                            
   
  
def IsAbsoluteMinimum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∀ x ∈ A, f c ≤ f x

                              
                                                                                                    
                                                                                      

             

       
                                                               
                                          
                                                
                                              
   
  
theorem ExtremeValueTheorem (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    (∃ c, IsAbsoluteMaximum f (Set.Icc a b) c) ∧
    (∃ c, IsAbsoluteMinimum f (Set.Icc a b) c) := by
  sorry

                          
                                                                                                    
                                                  

             

       
                                                           
                                                                  
                              
   
  
theorem LocationOfRoots (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf : ContinuousOn' f (Set.Icc a b)) (hsign : f a * f b < 0) :
    ∃ c ∈ Set.Ioo a b, f c = 0 := by
  sorry

                                   
                                                                                                   
                                                                              

             

       
                                                                      
                                        
                                                      
                              
   
  
theorem BolzanoIntermediateValue (f : ℝ → ℝ) (a b y : ℝ) (hab : a < b)
    (hf : ContinuousOn' f (Set.Icc a b))
    (hy : (f a < y ∧ y < f b) ∨ (f b < y ∧ y < f a)) :
    ∃ c ∈ Set.Ioo a b, f c = y := by
  sorry

                                  
                                                                                                  
                    

             

       
                                                                             
                                                    
   
  
theorem PreservationOfIntervals (f : ℝ → ℝ) (I : Set ℝ) (hI : I.OrdConnected)
    (hf : ContinuousOn' f I) : (f '' I).OrdConnected := by
  sorry

                         
                                              
                                                                 
                                                          
               

             

       
                                                     
                                                                        
                    
   
  
def DarbouxProperty (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ y : ℝ, (f a < y ∧ y < f b) ∨ (f b < y ∧ y < f a) →
    ∃ c ∈ A, f c = y

                                                                                              
                      

             

       
                                                                
                                                                        
   
  
theorem ContinuousImpliesDarbouxProperty (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) : DarbouxProperty f I := by
  sorry

                     
                                                                                                   
                                                                                     

             

       
                                                       
                                          
                                                           
                                   
   
  
theorem HeineCantor (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∀ ε > 0, ∃ δ > 0, ∀ x ∈ Set.Icc a b, ∀ y ∈ Set.Icc a b,
      |x - y| < δ → |f x - f y| < ε := by
  sorry

                                         
                                                                                                   
                                             

             

       
                                                                        
                                          
                                                 
   
  
theorem ImageOfClosedBoundedInterval (f : ℝ → ℝ) (a b : ℝ) (hab : a ≤ b)
    (hf : ContinuousOn' f (Set.Icc a b)) :
    ∃ m M, m ≤ M ∧ f '' Set.Icc a b = Set.Icc m M := by
  sorry

end LRA.Analysis.Continuity
