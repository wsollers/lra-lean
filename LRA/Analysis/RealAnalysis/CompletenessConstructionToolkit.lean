  
                                                             
                                                                          
                                        

                                                                       
                                                       
                                                                  
                                                                   
                                                                       
                                                                      
                                                                     
                                                                         
                               
                                                                    
                                                                        
  

import Mathlib.Data.Real.Basic
import Mathlib.Order.Bounds.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.Basic

namespace LRA.Analysis.RealAnalysis

                                                                                                  
                                   

             

       
                                                         
                                          
                               
   
  
theorem EpsCharSup (S : Set ℝ) (s : ℝ) (hne : S.Nonempty)
    (hbdd : BddAbove S) (hs : IsLUB S s) :
    ∀ ε > 0, ∃ x ∈ S, x > s - ε := by
  sorry

                            
                                                                                                  
                                                                                           

             

       
                                                                 
                                          
                                                
                                            
   
  
theorem InductiveSelection (S : Set ℝ) (s : ℝ) (hne : S.Nonempty)
    (hbdd : BddAbove S) (hs : IsLUB S s) :
    ∃ x : ℕ → ℝ, (∀ n, x n ∈ S) ∧ StrictMono x ∧
      Filter.Tendsto x Filter.atTop (nhds s) := by
  sorry

                                                                                                 
                                                                                               
                                                                                            
      

             

       
                                                           
                                                         
                                               
                                                      
                                               
                                                    
   
  
theorem MonotoneApproxBounds (S : Set ℝ) (hne : S.Nonempty)
    (hbdd_above : BddAbove S) (hbdd_below : BddBelow S) :
    (∃ x : ℕ → ℝ, (∀ n, x n ∈ S) ∧ Monotone x ∧
      Filter.Tendsto x Filter.atTop (nhds (sSup S))) ∧
    (∃ y : ℕ → ℝ, (∀ n, y n ∈ S) ∧ Antitone y ∧
      Filter.Tendsto y Filter.atTop (nhds (sInf S))) := by
  sorry

end LRA.Analysis.RealAnalysis
