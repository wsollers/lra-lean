  
                                                             
                                                                                  
                                                             
                                                                   
                                                                 
                                                     
                                                               
                                                                                             
                                                                  
                          

                                                                  
                                                                       
                                                                         
                                                                         
                                                                       
                                                                          
                                                                         
                      

                                                                            
                                                                           
                                                                        
                                                                     
                                                                       
                                                                      
                                                                       
                                                                           
                                                                       
                                                                             
                                                                          
                                                                             
                                                            
  

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Sequences

                                                                        
                                                                      
                                                   

             

       
                                             
   
  
abbrev Sequence (X : Type*) : Type _ := ℕ → X

                        

             

       
                                   
   
  
abbrev RealSequence : Type := ℕ → ℝ

                              

             

       
                                                    
                                              
   
  
def ConvergesTo (x : RealSequence) (L : ℝ) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |x n - L| < ε

                             

             

       
                                                                       
   
  
def IsDivergent (x : RealSequence) : Prop := ¬ ∃ L : ℝ, ConvergesTo x L

                                        

             

       
                                                 
                                    
   
  
def DivergesToPosInf (x : RealSequence) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, M < x n

                                        

             

       
                                                 
                                    
   
  
def DivergesToNegInf (x : RealSequence) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, x n < M

                               

             

       
                                              
                                                             
   
  
def IsOscillatory (x : RealSequence) : Prop :=
  IsDivergent x ∧ ¬ DivergesToPosInf x ∧ ¬ DivergesToNegInf x

                                                                            

             

       
                                           
                                  
   
  
theorem ConstantSequenceConverges (c : ℝ) :
    ConvergesTo (fun _ : ℕ => c) c := by
  sorry

                                                         

             

       
                                           
                                            
   
  
theorem ReciprocalSequenceConvergesToZero :
    ConvergesTo (fun n : ℕ => 1 / (n : ℝ)) 0 := by
  sorry

                                                                             
                  

             

       
                                       
                                           
   
  
theorem NaturalNumberSequenceDiverges :
    DivergesToPosInf (fun n : ℕ => (n : ℝ)) := by
  sorry

end LRA.Analysis.Sequences
