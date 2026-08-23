  
                                                             
                                                                                 
                                                

                                                                          
                               
  

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Continuity

                                                                       
           

             

       
                                                         
                       
   
  
def RelativeNeighborhood (A : Set ℝ) (c ε : ℝ) : Set ℝ :=
  {x ∈ A | |x - c| < ε}

                                                                    
                                                                       
                           

             

       
                                                               
                                                          
   
  
def ContinuousAtPoint (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, |x - c| < δ → |f x - f c| < ε

                                                                         
                         

             

       
                                                                   
                                                                     
   
  
def ContinuousAtPointNbhd (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ RelativeNeighborhood A c δ, |f x - f c| < ε

                                                                                
                             

             

       
                                                                  
                                                         
   
  
theorem ContinuousAtPointIffNbhd (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    ContinuousAtPoint f A c ↔ ContinuousAtPointNbhd f A c := by
  sorry

                                                                     
                      

             

       
                                                                  
                                 
                                                 
                                                   
   
  
def ContinuousAtPointSeq (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  ∀ xs : ℕ → ℝ, (∀ n, xs n ∈ A) →
    (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε) →
    ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f c| < ε

                                                                                                 
                            

             

       
                                                                              
                                                        
   
  
theorem ContinuousAtPointIffSeq (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) (hc : c ∈ A) :
    ContinuousAtPoint f A c ↔ ContinuousAtPointSeq f A c := by
  sorry

                                                                    

             

       
                                                                  
                                   
   
  
def PointOfDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ¬ ContinuousAtPoint f A c

                                                                    
                                                                         

             

       
                                                                     
                                         
                                                 
                                                       
   
  
def SequentialDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ xs : ℕ → ℝ, (∀ n, xs n ∈ A) ∧
    (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - c| < ε) ∧
    ¬ (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f c| < ε)

                                                                                   
                               

             

       
                                                                    
                                                              
   
  
theorem DiscontinuityIffSequential (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    PointOfDiscontinuity f A c ↔ SequentialDiscontinuity f A c := by
  sorry

                                                            
                                                               

             

       
                                                                       
                                                                             
   
  
def NeighborhoodDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ ε > 0, ∀ δ > 0, ∃ x ∈ RelativeNeighborhood A c δ, |f x - f c| ≥ ε

                                                                                   
                                 

             

       
                                                                      
                                                                
   
  
theorem DiscontinuityIffNeighborhood (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) :
    PointOfDiscontinuity f A c ↔ NeighborhoodDiscontinuity f A c := by
  sorry

                                                                        
                                                                   
                                                                       
                                                                         
                            
                                                                        

                                                                        
                                                                        
                                          

             

       
                                                                      
                  
                                                                    
                                                                    
           
   
  
def IsRemovableDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ L : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L| < ε) ∧
    f c ≠ L

                                                                       
                

             

       
                                                                 
                      
                                                                     
                                                                     
           
   
  
def IsJumpDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  c ∈ A ∧ ∃ L₁ L₂ : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c - δ < x → x < c → |f x - L₁| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, c < x → x < c + δ → |f x - L₂| < ε) ∧
    (L₁ ≠ L₂ ∨ f c ≠ L₁)

                                                              
                                                   

             

       
                                                                      
                                                               
   
  
def IsEssentialDiscontinuity (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  PointOfDiscontinuity f A c ∧
    ¬ IsRemovableDiscontinuity f A c ∧
    ¬ IsJumpDiscontinuity f A c

                                                   
                                                                         

             

       
                                                                     
                                                                      
   
  
theorem JumpDiscontinuityNotEssential (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (h : IsJumpDiscontinuity f A c) : ¬ IsEssentialDiscontinuity f A c := by
  sorry

                                                                        
                                         
                                                                        

                                                                    
                                                                     
         

             

       
                                                              
         
                                         
                                                           
   
  
def OscillationOnSet (f : ℝ → ℝ) (A : Set ℝ) (ω : ℝ) : Prop :=
  0 ≤ ω ∧
    (∀ x ∈ A, ∀ y ∈ A, |f x - f y| ≤ ω) ∧
    ∀ b, 0 ≤ b → b < ω -> ∃ x ∈ A, ∃ y ∈ A, b < |f x - f y|

                                                                      
                                                                
                                                                      
                                                      

             

       
                                                                        
         
                               
                                                                      
                                            
                                                                
   
  
def OscillationAtPoint (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) (ω : ℝ) : Prop :=
  0 ≤ ω ∧
    (∀ ε > 0, ∃ δ > 0, ∃ Ω : ℝ,
      OscillationOnSet f (RelativeNeighborhood A c δ) Ω ∧ Ω < ω + ε) ∧
    (∀ b, 0 ≤ b → b < ω -> ∀ δ > 0, ∃ Ω : ℝ,
      OscillationOnSet f (RelativeNeighborhood A c δ) Ω ∧ b < Ω)

                                        
                                                                                                 
                            

             

       
                                                                           
                  
                                                        
   
  
theorem ContinuousAtPointIffZeroOscillation (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ)
    (hc : c ∈ A) :
    ContinuousAtPoint f A c ↔ OscillationAtPoint f A c 0 := by
  sorry

                                                                                                   
                                                            

             

       
                                                                           
                                          
                                
                                                         
   
  
theorem DiscontinuitySetEqUnionOscillationBounded (f : ℝ → ℝ) (A : Set ℝ) :
    {c ∈ A | PointOfDiscontinuity f A c} =
      ⋃ n : ℕ, {c ∈ A | ∃ ω : ℝ,
        OscillationAtPoint f A c ω ∧ 1 / (n + 1 : ℝ) ≤ ω} := by
  sorry

end LRA.Analysis.Continuity
