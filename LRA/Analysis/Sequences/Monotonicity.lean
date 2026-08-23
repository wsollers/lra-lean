  
                                                             
                                                                                  
                                                      
                                                             
                                                                                      
                                                                    
                                 

                                                               
                                                                       
                                                                        
                                                                         
                                                                   
                                                                        
                                                                         
                                                                          
                                                                         
                                                                  
                                                                        
                                                                        
                                                                      
                                                                       
                                                                
                                       

                                                                       
                                                                         
                                                                
                                                                    
                                                                
                                                                        
                                                                     
                                                                
                                                                  
                                                                      

                                                                
                                                               
                                                         

                                                       
                                                                      
                                                                
                                                                        
                                                                       
                                 
  

import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Tails
import LRA.Analysis.Bounds.Extrema.SupremaInfima

namespace LRA.Analysis.Sequences

open LRA.Analysis.Bounds (IsSupremum IsInfimum)

                              

             

       
                                                                  
   
  
def IsIncreasing (x : RealSequence) : Prop := ∀ n, x n ≤ x (n + 1)

                              

             

       
                                                                  
   
  
def IsDecreasing (x : RealSequence) : Prop := ∀ n, x (n + 1) ≤ x n

                                       

             

       
                                                                          
   
  
def IsStrictlyIncreasing (x : RealSequence) : Prop := ∀ n, x n < x (n + 1)

                                       

             

       
                                                                          
   
  
def IsStrictlyDecreasing (x : RealSequence) : Prop := ∀ n, x (n + 1) < x n

                            

             

       
                                                                              
   
  
def IsMonotoneSeq (x : RealSequence) : Prop := IsIncreasing x ∨ IsDecreasing x

                                         

             

       
                                                       
                                   
   
  
def IsEventuallyIncreasing (x : RealSequence) : Prop :=
  ∃ N : ℕ, ∀ n ≥ N, x n ≤ x (n + 1)

                                         

             

       
                                                       
                                   
   
  
def IsEventuallyDecreasing (x : RealSequence) : Prop :=
  ∃ N : ℕ, ∀ n ≥ N, x (n + 1) ≤ x n

                                       

             

       
                                                     
                                                     
   
  
def IsEventuallyMonotone (x : RealSequence) : Prop :=
  IsEventuallyIncreasing x ∨ IsEventuallyDecreasing x

                                     
                                                                                                 
                                              

             

       
                                                               
                                                        
                                                     
   
  
theorem MonotoneConvergenceTheoremIncreasing {x : RealSequence}
    (hinc : IsIncreasing x) (hbdd : BoundedAboveSeq x) :
    ∃ L, ConvergesTo x L ∧ IsSupremum L (Set.range x) := by
  sorry

                                     
                                                                                                 
                                             

             

       
                                                               
                                                        
                                                    
   
  
theorem MonotoneConvergenceTheoremDecreasing {x : RealSequence}
    (hdec : IsDecreasing x) (hbdd : BoundedBelowSeq x) :
    ∃ L, ConvergesTo x L ∧ IsInfimum L (Set.range x) := by
  sorry

                                                 
                                                                                   

             

       
                                                            
                                                 
   
  
theorem StrictIncreasingImpliesIncreasing {x : RealSequence}
    (h : IsStrictlyIncreasing x) : IsIncreasing x := by
  sorry

                                                 
                                                                                   

             

       
                                                            
                                                 
   
  
theorem StrictDecreasingImpliesDecreasing {x : RealSequence}
    (h : IsStrictlyDecreasing x) : IsDecreasing x := by
  sorry

                                               
                                                                                                   
   

             

       
                                                                  
                          
                                              
   
  
theorem BoundedMonotoneSequenceEquivalencesIncr {x : RealSequence}
    (h : IsIncreasing x) :
    (∃ L, ConvergesTo x L) ↔ BoundedAboveSeq x := by
  sorry

                                               
                                                                                                   
   

             

       
                                                                  
                          
                                              
   
  
theorem BoundedMonotoneSequenceEquivalencesDecr {x : RealSequence}
    (h : IsDecreasing x) :
    (∃ L, ConvergesTo x L) ↔ BoundedBelowSeq x := by
  sorry

                                                                           

             

       
                                                            
                                         
   
  
theorem IncreasingBoundedBelowByFirstTerm {x : RealSequence}
    (h : IsIncreasing x) : ∀ n, x 0 ≤ x n := by
  sorry

                                                                           

             

       
                                                            
                                         
   
  
theorem DecreasingBoundedAboveByFirstTerm {x : RealSequence}
    (h : IsDecreasing x) : ∀ n, x n ≤ x 0 := by
  sorry

                                               
                                                                                                   

             

       
                                                              
                           
                                         
   
  
theorem BoundedMonotoneSequenceEquivalences {x : RealSequence}
    (h : IsMonotoneSeq x) :
    (∃ L, ConvergesTo x L) ↔ BoundedSeq x := by
  sorry

                                                
                                                                                                  
                       

             

       
                                                                   
                                                               
                        
   
  
theorem EventuallyMonotoneConvergenceTheoremIncr {x : RealSequence}
    (h : IsEventuallyIncreasing x) (hbdd : BoundedAboveSeq x) :
    ∃ L, ConvergesTo x L := by
  sorry

                                                
                                                                                                  
                       

             

       
                                                                   
                                                               
                        
   
  
theorem EventuallyMonotoneConvergenceTheoremDecr {x : RealSequence}
    (h : IsEventuallyDecreasing x) (hbdd : BoundedBelowSeq x) :
    ∃ L, ConvergesTo x L := by
  sorry

                                                
                                                                                                 
                 

             

       
                                                               
                                                        
                        
   
  
theorem EventuallyMonotoneConvergenceTheorem {x : RealSequence}
    (h : IsEventuallyMonotone x) (hbdd : BoundedSeq x) :
    ∃ L, ConvergesTo x L := by
  sorry

                                      
                                                          
                                                          

             

       
                                                         
                                                            
                      
   
  
theorem UnboundedMonotoneDivergencePos {x : RealSequence}
    (hinc : IsIncreasing x) (hunbdd : ¬ BoundedAboveSeq x) :
    DivergesToPosInf x := by
  sorry

                                      
                                                          
                                                          

             

       
                                                         
                                                            
                      
   
  
theorem UnboundedMonotoneDivergenceNeg {x : RealSequence}
    (hdec : IsDecreasing x) (hunbdd : ¬ BoundedBelowSeq x) :
    DivergesToNegInf x := by
  sorry

                                                        
                                                                                                   
    

             

       
                                                                 
                                                          
   
  
theorem TranslationPreservesIncreasing {x : RealSequence} {c : ℝ}
    (h : IsIncreasing x) : IsIncreasing (fun n => x n + c) := by
  sorry

                                                        
                                                                                                   
    

             

       
                                                                 
                                                          
   
  
theorem TranslationPreservesDecreasing {x : RealSequence} {c : ℝ}
    (h : IsDecreasing x) : IsDecreasing (fun n => x n + c) := by
  sorry

                                                        
                                                                                                    
                    

             

       
                                                                    
                                                                       
   
  
theorem PositiveScalarPreservesIncreasing {x : RealSequence} {α : ℝ}
    (h : IsIncreasing x) (hα : α > 0) : IsIncreasing (fun n => α * x n) := by
  sorry

                                                        
                                                                                                    
                    

             

       
                                                                   
                                                                       
   
  
theorem NegativeScalarReversesIncreasing {x : RealSequence} {α : ℝ}
    (h : IsIncreasing x) (hα : α < 0) : IsDecreasing (fun n => α * x n) := by
  sorry

                                                        
                                                                                         

             

       
                                                     
                                                       
   
  
theorem NegationReversesIncreasing {x : RealSequence}
    (h : IsIncreasing x) : IsDecreasing (fun n => -x n) := by
  sorry

                                                        
                                                                                         

             

       
                                                     
                                                       
   
  
theorem NegationReversesDecreasing {x : RealSequence}
    (h : IsDecreasing x) : IsIncreasing (fun n => -x n) := by
  sorry

end LRA.Analysis.Sequences
