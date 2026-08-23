import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.LimitsAtInfinity.Definition
import LRA.Analysis.Limits.Divergence.Definition

   
                                                                     
                                                                       
           
  

namespace LRA.Analysis.Limits

                                                                                            

             

       
                                                                              
                    
   
  
def HasHorizontalAsymptoteAtPosInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  TendsToInfty f X L

                                                                                               

             

       
                                                                              
                       
   
  
def HasHorizontalAsymptoteAtNegInfty (f : ℝ → ℝ) (X : Set ℝ) (L : ℝ) : Prop :=
  TendsToNegInfty f X L

                                                                                                    
                                                                                                
                      

             

       
                                                                    
                                                                  
                                                                        
   
  
def HasVerticalAsymptoteAt (f : ℝ → ℝ) (A : Set ℝ) (c : ℝ) : Prop :=
  DivergesToInftyFromRight f A c ∨ DivergesToInftyFromLeft f A c ∨
    DivergesToNegInftyFromRight f A c ∨ DivergesToNegInftyFromLeft f A c

                                                                                                   
                      

             

       
                                                                             
                                               
   
  
def HasObliqueAsymptoteAtPosInfty (f : ℝ → ℝ) (X : Set ℝ) (m b : ℝ) : Prop :=
  TendsToInfty (fun x => f x - (m * x + b)) X 0

                                                                  

             

       
                                                                             
                                                  
   
  
def HasObliqueAsymptoteAtNegInfty (f : ℝ → ℝ) (X : Set ℝ) (m b : ℝ) : Prop :=
  TendsToNegInfty (fun x => f x - (m * x + b)) X 0

end LRA.Analysis.Limits
