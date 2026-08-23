  
                                                             
                                                                                  
                                                      
                                                             
                                                                        
                                                                       
                      

                                                                 
                                                                          
                                                                
                                                                      
                                                                  
                                                                 
                                 

                                                              
                                                                       
                                                                 
                                                                         
                                                                    
                                                       
                                                                          
                                                                           
                                                                    
                                                                         
                                                                       
                                                                      
                                                                          
                                                                  
                                                                       
                                                                     
                                                                       
                                                                
                                                                        
                                                                        
                                            

                                                                   
                                                                         
                                                                         
            

                                                                       
                                                                        
                                                                         
                                                                    
                                                                  
        

                                                           
  

import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences

namespace LRA.Analysis.Sequences

                 

             

       
                                                                         
   
  
def MTail (x : RealSequence) (M : ℕ) : RealSequence := fun n => x (M + n)

                            
                                                                                                  
                                                             

             

       
                                                      
                                                                 
                                                        
   
  
theorem ConvergenceOfTail (x : RealSequence) (m : ℕ) :
    ((∃ L, ConvergesTo x L) ↔ (∃ L, ConvergesTo (MTail x m) L)) ∧
      (∀ L, ConvergesTo x L → ConvergesTo (MTail x m) L) := by
  sorry

                                  
                                                                                                   
                                                                                               
   

             

       
                                                          
                                                                          
                                                          
                   
   
  
theorem ConvergenceByDomination {x : RealSequence} {L : ℝ}
    {a : RealSequence} (ha_pos : ∀ n, 0 < a n) (ha_null : ConvergesTo a 0)
    (h : ∃ c > 0, ∃ m : ℕ, ∀ n ≥ m, |x n - L| ≤ c * a n) :
    ConvergesTo x L := by
  sorry

                                               
                                                                                                   
                                                              

             

       
                                                           
                                   
                                                                      
                   
   
  
theorem RatioLimitLessThanOneImpliesNull {x : RealSequence}
    (hx_pos : ∀ n, 0 < x n) {L : ℝ}
    (hratio : ConvergesTo (fun n => x (n + 1) / x n) L) (hL : L < 1) :
    ConvergesTo x 0 := by
  sorry

end LRA.Analysis.Sequences
