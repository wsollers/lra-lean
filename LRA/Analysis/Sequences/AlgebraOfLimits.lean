  
                                                             
                                                                                  
                                                      
                                                             
                                                                                
                                                                     
                                                                          
                                  

                                                                      
                                                                   
                                                                       
                                                                   
                                                                      
                                                                    
                                                                    
                                                                      
                                                                      
                                                                   
                                                                       
                                                                    

                                       
                                                                     
                                                                     
                                                                        
                                                                     
                                                                      
                                                                   
                                                                        
                                                                   
                                                                   
                                                 
                                                                         
                                                                 
                                                                        
                                                                   
                                                                   
                                                                        
          

                                                                   
                                                                  
                                                           
                                                               
                                                           
                                                                          
  

import Mathlib.Order.Basic
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Algebra.Polynomial.Eval.Defs
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Limits

namespace LRA.Analysis.Sequences

                                 

             

       
                                                                          
   
  
def PointwiseSum (x y : RealSequence) : RealSequence := fun n => x n + y n

                                        

             

       
                                                                                 
   
  
def PointwiseDifference (x y : RealSequence) : RealSequence := fun n => x n - y n

                                   

             

       
                                                                                
   
  
def ScalarMultiple (α : ℝ) (x : RealSequence) : RealSequence := fun n => α * x n

                                               

             

       
                                                                      
                            
   
  
def LinearCombination (α β : ℝ) (x y : RealSequence) : RealSequence :=
  fun n => α * x n + β * y n

                                      

             

       
                                                                        
   
  
def PointwiseNegation (x : RealSequence) : RealSequence := fun n => -x n

                                     

             

       
                                                                              
   
  
def PointwiseProduct (x y : RealSequence) : RealSequence := fun n => x n * y n

                                                                
                                                                       
                                                                    
                                                           

             

       
                                                                                     
   
  
noncomputable def ReciprocalSeq (x : RealSequence) : RealSequence := fun n => 1 / x n

                                      

             

       
                                                                                             
   
  
noncomputable def PointwiseQuotient (x y : RealSequence) : RealSequence := fun n => x n / y n

                          

             

       
                                                                     
   
  
def SquareSeq (x : RealSequence) : RealSequence := fun n => (x n) ^ 2

                                  

             

       
                                                              
   
  
def AbsSeq (x : RealSequence) : RealSequence := fun n => |x n|

                               

             

       
                                                                                       
   
  
noncomputable def SqrtSeq (x : RealSequence) : RealSequence := fun n => Real.sqrt (x n)

                                 
                                                                                     
                              

             

       
                                                          
                                                                    
   
  
theorem LimitOfScalarMultiple {x : RealSequence} {L α : ℝ}
    (h : ConvergesTo x L) : ConvergesTo (ScalarMultiple α x) (α * L) := by
  sorry

                       
                                                                                                 
                                              

             

       
                                                  
                                                   
                                          
   
  
theorem LimitOfASum {x y : RealSequence} {L M : ℝ}
    (hx : ConvergesTo x L) (hy : ConvergesTo y M) :
    ConvergesTo (PointwiseSum x y) (L + M) := by
  sorry

                            
                                                                                   
                            

             

       
                                                   
                                                                  
   
  
theorem LimitOfANegation {x : RealSequence} {L : ℝ}
    (h : ConvergesTo x L) : ConvergesTo (PointwiseNegation x) (-L) := by
  sorry

                              
                                                                                                 
                                                     

             

       
                                                         
                                                   
                                                 
   
  
theorem LimitOfADifference {x y : RealSequence} {L M : ℝ}
    (hx : ConvergesTo x L) (hy : ConvergesTo y M) :
    ConvergesTo (PointwiseDifference x y) (L - M) := by
  sorry

                           
                                                                                                 
                                                  

             

       
                                                      
                                                   
                                              
   
  
theorem LimitOfAProduct {x y : RealSequence} {L M : ℝ}
    (hx : ConvergesTo x L) (hy : ConvergesTo y M) :
    ConvergesTo (PointwiseProduct x y) (L * M) := by
  sorry

                                         
                                                                                                   
                

             

       
                                                                
                                                                  
   
  
theorem NonzeroLimitEventuallyNonzero {x : RealSequence} {L : ℝ}
    (hL : L ≠ 0) (h : ConvergesTo x L) : ∃ N : ℕ, ∀ n ≥ N, x n ≠ 0 := by
  sorry

                              
                                                                                                    
                                                 

             

       
                                                                 
                                                
                                         
   
  
theorem LimitOfAReciprocal {x : RealSequence} (hx : ∀ n, x n ≠ 0)
    {L : ℝ} (hL : L ≠ 0) (h : ConvergesTo x L) :
    ConvergesTo (ReciprocalSeq x) (1 / L) := by
  sorry

                            
                                                                                                   
                                                                                      

             

       
                                                                 
                                                                           
                                               
   
  
theorem LimitOfAQuotient {x y : RealSequence} (hy : ∀ n, y n ≠ 0)
    {L M : ℝ} (hM : M ≠ 0) (hx : ConvergesTo x L) (hy' : ConvergesTo y M) :
    ConvergesTo (PointwiseQuotient x y) (L / M) := by
  sorry

                          
                                                                                                    
      

             

       
                                                 
                                                             
   
  
theorem LimitOfASquare {x : RealSequence} {L : ℝ}
    (h : ConvergesTo x L) : ConvergesTo (SquareSeq x) (L ^ 2) := by
  sorry

                                   
                                                                                                    

             

       
                                                         
                                                      
   
  
theorem LimitOfAnAbsoluteValue {x : RealSequence} {L : ℝ}
    (h : ConvergesTo x L) : ConvergesTo (AbsSeq x) |L| := by
  sorry

                                           
                                                                                                   
                

             

       
                                                                  
                                                                  
   
  
theorem PositiveLimitEventuallyPositive {x : RealSequence} {L : ℝ}
    (hL : L > 0) (h : ConvergesTo x L) : ∃ N : ℕ, ∀ n ≥ N, 0 < x n := by
  sorry

                               
                                                                                                   
                                           

             

       
                                                                 
                                   
                                                 
   
  
theorem LimitOfASquareRoot {x : RealSequence} (hx : ∀ n, 0 ≤ x n)
    {L : ℝ} (h : ConvergesTo x L) :
    0 ≤ L ∧ ConvergesTo (SqrtSeq x) (Real.sqrt L) := by
  sorry

                                  
                                                                                           
                                                 

             

       
                                                          
                                              
                                                  
   
  
theorem PolynomialSequenceLimit {x : RealSequence} {L : ℝ}
    (p : Polynomial ℝ) (h : ConvergesTo x L) :
    ConvergesTo (fun n => p.eval (x n)) (p.eval L) := by
  sorry

                                
                                                                                                   
                                                                                               
                              

             

       
                                                        
                                                                           
                           
                                                                            
   
  
theorem RationalSequenceLimit {x : RealSequence} {L : ℝ}
    (p q : Polynomial ℝ) (hqL : q.eval L ≠ 0) (hqx : ∀ n, q.eval (x n) ≠ 0)
    (h : ConvergesTo x L) :
    ConvergesTo (fun n => p.eval (x n) / q.eval (x n)) (p.eval L / q.eval L) := by
  sorry

end LRA.Analysis.Sequences
