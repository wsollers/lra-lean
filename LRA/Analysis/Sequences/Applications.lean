  
                                                             
                                                                                  
                                                      
                                                             
                                                                                      
                                                                   
                                                                   
                                                                    
                                                                  
                                                                       
                                                                        
                                                                   
                                                           
               

                                                                         
                                                                       
                                                                         
                                                                        
                                                               
                                                                 
                                                                       
                                                                        
                                                                        
                                                                     
                                                                    
                             

                                                                     
                                                                        
                                                                       
                                                                   
                                                                       
                                                                
                                                                     
  

import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Algebra.Order.Floor.Ring
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence

namespace LRA.Analysis.Sequences

                                                                     

             

       
                                          
              
                                                              
   
  
noncomputable def NewtonSeqSqrtTwo : ℕ → ℝ
  | 0 => 3 / 2
  | n + 1 => (NewtonSeqSqrtTwo n + 2 / NewtonSeqSqrtTwo n) / 2

                                      
                                                                     

             

       
                                    
                                              
   
  
theorem NewtonApproximationSqrtTwo :
    ConvergesTo NewtonSeqSqrtTwo (Real.sqrt 2) := by
  sorry

                                 

             

       
                                                        
                                                                  
   
  
noncomputable def FactorialPartialSums : RealSequence :=
  fun n => ∑ k ∈ Finset.range (n + 1), (1 : ℝ) / (Nat.factorial k)

                                             
                                                                        

             

       
                                          
                                                 
   
  
theorem FactorialPartialSumsApproximateE :
    ConvergesTo FactorialPartialSums (Real.exp 1) := by
  sorry

                                                                      
                                                                        
                      

             

       
                                                       
                                            
   
  
noncomputable def CompoundInterestSeq : RealSequence :=
  fun n => (1 + 1 / ((n : ℝ) + 1)) ^ (n + 1)

                                          
                                                                       

             

       
                                        
                                                
   
  
theorem CompoundInterestApproximationE :
    ConvergesTo CompoundInterestSeq (Real.exp 1) := by
  sorry

                                      

             

       
                                                                
                                      
   
  
noncomputable def DecimalTruncationSeq (α : ℝ) : RealSequence :=
  fun n => (⌊10 ^ n * α⌋ : ℝ) / 10 ^ n

                                     
                                                               

             

       
                                            
                                          
   
  
theorem DecimalTruncationsConverge (α : ℝ) :
    ConvergesTo (DecimalTruncationSeq α) α := by
  sorry

end LRA.Analysis.Sequences
