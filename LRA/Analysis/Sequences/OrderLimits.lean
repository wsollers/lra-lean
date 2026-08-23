  
                                                             
                                                                                  
                                                      
                                                             
                                                                                      
                                                                    
                                                                   

                                                                        
                                                                        
                                                                           
                                                                      
                                                                   
                                                                  
                                                                        
                                                                 
                                                                       
                                                                         
                                                               
                                                                    
                                                                     
                                                                       
                                                                    
                                                                      
                

                         
  

import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Monotonicity
import LRA.Analysis.Sequences.LiminfLimsup
import LRA.Analysis.Bounds.Extrema.SupremaInfima

namespace LRA.Analysis.Sequences

open LRA.Analysis.Bounds (IsSupremum IsInfimum)

                                              
                                                                                                   
                                                          

             

       
                                                                    
                                                      
                                                       
   
  
theorem IncreasingSequenceLimitAsSupremum {x : RealSequence} {S : ℝ}
    (hinc : IsIncreasing x) (hbdd : BoundedAboveSeq x)
    (hS : IsSupremum S (Set.range x)) : ConvergesTo x S := by
  sorry

                                             
                                                                                                   
                                                         

             

       
                                                                   
                                                      
                                                      
   
  
theorem DecreasingSequenceLimitAsInfimum {x : RealSequence} {I : ℝ}
    (hdec : IsDecreasing x) (hbdd : BoundedBelowSeq x)
    (hI : IsInfimum I (Set.range x)) : ConvergesTo x I := by
  sorry

                                     
                                                                                               
                                                               

             

       
                                                                         
                                                                              
                                                                              
   
  
theorem TailSupremaInfimaConverge {x : RealSequence} (h : BoundedSeq x) :
    (∃ hSup : BoundedAboveSeq x, ∃ S : ℝ, ConvergesTo (TailSupSeq x hSup) S) ∧
      (∃ hInf : BoundedBelowSeq x, ∃ I : ℝ, ConvergesTo (TailInfSeq x hInf) I) := by
  sorry

                                       
                                                                                             
                

             

       
                                                                           
                                                       
   
  
theorem BoundedSequenceLimsupLiminf {x : RealSequence} (h : BoundedSeq x) :
    (∃ S : ℝ, LimsupSeq x S) ∧ (∃ I : ℝ, LiminfSeq x I) := by
  sorry

end LRA.Analysis.Sequences
