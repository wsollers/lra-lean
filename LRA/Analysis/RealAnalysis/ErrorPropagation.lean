  
                                                             
                                                                          
                                                                        
                               
  

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.RealAnalysis

                                       

             

       
                                                    
   
  
def AbsoluteError (x xTilde : ℝ) : ℝ := |x - xTilde|

                                       

             

       
                                                                                       
   
  
noncomputable def RelativeError (x xTilde : ℝ) : ℝ := AbsoluteError x xTilde / |xTilde|

                           
                                                                                                
                                 

             

       
                                                  
                                             
                                                     
   
  
theorem AbsoluteErrorSum (x y xTilde yTilde : ℝ) :
    AbsoluteError (x + y) (xTilde + yTilde) ≤
      AbsoluteError x xTilde + AbsoluteError y yTilde := by
  sorry

                               
                                                                                           
                                                                                     
                        

             

       
                                                      
                                             
                                                                             
                                                     
   
  
theorem AbsoluteErrorProduct (x y xTilde yTilde : ℝ) :
    AbsoluteError (x * y) (xTilde * yTilde) ≤
      |xTilde| * AbsoluteError y yTilde + |yTilde| * AbsoluteError x xTilde +
      AbsoluteError x xTilde * AbsoluteError y yTilde := by
  sorry

                                
                                                                                       
                                                                                        
                                                                                    
                          

             

       
                                                     
                                       
                                           
                                             
                                                                             
                                                         
   
  
theorem AbsoluteErrorQuotient (x y xTilde yTilde : ℝ)
    (hy : y ≠ 0) (hyTilde : yTilde ≠ 0)
    (hdelta : RelativeError y yTilde < 1) :
    AbsoluteError (x / y) (xTilde / yTilde) ≤
      (|xTilde| * AbsoluteError y yTilde + |yTilde| * AbsoluteError x xTilde)
        / yTilde ^ 2 * (1 / (1 - RelativeError y yTilde)) := by
  sorry

                                                                                           
                                                                                            
                                                 

             

       
                                                    
                                                   
                                             
                                                       
                                                     
   
  
theorem RelativeErrorProduct (x y xTilde yTilde : ℝ)
    (hxTilde : xTilde ≠ 0) (hyTilde : yTilde ≠ 0) :
    RelativeError (x * y) (xTilde * yTilde) ≤
      RelativeError x xTilde + RelativeError y yTilde +
      RelativeError x xTilde * RelativeError y yTilde := by
  sorry

                                                                                                 
                                                                                             
                                                                 

             

       
                                                     
                                                 
                                           
                                             
                                                         
                                    
   
  
theorem RelativeErrorQuotient (x y xTilde yTilde : ℝ)
    (hxTilde : xTilde ≠ 0) (hyTilde : yTilde ≠ 0)
    (hdelta : RelativeError y yTilde < 1) :
    RelativeError (x / y) (xTilde / yTilde) ≤
      (RelativeError x xTilde + RelativeError y yTilde) /
        (1 - RelativeError y yTilde) := by
  sorry

end LRA.Analysis.RealAnalysis
