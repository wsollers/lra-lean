import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

   
                                                                            
                                                             
                                                         
  

namespace LRA.Analysis.Limits

section AlgebraOfLimits

variable {f g : ℝ → ℝ} {A : Set ℝ} {c Lf Lg α : ℝ}

                  
                                                                                                  
           

             

       
                                                                    
                                              
   
  
theorem TendstoAdd (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    TendsTo (fun x => f x + g x) A c (Lf + Lg) := by
  sorry

                                                                                                  
           

             

       
                                                                    
                                              
   
  
theorem TendstoSub (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    TendsTo (fun x => f x - g x) A c (Lf - Lg) := by
  sorry

                              
                                                                                            

             

       
                                                       
                                           
   
  
theorem TendstoScalar (hf : TendsTo f A c Lf) (α : ℝ) :
    TendsTo (fun x => α * f x) A c (α * Lf) := by
  sorry

                      
                                                                                                  
           

             

       
                                                                    
                                              
   
  
theorem TendstoMul (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg) :
    TendsTo (fun x => f x * g x) A c (Lf * Lg) := by
  sorry

                       
                                                                                                    
                          

             

       
                                                                  
                    
                                              
   
  
theorem TendstoDiv (hf : TendsTo f A c Lf) (hg : TendsTo g A c Lg)
    (hLg : Lg ≠ 0) :
    TendsTo (fun x => f x / g x) A c (Lf / Lg) := by
  sorry

end AlgebraOfLimits

                                
                                                                                                    
                                                                                     

             

       
                                                                   
                                                         
                                                   
                   
   
  
theorem SqueezeFunctionLimits (f g h : ℝ → ℝ) (A : Set ℝ) (c L : ℝ)
    (hfg : ∀ x ∈ A, f x ≤ g x) (hgh : ∀ x ∈ A, g x ≤ h x)
    (hf : TendsTo f A c L) (hh : TendsTo h A c L) :
    TendsTo g A c L := by
  sorry

end LRA.Analysis.Limits
