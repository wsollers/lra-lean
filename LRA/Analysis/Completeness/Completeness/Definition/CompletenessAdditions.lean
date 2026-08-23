import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Sqrt

   
                                                                      
                                                               
                                      

                                          
  

namespace LRA.Analysis.Completeness

                                                                             
                                                                 

             

       
                                                                    
   
  
def RationalCutLowerAtSqrtTwo : Set ℚ := {q : ℚ | q < 0 ∨ q ^ 2 < 2}

                                   

             

       
                                                                    
   
  
def RationalCutUpperAtSqrtTwo : Set ℚ := {q : ℚ | 0 ≤ q ∧ 2 ≤ q ^ 2}

                                                           

             

       
                                                              
   
  
def RealCutLowerAtSqrtTwo : Set ℝ := {x : ℝ | x < Real.sqrt 2}

                                                           

             

       
                                                              
   
  
def RealCutUpperAtSqrtTwo : Set ℝ := {x : ℝ | Real.sqrt 2 ≤ x}

end LRA.Analysis.Completeness
