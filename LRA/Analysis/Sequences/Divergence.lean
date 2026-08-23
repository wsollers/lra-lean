  
                                                             
                                                                                  
                                                      
                                                             
                                                                                  
                                                                  
                                

                                                                  
                                                                  
                                                                     
                                                                      
                                                                    
                                                              
                                                                      
                                                      

                                                
                                                                        
                  
  

import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Subsequences

namespace LRA.Analysis.Sequences

                                                       
                                                                                  
                                    

             

       
                                                                    
                                                                 
   
  
theorem DivergenceToInfinityImpliesRealDivergence {x : RealSequence}
    (h : DivergesToPosInf x ∨ DivergesToNegInf x) : IsDivergent x := by
  sorry

                                                  
                                                                                  
                      

             

       
                                                                
                                                           
                                                   
   
  
theorem TwoSubsequentialLimitsForceDivergence {x : RealSequence}
    {L K : ℝ} (hLK : L ≠ K) (hL : IsSubsequentialLimit x L)
    (hK : IsSubsequentialLimit x K) : IsDivergent x := by
  sorry

                                                          
                                                                                  
                                  

             

       
                                                                       
                               
                                                 
                                         
   
  
theorem UnboundedAboveHasPositiveInfinitySubsequence {x : RealSequence}
    (h : ¬ BoundedAboveSeq x) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧
      DivergesToPosInf (fun k => x (σ k)) := by
  sorry

                                                          
                                                                                  
                                  

             

       
                                                                       
                               
                                                 
                                         
   
  
theorem UnboundedBelowHasNegativeInfinitySubsequence {x : RealSequence}
    (h : ¬ BoundedBelowSeq x) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧
      DivergesToNegInf (fun k => x (σ k)) := by
  sorry

                                                             
                                                                           
                     

             

       
                                                                          
                                                  
                                                                          
   
  
theorem BoundedDivergenceProducesTwoSubsequentialLimits {x : RealSequence}
    (hbdd : BoundedSeq x) (hdiv : IsDivergent x) :
    ∃ L K : ℝ, L ≠ K ∧ IsSubsequentialLimit x L ∧ IsSubsequentialLimit x K := by
  sorry

end LRA.Analysis.Sequences
