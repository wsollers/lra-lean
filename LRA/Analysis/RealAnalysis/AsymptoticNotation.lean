  
                                                             
                                                                              
                                                   
                                                                         
                                                                       
                                              
  

import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas

namespace LRA.Analysis.RealAnalysis

                                                           

             

       
                                               
                                                                      
   
  
def IsLittleOAt (f g : ℝ → ℝ) (a : ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x| ≤ ε * |g x|

                                                            

             

       
                                          
                                                  
   
  
def IsLittleOAtTop (f g : ℝ → ℝ) : Prop :=
  ∀ ε > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ ε * |g x|

                                                                         
                                              

             

       
                                            
                                                            
   
  
def IsIncrementLittleO (r : ℝ → ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ h, 0 < |h| → |h| < δ → |r h| ≤ ε * |h|

                                                                                              
                                                                                               
    

             

       
                                                             
                                                                     
                       
                                                                      
   
  
theorem LittleOQuotientCharacterization (f g : ℝ → ℝ) (a : ℝ)
    (hg : Filter.Eventually (fun x => g x ≠ 0) (nhdsWithin a {a}ᶜ)) :
    IsLittleOAt f g a ↔
      Filter.Tendsto (fun x => f x / g x) (nhdsWithin a {a}ᶜ) (nhds 0) := by
  sorry

                                                                                                
                                              

             

       
                                                
                                                         
                                          
   
  
theorem LittleOSumRule (f1 f2 g : ℝ → ℝ) (a : ℝ)
    (h1 : IsLittleOAt f1 g a) (h2 : IsLittleOAt f2 g a) :
    IsLittleOAt (fun x => f1 x + f2 x) g a := by
  sorry

                                                                                                   
                                                                                

             

       
                                                        
                            
                                                                         
                                        
   
  
theorem LittleOBoundedFactorRule (f g m : ℝ → ℝ) (a : ℝ)
    (hf : IsLittleOAt f g a)
    (hm : ∃ M > 0, ∃ η > 0, ∀ x, 0 < |x - a| → |x - a| < η → |m x| ≤ M) :
    IsLittleOAt (fun x => m x * f x) g a := by
  sorry

end LRA.Analysis.RealAnalysis
