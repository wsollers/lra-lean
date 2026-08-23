import Mathlib.Data.Real.Basic
import LRA.EuclideanSpace.RealLine.Definition.RealLine

   
                                                                       
                         
  

namespace LRA.EuclideanSpace

                                                   

             

       
                                                                   
   
  
theorem RealLineDistanceNonneg (a b : ℝ) : RealLineDistance a b ≥ 0 := by
  sorry

                                                 

             

       
                                                               
   
  
theorem RealLineDistanceSelf (a : ℝ) : RealLineDistance a a = 0 := by
  sorry

                                                                      

             

       
                                        
                                               
   
  
theorem RealLineDistanceSymm (a b : ℝ) :
    RealLineDistance a b = RealLineDistance b a := by
  sorry

                                                           

                                                                       
                

             

       
                                             
                                    
   
  
theorem RealLineDistanceEqZeroIff (a b : ℝ) :
    RealLineDistance a b = 0 ↔ a = b := by
  sorry

                                                                        
                      

             

       
                                                        
                                                                      
   
  
theorem RealLineDistanceTriangleInequality (a b c : ℝ) :
    RealLineDistance a c ≤ RealLineDistance a b + RealLineDistance b c := by
  sorry

                                                              

                                                                 
                                                

             

       
                                           
                                       
   
  
theorem OpenIntervalNonemptyIff (a b : ℝ) :
    (OpenInterval a b).Nonempty ↔ a < b := by
  sorry

                                                                

             

       
                                                    
                                         
   
  
theorem OpenIntervalSubsetClosedInterval (a b : ℝ) :
    OpenInterval a b ⊆ ClosedInterval a b := by
  sorry

                                                                 
                              

             

       
                                                             
                                                                       
   
  
theorem TranslateMapsOpenIntervalToOpenInterval (c a b : ℝ) :
    (Translate1 c) '' (OpenInterval a b) = OpenInterval (a + c) (b + c) := by
  sorry

                                                                   
                                

             

       
                                                                 
                                                                           
   
  
theorem TranslateMapsClosedIntervalToClosedInterval (c a b : ℝ) :
    (Translate1 c) '' (ClosedInterval a b) =
      ClosedInterval (a + c) (b + c) := by
  sorry

                                                                                   
                                     

             

       
                                                                      
                             
                                                                    
   
  
theorem PositiveDilateMapsOpenIntervalToOpenInterval {k : ℝ} (a b : ℝ)
    (positiveScale : 0 < k) :
    (Dilate1 k) '' (OpenInterval a b) = OpenInterval (k * a) (k * b) := by
  sorry

                                                                                   
                                                                          
                                                         

             

       
                                                            
                             
                                                                    
   
  
theorem NegativeDilateReversesOpenInterval {k : ℝ} (a b : ℝ)
    (negativeScale : k < 0) :
    (Dilate1 k) '' (OpenInterval a b) = OpenInterval (k * b) (k * a) := by
  sorry

                                                                               
                                                             

             

       
                                                
                                                                             
   
  
theorem TranslateDistanceInvariant (c a b : ℝ) :
    RealLineDistance (Translate1 c a) (Translate1 c b) =
      RealLineDistance a b := by
  sorry

                                                                         
                                                                      
                                                                    
      

             

       
                                          
                                                  
                                                   
   
  
theorem DilateScalesDistance (k a b : ℝ) :
    RealLineDistance (Dilate1 k a) (Dilate1 k b) =
      (RealLineDistance 0 k) * RealLineDistance a b := by
  sorry

end LRA.EuclideanSpace
