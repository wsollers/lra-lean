  
                                                             
                                                                                       

                                                                          
                                                                       
                                                                       
                    
  

import Mathlib.Data.Real.Basic

namespace LRA.Analysis.Differentiation

                                                                      

             

       
                                                               
                                                      
   
  
noncomputable def SecantLine (f : ℝ → ℝ) (x₁ x₂ : ℝ) : ℝ → ℝ :=
  fun x => f x₁ + (f x₂ - f x₁) / (x₂ - x₁) * (x - x₁)

                                                                      
        

             

       
                                                                 
                       
   
  
noncomputable def DifferenceQuotient (f : ℝ → ℝ) (c h : ℝ) : ℝ :=
  (f (c + h) - f c) / h

                                                                       
                                                      

             

       
                                                  
                              
   
  
def TangentLine (f : ℝ → ℝ) (c fc' : ℝ) : ℝ → ℝ :=
  fun x => f c + fc' * (x - c)

end LRA.Analysis.Differentiation
