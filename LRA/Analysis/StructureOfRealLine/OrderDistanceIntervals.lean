  
                                                             
                                                                            
                                                                                

                                                                           
                                                  
  

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.StructureOfRealLine

                                

             

       
                                  
   
  
def dist' (x y : ℝ) : ℝ := |x - y|

                             

             

       
                                                       
   
  
def IntervalLength (a b : ℝ) (hab : a ≤ b) : ℝ := b - a

                             
                                                                                                   
                                                                              

             

       
                           
                                                                     
                                        
                                                    
   
  
theorem DistanceIsAMetric :
    (∀ x y : ℝ, dist' x y ≥ 0) ∧ (∀ x y : ℝ, dist' x y = 0 ↔ x = y) ∧
    (∀ x y : ℝ, dist' x y = dist' y x) ∧
    (∀ x y z : ℝ, dist' x z ≤ dist' x y + dist' y z) := by
  sorry

                                         
                                                                                  

             

       
                                      
                                                           
   
  
theorem RealLineStructuralOrderFacts :
    (∀ A : Set ℝ, A.Nonempty → BddAbove A → ∃ s, IsLUB A s) := by
  sorry

                                                
                                                                        

             

       
                                                                     
               
   
  
theorem MinOfPositiveIsPositive (a b : ℝ) (ha : a > 0) (hb : b > 0) :
    min a b > 0 := by
  sorry

                                 
                                                   

             

       
                                                              
   
  
theorem HalfEpsilonIsPositive (ε : ℝ) (hε : ε > 0) : ε / 2 > 0 := by
  sorry

                          
                                                           

             

       
                                                                 
   
  
theorem EpsilonSplitting (ε : ℝ) (hε : ε > 0) : ε / 2 + ε / 2 = ε := by
  sorry

                               
                                                                                         

             

       
                                                                                 
               
   
  
theorem PositiveMinimumBound (δ a b : ℝ) (h1 : 0 < δ) (h2 : δ ≤ a) (h3 : δ ≤ b) :
    δ ≤ min a b := by
  sorry

                                           
                                                                                       

             

       
                                                                     
                              
   
  
theorem ChoosingSmallerPositive (ε c : ℝ) (hε : ε > 0) (hc : c > 0) :
    ∃ δ, 0 < δ ∧ δ < ε ∧ δ < c := by
  sorry

                                        

             

       
                                                     
   
  
theorem AbsIsDistanceToZero (x : ℝ) : |x| = dist' x 0 := by
  sorry

                                                                        
                        
                                                                        

                              

             

       
                                                                   
   
  
def IsBoundedSubset (A : Set ℝ) : Prop := ∃ M > 0, ∀ x ∈ A, |x| ≤ M

                               

             

       
                                         
                                     
   
  
theorem IntervalSetOpsAreOrdinarySetOps :
    forall A B : Set ℝ, A ∪ B = B ∪ A := by
  sorry

end LRA.Analysis.StructureOfRealLine
