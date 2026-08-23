  
                                                             
                                                                                           
                            

                                                                  
                                         
  

import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.Analysis.Continuity.GlobalTheorems
import LRA.Analysis.Continuity.PointContinuity

namespace LRA.Analysis.Continuity

                                  
                                                                                                 
                                                                                                
                                                                  

             

       
                                                         
                                                                         
                                                                         
                                                                       
   
  
theorem MonotoneHasOneSidedLimits (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I) :
    (∃ L, ∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c → |f x - L| < ε) ∧
    (∃ L, ∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ → |f x - L| < ε) := by
  sorry

                                                                                                 
                                                                                               
                                                                                       

             

       
                                                                        
                                                                         
                             
                                                                        
                                                                      
   
  
theorem MonotoneContinuousIffOneSidedLimitsAgree (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I) :
    ContinuousAtPoint f I c ↔
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c → |f x - f c| < ε) ∧
      (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ → |f x - f c| < ε) := by
  sorry

                                                                      
                                                   

             

       
                                                      
                      
                                                                      
                                                                      
               
   
  
def JumpOf (f : ℝ → ℝ) (I : Set ℝ) (c J : ℝ) : Prop :=
  0 ≤ J ∧ ∃ L₁ L₂ : ℝ,
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c - δ < x → x < c -> |f x - L₁| < ε) ∧
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ I, c < x → x < c + δ -> |f x - L₂| < ε) ∧
    J = L₂ - L₁

                                                                                                 
                                                                                       

             

       
                                                               
                                                                       
                                          
                           
   
  
theorem MonotoneDiscontinuitiesAreJumps (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c : ℝ) (hc : c ∈ I)
    (hdisc : PointOfDiscontinuity f I c) :
    ∃ J > 0, JumpOf f I c J := by
  sorry

                                                                                                 
                                                                                             
                 

             

       
                                                     
                                                              
                                                                           
                               
                                                       
            
                            
                            
   
  
theorem JumpIntervalsDisjoint (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) (c₁ c₂ : ℝ)
    (hc₁ : PointOfDiscontinuity f I c₁) (hc₂ : PointOfDiscontinuity f I c₂)
    (hne : c₁ ≠ c₂) (J₁ J₂ : ℝ)
    (hj₁ : JumpOf f I c₁ J₁) (hj₂ : JumpOf f I c₂ J₂) :
    Disjoint
      (Set.Ioc c₁ (c₁ + J₁))
      (Set.Ioc c₂ (c₂ + J₂)) := by
  sorry

                                           
                                                                                              
                                                             

             

       
                                                                
                                                    
                                                              
   
  
theorem MonotoneDiscontinuitiesCountable (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hmono : MonotoneOn f I) :
    Set.Countable {c : ℝ | c ∈ I ∧ PointOfDiscontinuity f I c} := by
  sorry

                                                                                              
                                                      

             

       
                                                                
                                                    
                                                       
   
  
theorem ContinuousInjectiveIffStrictMono (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) :
    Set.InjOn f I ↔ StrictMonoOn f I ∨ StrictAntiOn f I := by
  sorry

                                   
                                                                                              
                                                                                             
               

             

       
                                                        
                                                                             
                                                      
                               
   
  
theorem ContinuousInverseTheorem (f : ℝ → ℝ) (I : Set ℝ)
    (hI : I.OrdConnected) (hf : ContinuousOn' f I) (hmono : StrictMonoOn f I)
    (finv : ℝ → ℝ) (hfinv : ∀ x ∈ I, finv (f x) = x) :
    ContinuousOn' finv (f '' I) := by
  sorry

                                                                        
                                
                                                                        

                                                                   
                                                                   
                                                                     
        

             

       
                                                        
                    
                                                        
                             
                                            
   
  
def LimsupAt (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  (∀ ε > 0, ∃ δ > 0,
    ∀ x ∈ A, 0 < |x - c| → |x - c| < δ -> f x < L + ε) ∧
  (∀ ε > 0, ∀ δ > 0, ∃ x ∈ A,
    0 < |x - c| ∧ |x - c| < δ ∧ L - ε < f x)

   
                                                                      
                                                                        
                                                                     
                     

             

       
                                                        
                    
                                                        
                             
                                            
   
  
def LiminfAt (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) : Prop :=
  (∀ ε > 0, ∃ δ > 0,
    ∀ x ∈ A, 0 < |x - c| → |x - c| < δ -> L - ε < f x) ∧
  (∀ ε > 0, ∀ δ > 0, ∃ x ∈ A,
    0 < |x - c| ∧ |x - c| < δ ∧ f x < L + ε)

                                                                                                  
                                                                    

             

       
                                                                     
                                                                            
                                         
   
  
theorem TendstoIffLimsupAndLiminf (f : ℝ → ℝ) (A : Set ℝ) (c L : ℝ) :
    (∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| → |x - c| < δ → |f x - L| < ε) ↔
      LimsupAt f A c L ∧ LiminfAt f A c L := by
  sorry

                                                      
                                                                
          

             

       
                                                            
                                                           
           
   
  
theorem LiminfLeLimsup (f : ℝ → ℝ) (A : Set ℝ) (c L₁ L₂ : ℝ)
    (hInf : LiminfAt f A c L₁) (hSup : LimsupAt f A c L₂) :
    L₁ ≤ L₂ := by
  sorry

end LRA.Analysis.Continuity
