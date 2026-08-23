import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt
import LRA.Analysis.Limits.Definition
import LRA.Analysis.Limits.LimitsAtInfinity.Definition

   
                                                                    
                                                                        
                                                   
  

namespace LRA.Analysis.Limits

                                                                                   

             

       
                                         
                                                                    
   
  
theorem ZeroOverZeroResolvedByFactoring :
    TendsTo (fun x : ℝ => (x ^ 2 - 4) / (x - 2)) {x : ℝ | x ≠ 2} 2 4 := by
  sorry

                                                                                                  

             

       
                                              
                                                                        
   
  
theorem InftyOverInftyResolvedByDominantTerm :
    TendsToInfty (fun x : ℝ => (2 * x + 1) / (x + 3)) {x : ℝ | x > -3} 2 := by
  sorry

                                                                                             
      

             

       
                                                
                                                               
   
  
theorem ZeroTimesInftyResolvedBySimplification :
    TendsToRight (fun x : ℝ => x * (1 / x)) {x : ℝ | x > 0} 0 1 := by
  sorry

                                                                      
                                  

             

       
                                                
                                                                                 
   
  
theorem InftyMinusInftyResolvedByRationalizing :
    TendsToInfty (fun x : ℝ => Real.sqrt (x ^ 2 + x) - x) {x : ℝ | x > 0} (1 / 2) := by
  sorry

                                                                                     
                                      

             

       
                                       
                                                         
   
  
theorem ZeroToTheZeroResolvedByExpLog :
    TendsToRight (fun x : ℝ => x ^ x) {x : ℝ | x > 0} 0 1 := by
  sorry

                                                                                      

             

       
                                        
                                                             
   
  
theorem InftyToTheZeroResolvedByExpLog :
    TendsToInfty (fun x : ℝ => x ^ (1 / x)) {x : ℝ | x > 0} 1 := by
  sorry

                                                                                                 
                                     

             

       
                                       
                                                                            
   
  
theorem OneToTheInftyResolvedByExpLog :
    TendsToInfty (fun x : ℝ => (1 + 1 / x) ^ x) {x : ℝ | x > 0} (Real.exp 1) := by
  sorry

end LRA.Analysis.Limits
