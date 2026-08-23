  
                                                             
                                                                                  
                                                      
                                                             
                                                                                          
                                                                      
                                

                                                                    
                                                                   
                                                                       
                                                                 
                                                                    
                                                                  
                                                                     
            

                                                                     
                                                                      
                                                                  
                                                 
                                                                     
                                                                      
                                                                    
                                                                     
                                                          
                                                                 
                                                                    
                                                                       
                                                                        
                                                                   
                                                                        
                                                       
                                                                    
                                                                   

                                                                   
                                                                     
                                                                    
                                                     
  

import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Subsequences
import LRA.Analysis.Sequences.LiminfLimsup

namespace LRA.Analysis.Sequences

                                                               
                                                                      
                                                           

             

       
                                                         
                                          
   
  
def IsClusterValueOf (x : RealSequence) (L : ℝ) : Prop :=
  ∀ ε > 0, ∀ N : ℕ, ∃ n ≥ N, |x n - L| < ε

                                                
                                                                                               

             

       
                                                                        
                                                   
   
  
theorem ClusterValuesAreSubsequentialLimits {x : RealSequence} {L : ℝ} :
    IsClusterValueOf x L ↔ IsSubsequentialLimit x L := by
  sorry

                                              
                                                                                        

             

       
                                                            
                                                      
   
  
theorem BoundedSequencesHaveClusterValues {x : RealSequence}
    (h : BoundedSeq x) : ∃ L : ℝ, IsClusterValueOf x L := by
  sorry

                                              
                                                                                                   
                                                                                  
                                                            

             

       
                                                            
                                                                               
                                                                
                                                              
   
  
theorem LimsupLiminfExtremalClusterValues {x : RealSequence}
    (hbdd : BoundedSeq x) {S I : ℝ} (hS : LimsupSeq x S) (hI : LiminfSeq x I) :
    (IsClusterValueOf x S ∧ ∀ L, IsClusterValueOf x L → L ≤ S) ∧
    (IsClusterValueOf x I ∧ ∀ L, IsClusterValueOf x L → I ≤ L) := by
  sorry

end LRA.Analysis.Sequences
