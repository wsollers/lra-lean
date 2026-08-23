  
                                                             
                                                                                  
                                                      
                                                             
                                                                                        
                                                                     
                                                                
                                                                             
                                                                   
                                                                     
                                                                       
                                               

                                                                    
                                                                     
                                                                  
                                                                       
                                                                     
                                                                    
                                                                     
                                                                        
                                                                      
                                                                     
                                                                  
                                                                    
                                                       

                                                                 
                                                                     
                                                                  
                                                                     
                                                                
                                                                 
                                                     

                                                                  
                                                                       
                                                                       
                                                                      
                                                                       
                                                                    
                                                                      
                                                                     
                                                                    
           

                                                                        
                                                                         
                                                                       
                                                           
                                                                         
                                                                  
                                                                      
                                                                      
                                                                      
                                                                      
                                                                   
                                                                    
                                               
  

import Mathlib.Order.Basic
import Mathlib.Algebra.Order.Archimedean.Real.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Monotonicity
import LRA.Analysis.Sequences.Subsequences

namespace LRA.Analysis.Sequences

                                 

             

       
                                                                                         
    
              
                                              
   
  
noncomputable def TailSupSeq (x : RealSequence) (h : BoundedAboveSeq x) : RealSequence :=
  fun n => sSup (x '' {k : ℕ | n ≤ k})

                                

             

       
                                                                                         
    
              
                                              
   
  
noncomputable def TailInfSeq (x : RealSequence) (h : BoundedBelowSeq x) : RealSequence :=
  fun n => sInf (x '' {k : ℕ | n ≤ k})

                                                                        
                                                       

             

       
                                                  
                                                         
   
  
def LimsupSeq (x : RealSequence) (L : ℝ) : Prop :=
  ∃ h : BoundedAboveSeq x, ConvergesTo (TailSupSeq x h) L

                          

             

       
                                                  
                                                         
   
  
def LiminfSeq (x : RealSequence) (L : ℝ) : Prop :=
  ∃ h : BoundedBelowSeq x, ConvergesTo (TailInfSeq x h) L

                                    
                                                                                             

             

       
                                                                             
                                 
   
  
theorem TailSupremaAreDecreasing {x : RealSequence} (h : BoundedAboveSeq x) :
    IsDecreasing (TailSupSeq x h) := by
  sorry

                                   
                                                                                             

             

       
                                                                            
                                 
   
  
theorem TailInfimaAreIncreasing {x : RealSequence} (h : BoundedBelowSeq x) :
    IsIncreasing (TailInfSeq x h) := by
  sorry

                            
                                                                                                   
                             

             

       
                                                                  
                                                               
   
  
theorem LiminfBelowLimsup {x : RealSequence} (hbdd : BoundedSeq x)
    {I S : ℝ} (hI : LiminfSeq x I) (hS : LimsupSeq x S) : I ≤ S := by
  sorry

                                             
                                                                                                    
                      

             

       
                                                           
                                   
                                                     
   
  
theorem ConvergenceIffLiminfEqualsLimsup {x : RealSequence}
    (hbdd : BoundedSeq x) {L : ℝ} :
    ConvergesTo x L ↔ (LiminfSeq x L ∧ LimsupSeq x L) := by
  sorry

                                           
                                                                                               
                                                                   

             

       
                                                          
                                                        
                                                                    
   
  
theorem LimsupLargestSubsequentialLimit {x : RealSequence}
    (hbdd : BoundedSeq x) {S : ℝ} (hS : LimsupSeq x S) :
    IsSubsequentialLimit x S ∧ ∀ L, IsSubsequentialLimit x L → L ≤ S := by
  sorry

                                            
                                                                                               
                                                                   

             

       
                                                           
                                                        
                                                                    
   
  
theorem LiminfSmallestSubsequentialLimit {x : RealSequence}
    (hbdd : BoundedSeq x) {I : ℝ} (hI : LiminfSeq x I) :
    IsSubsequentialLimit x I ∧ ∀ L, IsSubsequentialLimit x L → I ≤ L := by
  sorry

                                                
                                                                                                   
                                                                                                
     

             

       
                                                              
                                                                               
                                                                                  
   
  
theorem OscillationCriterionViaLiminfLimsup {x : RealSequence}
    (hbdd : BoundedSeq x) {I S : ℝ} (hI : LiminfSeq x I) (hS : LimsupSeq x S) :
    I < S ↔ ∃ L K : ℝ, L ≠ K ∧ IsSubsequentialLimit x L ∧ IsSubsequentialLimit x K := by
  sorry

                                               
                                                                                                   
                                                                                             

             

       
                                                               
                                           
                                                 
                                                           
   
  
theorem LimsupComparisonUnderEventualOrder {x y : RealSequence}
    (hx : BoundedSeq x) (hy : BoundedSeq y)
    (h : ∃ N : ℕ, ∀ n ≥ N, x n ≤ y n) {Sx Sy : ℝ}
    (hSx : LimsupSeq x Sx) (hSy : LimsupSeq y Sy) : Sx ≤ Sy := by
  sorry

                                               
                                                                                                   
                                                                                             

             

       
                                                               
                                           
                                                 
                                                           
   
  
theorem LiminfComparisonUnderEventualOrder {x y : RealSequence}
    (hx : BoundedSeq x) (hy : BoundedSeq y)
    (h : ∃ N : ℕ, ∀ n ≥ N, x n ≤ y n) {Ix Iy : ℝ}
    (hIx : LiminfSeq x Ix) (hIy : LiminfSeq y Iy) : Ix ≤ Iy := by
  sorry

                                            
                                                                                                   
                                                                                              
                                                                      

             

       
                                                              
                                                               
                                                 
                                                                
                                              
   
  
theorem LimsupSqueezeUnderEventualOrder {a x b : RealSequence}
    (ha : BoundedSeq a) (hx : BoundedSeq x) (hb : BoundedSeq b)
    (h : ∃ N : ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n)
    {Sa Sx Sb : ℝ} (hSa : LimsupSeq a Sa) (hSx : LimsupSeq x Sx)
    (hSb : LimsupSeq b Sb) : Sa ≤ Sx ∧ Sx ≤ Sb := by
  sorry

                                            
                                                                                                   
                                                                                              
                                                                      

             

       
                                                              
                                                               
                                                 
                                                                
                                              
   
  
theorem LiminfSqueezeUnderEventualOrder {a x b : RealSequence}
    (ha : BoundedSeq a) (hx : BoundedSeq x) (hb : BoundedSeq b)
    (h : ∃ N : ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n)
    {Ia Ix Ib : ℝ} (hIa : LiminfSeq a Ia) (hIx : LiminfSeq x Ix)
    (hIb : LiminfSeq b Ib) : Ia ≤ Ix ∧ Ix ≤ Ib := by
  sorry

                                                                                              

             

       
                                                         
                                                  
   
  
theorem LimsupNegEqNegLiminf {x : RealSequence} {L : ℝ} :
    LimsupSeq (fun n => -x n) L ↔ LiminfSeq x (-L) := by
  sorry

                                                                                              

             

       
                                                         
                                                  
   
  
theorem LiminfNegEqNegLimsup {x : RealSequence} {L : ℝ} :
    LiminfSeq (fun n => -x n) L ↔ LimsupSeq x (-L) := by
  sorry

end LRA.Analysis.Sequences
