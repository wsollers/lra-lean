  
                                                             
                                                                                              
                               

                                                                   
                                                            
                                                                        
                                                                      
                                                                      
                                                                
                   
  

import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Differentiation.DerivativeDefinition

namespace LRA.Analysis.Differentiation

                           

             

       
                                                               
                                                   
   
  
def IsRelativeMinimum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ δ > 0, ∀ x ∈ A, |x - c| < δ → f c ≤ f x

                           

             

       
                                                               
                                                   
   
  
def IsRelativeMaximum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ δ > 0, ∀ x ∈ A, |x - c| < δ → f x ≤ f c

                                     
                                                                                   
                                                                                                 
       

             

       
                                                                  
                         
                                                                
                                                 
   
  
theorem NecessaryConditionExtremum (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A)
    (hext : IsRelativeMinimum f A c ∨ IsRelativeMaximum f A c) :
    ¬ IsDifferentiable f A c ∨ Derivative 0 f A c := by
  sorry

                                                                                   
                                                                                                 
       

             

       
                                                                          
                         
                                                                
                                                 
   
  
theorem RelativeExtremumNecessaryCondition (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ interior A)
    (hext : IsRelativeMinimum f A c ∨ IsRelativeMaximum f A c) :
    Derivative 0 f A c ∨ ¬ IsDifferentiable f A c := by
  sorry

                                                                        
            

             

       
                                                
                  
                                            
                                                     
   
  
def IsConvexOn (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  I.OrdConnected ∧
  ∀ x ∈ I, ∀ y ∈ I, ∀ t : ℝ, 0 ≤ t → t ≤ 1 →
    f (t * x + (1 - t) * y) ≤ t * f x + (1 - t) * f y

                           

             

       
                                                 
                  
                                            
                                                     
   
  
def IsConcaveOn (f : ℝ → ℝ) (I : Set ℝ) : Prop :=
  I.OrdConnected ∧
  ∀ x ∈ I, ∀ y ∈ I, ∀ t : ℝ, 0 ≤ t → t ≤ 1 →
    t * f x + (1 - t) * f y ≤ f (t * x + (1 - t) * y)

                                                                         
                                                                       
                        

             

       
                                              
                                                                                   
                                                                                 
   
  
def IsInflection (f : ℝ → ℝ) (c : ℝ) : Prop :=
  (∃ δ > 0, IsConvexOn f (Set.Icc (c - δ) c) ∧ IsConcaveOn f (Set.Icc c (c + δ))) ∨
  (∃ δ > 0, IsConcaveOn f (Set.Icc (c - δ) c) ∧ IsConvexOn f (Set.Icc c (c + δ)))

end LRA.Analysis.Differentiation
