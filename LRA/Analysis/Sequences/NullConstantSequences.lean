  
                                                             
                                                                                  
                                                      
                                                             
                                                                                               
                                                                         
                                                                     

                                                                      
                                                                  
                                                                     
                                                                
                              

                                       
                                                                         
                                                                        
                                                                         
                                                                        
                                                                   
                                                                 
                                                                        
                                                           
                                                                       
                          
                                               
                                                                         
                                                                      
                                                                
                                                  
                                                                         
                                                                        
                              
                                                                   
                                                                     
                                                                       
                                                                        
                                                                     

                                                                     
                                                             
                                                                       
                                                                      
  

import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions

namespace LRA.Analysis.Sequences

                            

             

       
                                                                
   
  
def IsConstant (x : RealSequence) (c : ℝ) : Prop := ∀ n, x n = c

                        

             

       
                                       
                                      
   
  
def IsNull (x : RealSequence) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |x n| < ε

                                       

             

       
                                                             
                           
   
  
def IsUltimatelyConstant (x : RealSequence) (c : ℝ) : Prop :=
  ∃ N : ℕ, ∀ n ≥ N, x n = c

                                 

             

       
                                                                      
   
  
def BoundedAboveSeq (x : RealSequence) : Prop := ∃ M : ℝ, ∀ n, x n ≤ M

                                 

             

       
                                                                      
   
  
def BoundedBelowSeq (x : RealSequence) : Prop := ∃ m : ℝ, ∀ n, m ≤ x n

                           

             

       
                                                                   
   
  
def BoundedSeq (x : RealSequence) : Prop := ∃ M > 0, ∀ n, |x n| ≤ M

                                      
                                                                     
                  

             

       
                                                              
                                          
   
  
theorem ConstantSequenceConvergence {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : ConvergesTo x c := by
  sorry

                              
                                                                     

             

       
                                                                    
            
   
  
theorem ZeroSequenceIsNull {x : RealSequence} (h : IsConstant x 0) :
    IsNull x := by
  sorry

                               
                                                                                         

             

       
                                                       
                                           
   
  
theorem ConstantNullSequence {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : IsNull x ↔ c = 0 := by
  sorry

                                      
                                                                             
             

             

       
                                                              
                                               
   
  
theorem DifferenceFromLimitIsNull (x : RealSequence) (L : ℝ) :
    ConvergesTo x L ↔ IsNull (fun n => x n - L) := by
  sorry

                                                 
                                                                          
                       

             

       
                                                                        
                                    
                   
   
  
theorem UltimatelyConstantSequenceConvergence {x : RealSequence} {c : ℝ}
    (h : IsUltimatelyConstant x c) :
    ConvergesTo x c := by
  sorry

                                             
                                                                                                 

             

       
                                                                    
                                                   
   
  
theorem ConstantImpliesUltimatelyConstant {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : IsUltimatelyConstant x c := by
  sorry

                                         
                                                                               

             

       
                                                       
                                             
   
  
theorem UltimatelyZeroSequenceIsNull {x : RealSequence}
    (h : IsUltimatelyConstant x 0) : IsNull x := by
  sorry

                                          
                                                                                                   

             

       
                                                                 
                                                     
   
  
theorem UltimatelyConstantNullSequence {x : RealSequence} {c : ℝ}
    (h : IsUltimatelyConstant x c) : IsNull x ↔ c = 0 := by
  sorry

                                            
                                                                                 
                                         

             

       
                                                             
                                                 
                                     
   
  
theorem TailEqualityPreservesConvergence {x y : RealSequence}
    (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, x n = y n) (L : ℝ) :
    ConvergesTo x L ↔ ConvergesTo y L := by
  sorry

                                                  
                                                                                            

             

       
                                                                  
                                                            
   
  
theorem EventuallyBoundedAboveTailFormulation (x : RealSequence) :
    BoundedAboveSeq x ↔ ∃ N₀ : ℕ, ∃ M : ℝ, ∀ n ≥ N₀, x n ≤ M := by
  sorry

                                                  
                                                                                            

             

       
                                                                  
                                                            
   
  
theorem EventuallyBoundedBelowTailFormulation (x : RealSequence) :
    BoundedBelowSeq x ↔ ∃ N₀ : ℕ, ∃ m : ℝ, ∀ n ≥ N₀, m ≤ x n := by
  sorry

                                            
                                                                                         

             

       
                                                             
                                                         
   
  
theorem EventuallyBoundedTailFormulation (x : RealSequence) :
    BoundedSeq x ↔ ∃ N₀ : ℕ, ∃ M > 0, ∀ n ≥ N₀, |x n| ≤ M := by
  sorry

                                             
                                                                                          

             

       
                                                             
                                                          
   
  
theorem BoundedSequenceBoundedAboveBelow (x : RealSequence) :
    BoundedSeq x ↔ (BoundedAboveSeq x ∧ BoundedBelowSeq x) := by
  sorry

                                          
                                                                                                   
             

             

       
                                                                
                                                               
   
  
theorem AbsoluteBoundUpperLowerBounds {x : RealSequence} {K : ℝ}
    (hK : K > 0) (h : ∀ n, |x n| ≤ K) : ∀ n, -K ≤ x n ∧ x n ≤ K := by
  sorry

                                          
                                                                                                    
     

             

       
                                                                  
                                                          
   
  
theorem UpperLowerBoundsAbsoluteBound {x : RealSequence} {m M : ℝ}
    (h : ∀ n, m ≤ x n ∧ x n ≤ M) : ∃ K > 0, ∀ n, |x n| ≤ K := by
  sorry

end LRA.Analysis.Sequences
