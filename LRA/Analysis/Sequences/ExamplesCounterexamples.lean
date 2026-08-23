  
                                                             
                                                                                  
                                                      
                                                             
                                                                                                              
                                                                        
                                                                   
                                                                         
                                                                    
                 

                                                                  
                                                                      
                                                                       
                                                                     
                                                                     
                                                                     
                                                                  
                                                                       
                                                                         
                                                                        
                              

                                                                        
                                                                       
                                                                      
                                                                      
                                                                        
                                      
  

import Mathlib.Order.Basic
import Mathlib.Analysis.SpecificLimits.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences

namespace LRA.Analysis.Sequences

                                                       

             

       
                                         
                                  
   
  
theorem ExampleConstantSequence (c : ℝ) :
    ConvergesTo (fun _ : ℕ => c) c := by
  sorry

                                                                                                  
                                                      

             

       
                                   
                                                
                                        
                                                    
   
  
theorem ExampleReciprocalSequence :
    (∀ n : ℕ, (1 : ℝ) / (n + 2) < 1 / (n + 1)) ∧
      (∀ n : ℕ, 0 ≤ 1 / ((n : ℝ) + 1)) ∧
      ConvergesTo (fun n : ℕ => 1 / ((n : ℝ) + 1)) 0 := by
  sorry

                                                                                                  
                              

             

       
                                        
                                                      
                                                         
   
  
theorem ExampleAlternatingNullSequence :
    ¬ Monotone (fun n : ℕ => (-1 : ℝ) ^ n / (n + 1)) ∧
      ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ n / (n + 1)) 0 := by
  sorry

                                                                 
                                           
                                                 
                                                        

             

       
                                    
                                            
                                                 
                                                       
                                                            
   
  
theorem ExampleOscillatingSequence :
    BoundedSeq (fun n : ℕ => (-1 : ℝ) ^ n) ∧
      IsOscillatory (fun n : ℕ => (-1 : ℝ) ^ n) ∧
      ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ (2 * n)) 1 ∧
      ConvergesTo (fun n : ℕ => (-1 : ℝ) ^ (2 * n + 1)) (-1) := by
  sorry

                                                                                  
                                                
                                           
                                                        

             

       
                                  
                                                             
                                                      
                                                 
                                                            
   
  
theorem ExampleGeometricSequence :
    (∀ r : ℝ, |r| < 1 → ConvergesTo (fun n : ℕ => r ^ n) 0) ∧
      ConvergesTo (fun _ : ℕ => (1 : ℝ) ^ (0 : ℕ)) 1 ∧
      IsOscillatory (fun n : ℕ => (-1 : ℝ) ^ n) ∧
      (∀ r : ℝ, |r| > 1 → ¬ BoundedSeq (fun n : ℕ => r ^ n)) := by
  sorry

                                                                 
                                         

             

       
                                     
                                            
                                             
   
  
theorem ExampleBoundedNotConvergent :
    BoundedSeq (fun n : ℕ => (-1 : ℝ) ^ n) ∧
      IsDivergent (fun n : ℕ => (-1 : ℝ) ^ n) := by
  sorry

                                                                             
                                            

             

       
                                              
                                                    
                                                                               
   
  
theorem ExampleVanishingDifferencesNotCauchy :
    ConvergesTo (fun n : ℕ => 1 / ((n : ℝ) + 2)) 0 ∧
      ¬ BoundedSeq (fun n : ℕ => ∑ k ∈ Finset.range (n + 1), 1 / ((k : ℝ) + 1)) := by
  sorry

end LRA.Analysis.Sequences
