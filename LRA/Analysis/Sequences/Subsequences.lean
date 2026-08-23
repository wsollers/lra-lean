  
                                                             
                                                                                  
                                                      
                                                             
                                                                                      
                                                                    
                                                                
                                                                     
                                                                        
                                                                  
                                                                    
                                                                        
                                     

                                                               
                                                                     
                                                                         
                                                                        
                                                                        
                                                                     
                                                                   
                                                                        
                                                                 
                                                                   
                                                                       
                                                               
                                                                    
                                                                         
              

                                                                     
                                                                       
                                                                          
                                                                     
                                                                   
                                                                      
                                                                       
                                                                      
                                                                       
                                                                  

                                                                
                                                                       
                                                                    
                                                                     
                                                               
                                                                      
                                                                         
                                                                
                                                                   
                                                                  
                        

                                                                        
                                                                      
                                                                    
                                                                         
                                                                    
                                                                   
                                                                       
                                                                    
                                                                        
  

import Mathlib.Order.Basic
import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Monotonicity

namespace LRA.Analysis.Sequences

                                        

             

       
                                                      
                              
   
  
def IsStrictlyIncreasingIndexMap (σ : ℕ → ℕ) : Prop :=
  ∀ k l : ℕ, k < l → σ k < σ l

                                  

             

       
                                                  
                                                                  
   
  
def IsSubsequenceOf (y x : RealSequence) : Prop :=
  ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧ ∀ k, y k = x (σ k)

                              

             

       
                                                             
                                                                                
   
  
def IsSubsequentialLimit (x : RealSequence) (L : ℝ) : Prop :=
  ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧ ConvergesTo (fun k => x (σ k)) L

                                     

             

       
                                                         
                                   
   
  
def HasConvergentSubsequence (x : RealSequence) : Prop :=
  ∃ L : ℝ, IsSubsequentialLimit x L

                                              
                                                                                 

             

       
                                                      
                                                       
   
  
theorem SubsequenceIndicesDominateIdentity {σ : ℕ → ℕ}
    (h : IsStrictlyIncreasingIndexMap σ) : ∀ k, k ≤ σ k := by
  sorry

                                     
                                                                                         
                                                                         

             

       
                                                                         
                                                                  
                                    
   
  
theorem SubsequencesPreserveLimits {x : RealSequence} {L : ℝ} {σ : ℕ → ℕ}
    (hx : ConvergesTo x L) (hσ : IsStrictlyIncreasingIndexMap σ) :
    ConvergesTo (fun k => x (σ k)) L := by
  sorry

                                                   
                                                                                                    
                 

             

       
                                                                 
                                                                      
         
   
  
theorem SubsequentialLimitOfConvergentSequence {x : RealSequence}
    {L K : ℝ} (hL : ConvergesTo x L) (hK : IsSubsequentialLimit x K) :
    K = L := by
  sorry

                                               
                                                                             
                                                                         

             

       
                                                             
                                                                             
                                 
   
  
theorem DivergenceByTwoSubsequentialLimits {x : RealSequence}
    {L K : ℝ} (hL : IsSubsequentialLimit x L) (hK : IsSubsequentialLimit x K)
    (hLK : L ≠ K) : IsDivergent x := by
  sorry

                                           
                                                                          
                                                                      

             

       
                                                                      
                                                               
                                 
   
  
theorem BoundednessPassesToSubsequences {x : RealSequence} {σ : ℕ → ℕ}
    (hx : BoundedSeq x) (hσ : IsStrictlyIncreasingIndexMap σ) :
    BoundedSeq (fun k => x (σ k)) := by
  sorry

                                            
                                                                            
                                                                        

             

       
                                                               
                                                                             
                                   
   
  
theorem MonotonicityPassesToSubsequencesIncr {x : RealSequence}
    {σ : ℕ → ℕ} (hx : IsIncreasing x) (hσ : IsStrictlyIncreasingIndexMap σ) :
    IsIncreasing (fun k => x (σ k)) := by
  sorry

                                            
                                                                            
                                                                        

             

       
                                                               
                                                                             
                                   
   
  
theorem MonotonicityPassesToSubsequencesDecr {x : RealSequence}
    {σ : ℕ → ℕ} (hx : IsDecreasing x) (hσ : IsStrictlyIncreasingIndexMap σ) :
    IsDecreasing (fun k => x (σ k)) := by
  sorry

                                   
                                                                                              
                                                                                 

             

       
                                                                 
                                                                                 
                                            
   
  
theorem SubsequenceOfSubsequence {x : RealSequence} {σ τ : ℕ → ℕ}
    (hσ : IsStrictlyIncreasingIndexMap σ) (hτ : IsStrictlyIncreasingIndexMap τ) :
    IsSubsequenceOf (fun k => x (σ (τ k))) x := by
  sorry

                                                 
                                                                          
                                                                  

             

       
                                                                       
                                                                       
                             
   
  
theorem EventualPropertiesPassToSubsequences {P : ℕ → Prop} {σ : ℕ → ℕ}
    (h : ∃ N : ℕ, ∀ n ≥ N, P n) (hσ : IsStrictlyIncreasingIndexMap σ) :
    ∃ K : ℕ, ∀ k ≥ K, P (σ k) := by
  sorry

                                               
                                                                         
                                               

             

       
                                                          
                                 
                                                              
   
  
theorem FrequentPropertiesYieldSubsequences {P : ℕ → Prop}
    (h : ∀ N : ℕ, ∃ n ≥ N, P n) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧ ∀ k, P (σ k) := by
  sorry

                                            
                                                                                                    
                                 

             

       
                                                                       
                                                                  
                 
   
  
theorem SubsequentialLimitsRespectBounds {x : RealSequence} {L m M : ℝ}
    (hL : IsSubsequentialLimit x L) (h : ∀ n, m ≤ x n ∧ x n ≤ M) :
    m ≤ L ∧ L ≤ M := by
  sorry

                                       
                                                                                                  
                                                                                              
       

             

       
                                                                      
                                                 
                                           
                                                           
   
  
theorem SqueezePassesToSubsequences {a x b : RealSequence} {σ : ℕ → ℕ}
    (h : ∃ N : ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n)
    (hσ : IsStrictlyIncreasingIndexMap σ) :
    ∃ K : ℕ, ∀ k ≥ K, a (σ k) ≤ x (σ k) ∧ x (σ k) ≤ b (σ k) := by
  sorry

                                     
                                                                                                    
                                                

             

       
                                                       
                                                 
                                                                         
   
  
theorem MonotoneSubsequenceTheorem (x : RealSequence) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧
      (IsIncreasing (fun k => x (σ k)) ∨ IsDecreasing (fun k => x (σ k))) := by
  sorry

                                      
                                                                                     

             

       
                                                                           
                              
   
  
theorem BolzanoWeierstrassSequences {x : RealSequence} (h : BoundedSeq x) :
    HasConvergentSubsequence x := by
  sorry

                                                       
                                                                                                  
                                                                                                
         

             

       
                                                                               
                                                 
                                                          
                                                      
   
  
theorem SequentialCompactnessClosedBoundedInterval {a b : ℝ} {x : RealSequence}
    (hab : a ≤ b) (hx : ∀ n, a ≤ x n ∧ x n ≤ b) :
    ∃ σ : ℕ → ℕ, ∃ L : ℝ, IsStrictlyIncreasingIndexMap σ ∧
      ConvergesTo (fun k => x (σ k)) L ∧ a ≤ L ∧ L ≤ b := by
  sorry

                                                                            
                                                                                               
                     

             

       
                                                         
                     
                                                   
                                                     
                                              
   
  
theorem SubsequencePrinciple {x : RealSequence} {L : ℝ} :
    ConvergesTo x L ↔
      ∀ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ →
        ∃ τ : ℕ → ℕ, IsStrictlyIncreasingIndexMap τ ∧
          ConvergesTo (fun k => x (σ (τ k))) L := by
  sorry

                                                                                         
                                                                    

             

       
                                                           
                                                      
                     
                                                                        
   
  
theorem BoundedSequenceConvergesIffUniqueSubsequentialLimit
    {x : RealSequence} {L : ℝ} (hbdd : BoundedSeq x) :
    ConvergesTo x L ↔
      (IsSubsequentialLimit x L ∧ ∀ K, IsSubsequentialLimit x K → K = L) := by
  sorry

end LRA.Analysis.Sequences
