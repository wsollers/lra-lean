  
                                                             
                                                                                  
                                                      
                                                             
                                                                                    
                                                                  
                                                                           
                                                                           
                       

                                           
                                                                   
                                                       

                                                              
                                                                       
                                                                  
                                                                       
                                                                 
                                                                       
                                                                      
                                                                    
                                                                          
          
  

import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions

namespace LRA.Analysis.Sequences

                                           

             

       
                                                        
                                                      
   
  
def ConvergesToNbhd (x : RealSequence) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, L - ε < x n ∧ x n < L + ε

                                                
                                                                
                                                                     

             

       
                                                                         
                                                                  
                                                                                
                                             
   
  
theorem EquivalenceOfConvergenceFormulations (x : RealSequence) (L : ℝ) :
    (ConvergesTo x L ↔ ∀ ε > 0, ∃ K : ℕ, ∀ n ≥ K, |x n - L| < ε) ∧
      (ConvergesTo x L ↔ ∀ ε > 0, ∃ K : ℕ, ∀ n ≥ K, L - ε < x n ∧ x n < L + ε) ∧
      (ConvergesTo x L ↔ ConvergesToNbhd x L) := by
  sorry

end LRA.Analysis.Sequences
