import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.Analysis.Bounds.Extrema.UpperLowerBounds

   
                                                                          
  

namespace LRA.Analysis.Bounds.Algebra

                                                  

             

       
                                           
                       
   
  
def Displace (A : Set ℝ) (c : ℝ) : Set ℝ :=
  (fun a => a + c) '' A

                                                                                

             

       
                                             
                           
   
  
def Dilate (A : Set ℝ) (scale : ℝ) : Set ℝ :=
  (fun a => scale * a) '' A

                                                   

             

       
                                  
                    
   
  
def Reflect (A : Set ℝ) : Set ℝ :=
  (fun a => -a) '' A

                                                             
                                           
                                                          

             

       
                                                             
                           
                                             
                                                           
   
  
theorem TranslationPreservesUpperBounds {A : Set ℝ} {c u : ℝ}
    (upperBoundHypothesis :
      LRA.Analysis.Bounds.IsUpperBound u A) :
    LRA.Analysis.Bounds.IsUpperBound (u + c) (Displace A c) := by
  sorry

                                                             
                                           
                                                          

             

       
                                                             
                           
                                             
                                                           
   
  
theorem TranslationPreservesLowerBounds {A : Set ℝ} {c l : ℝ}
    (lowerBoundHypothesis :
      LRA.Analysis.Bounds.IsLowerBound l A) :
    LRA.Analysis.Bounds.IsLowerBound (l + c) (Displace A c) := by
  sorry

                                                                                                 
                                           
                                                                

             

       
                                                                      
                               
                           
                                             
                                    
                                  
   
  
theorem PositiveDilationPreservesUpperBounds {A : Set ℝ} {scale u : ℝ}
    (positiveScale : 0 < scale)
    (upperBoundHypothesis :
      LRA.Analysis.Bounds.IsUpperBound u A) :
    LRA.Analysis.Bounds.IsUpperBound
      (scale * u) (Dilate A scale) := by
  sorry

                                                                                                 
                                           
                                                                

             

       
                                                                      
                               
                           
                                             
                                    
                                  
   
  
theorem PositiveDilationPreservesLowerBounds {A : Set ℝ} {scale l : ℝ}
    (positiveScale : 0 < scale)
    (lowerBoundHypothesis :
      LRA.Analysis.Bounds.IsLowerBound l A) :
    LRA.Analysis.Bounds.IsLowerBound
      (scale * l) (Dilate A scale) := by
  sorry

                                                                                                 
                                           
                                                                

             

       
                                                                         
                               
                           
                                             
                                    
                                  
   
  
theorem NegativeDilationSendsLowerToUpperBounds {A : Set ℝ} {scale l : ℝ}
    (negativeScale : scale < 0)
    (lowerBoundHypothesis :
      LRA.Analysis.Bounds.IsLowerBound l A) :
    LRA.Analysis.Bounds.IsUpperBound
      (scale * l) (Dilate A scale) := by
  sorry

                                                                                                 
                                           
                                                                

             

       
                                                                         
                               
                           
                                             
                                    
                                  
   
  
theorem NegativeDilationSendsUpperToLowerBounds {A : Set ℝ} {scale u : ℝ}
    (negativeScale : scale < 0)
    (upperBoundHypothesis :
      LRA.Analysis.Bounds.IsUpperBound u A) :
    LRA.Analysis.Bounds.IsLowerBound
      (scale * u) (Dilate A scale) := by
  sorry

                                                                         
                                                       

             

       
                                                                     
                                          
                                                       
   
  
theorem ReflectionSwapsUpperBoundsToLowerBounds {A : Set ℝ} {b : ℝ} :
    LRA.Analysis.Bounds.IsUpperBound b A ↔
      LRA.Analysis.Bounds.IsLowerBound (-b) (Reflect A) := by
  sorry

                                                                         
                                                       

             

       
                                                                     
                                          
                                                       
   
  
theorem ReflectionSwapsLowerBoundsToUpperBounds {A : Set ℝ} {b : ℝ} :
    LRA.Analysis.Bounds.IsLowerBound b A ↔
      LRA.Analysis.Bounds.IsUpperBound (-b) (Reflect A) := by
  sorry

end LRA.Analysis.Bounds.Algebra
