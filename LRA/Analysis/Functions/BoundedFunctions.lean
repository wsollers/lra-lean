  
                                                             
                                                               
                                                                   
                                                             
                                                                
         

                                                                
                                                                        
                                                                      
                                                                        
                                                                       
                                                                    
                                                                       
                                                                       
                                                                      
                                                                
                                                                
                                                                       
                                                                        
                                                                    
                                                    

                                                                  
                                                                       
                                                                     
                                                                   
                                                                      
                                                                     
                                                                
                                                                    
                                     
  

import Mathlib.Data.Real.Basic
import Mathlib.Topology.Instances.Real.Lemmas

namespace LRA.Analysis.Functions

                                 

             

       
                                                          
                           
   
  
def FunctionBoundedAbove (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ M : ℝ, ∀ x ∈ A, f x ≤ M

                                 

             

       
                                                          
                           
   
  
def FunctionBoundedBelow (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ m : ℝ, ∀ x ∈ A, m ≤ f x

                           

             

       
                                                     
                             
   
  
def FunctionBounded (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ B > 0, ∀ x ∈ A, |f x| ≤ B

                                      

             

       
                                                                 
                                                                  
   
  
def FunctionBoundedNear (f : ℝ → ℝ) (c : ℝ) (A : Set ℝ) : Prop :=
  ∃ δ > 0, ∃ B > 0, ∀ x ∈ A, 0 < |x - c| ∧ |x - c| < δ → |f x| ≤ B

                                          

             

       
                                                                 
                             
   
  
def FunctionBoundedAwayFromZero (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ ε > 0, ∀ x ∈ A, |f x| ≥ ε

                                               

             

       
                                                                             
                                                                  
   
  
def FunctionBoundedAwayFromZeroNear (f : ℝ → ℝ) (c : ℝ) (A : Set ℝ) : Prop :=
  ∃ δ > 0, ∃ ε > 0, ∀ x ∈ A, 0 < |x - c| ∧ |x - c| < δ → |f x| ≥ ε

                                   

             

       
                                                                            
                                        
   
  
def UniformlyBoundedFamily {I : Type*} (f : I → ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∃ B > 0, ∀ α : I, ∀ x ∈ A, |f α x| ≤ B

                                                 
                                                                                                  
       

             

       
                                                                     
                                                                 
   
  
theorem BoundedIffAbsoluteValueBoundedAbove (f : ℝ → ℝ) (A : Set ℝ) :
    FunctionBounded f A ↔ FunctionBoundedAbove (fun x => |f x|) A := by
  sorry

                                                                                        
                      

             

       
                                                                     
                                                   
   
  
theorem BoundednessRestriction (f : ℝ → ℝ) (S A : Set ℝ) (hS : S ⊆ A)
    (h : FunctionBounded f A) : FunctionBounded f S := by
  sorry

                                                                                                   
                                

             

       
                                               
                                  
                                                          
                             
   
  
theorem BoundednessNotPreservedUnderExtension :
    ∃ (A B : Set ℝ) (f g : ℝ → ℝ),
      A ⊆ B ∧ FunctionBounded f A ∧ (∀ x ∈ A, g x = f x) ∧
        ¬ FunctionBounded g B := by
  sorry

                                                                                                   
   

             

       
                                                                 
                                                            
   
  
theorem BoundedAwayFromZeroImpliesNonzero (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionBoundedAwayFromZero f A) : ∀ x ∈ A, f x ≠ 0 := by
  sorry

                                                                                                
                                                             

             

       
                                                             
                                                                     
                                                         
   
  
theorem BoundedAwayFromZeroNearImpliesNonzeroNear (f : ℝ → ℝ)
    (c : ℝ) (A : Set ℝ) (h : FunctionBoundedAwayFromZeroNear f c A) :
    ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| ∧ |x - c| < δ → f x ≠ 0 := by
  sorry

                                                        
                                                                                                    
                      

             

       
                                                                         
                                           
                                        
   
  
theorem BoundedAwayFromZeroGivesBoundedReciprocal (f : ℝ → ℝ) (A : Set ℝ)
    (h : FunctionBoundedAwayFromZero f A) :
    FunctionBounded (fun x => 1 / f x) A := by
  sorry

                                                                    
                                                                                                
                                                  

             

       
                                                           
                                                                                 
                                              
   
  
theorem LocalBoundedAwayFromZeroGivesLocalBoundedReciprocal
    (f : ℝ → ℝ) (c : ℝ) (A : Set ℝ) (h : FunctionBoundedAwayFromZeroNear f c A) :
    FunctionBoundedNear (fun x => 1 / f x) c A := by
  sorry

                                                           
                                                                                               
                                                                                 
                      

             

       
                                                     
                                           
                                        
                                                                                 
                       
   
  
theorem UniformBoundednessTransferUnderPointwiseLimit
    (f : ℕ → ℝ → ℝ) (F : ℝ → ℝ) (A : Set ℝ)
    (hunif : UniformlyBoundedFamily f A)
    (hlim : ∀ x ∈ A, Filter.Tendsto (fun n => f n x) Filter.atTop (nhds (F x))) :
    FunctionBounded F A := by
  sorry

                                         
                                                                                          
                                                                                                
                                                                                              
                                                                                   
                                              

             

       
                                                                         
                                                           
                                            
                                              
                                              
                                              
                                          
                                                    
                                                  
   
  
theorem BoundedFunctionAlgebraClosure (f g : ℝ → ℝ) (A : Set ℝ) (lam : ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBounded g A) :
    FunctionBounded (fun x => f x + g x) A ∧
      FunctionBounded (fun x => f x - g x) A ∧
      FunctionBounded (fun x => f x * g x) A ∧
      FunctionBounded (fun x => lam * f x) A ∧
      FunctionBounded (fun x => |f x|) A ∧
      FunctionBounded (fun x => max (f x) (g x)) A ∧
      FunctionBounded (fun x => min (f x) (g x)) A := by
  sorry

                                                                                                  
                                              

             

       
                                            
                                                           
                                          
   
  
theorem BoundedSum (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBounded g A) :
    FunctionBounded (fun x => f x + g x) A := by
  sorry

                                                                                                  
                                              

             

       
                                                   
                                                           
                                          
   
  
theorem BoundedDifference (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBounded g A) :
    FunctionBounded (fun x => f x - g x) A := by
  sorry

                                                                                                  
                                              

             

       
                                                
                                                           
                                          
   
  
theorem BoundedProduct (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBounded g A) :
    FunctionBounded (fun x => f x * g x) A := by
  sorry

                                                                                      
                                         

             

       
                                                               
                                                                       
   
  
theorem BoundedScalarMultiple (f : ℝ → ℝ) (A : Set ℝ) (lam : ℝ)
    (hf : FunctionBounded f A) : FunctionBounded (fun x => lam * f x) A := by
  sorry

                                                                                                   
          

             

       
                                                    
                                                                   
   
  
theorem BoundedAbsoluteValue (f : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) : FunctionBounded (fun x => |f x|) A := by
  sorry

                                                                                                  
                                                                                               
   

             

       
                                               
                                                           
                                                  
                                                  
   
  
theorem BoundedMaxMin (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBounded g A) :
    FunctionBounded (fun x => max (f x) (g x)) A ∧
      FunctionBounded (fun x => min (f x) (g x)) A := by
  sorry

                                                
                                                                                     
                                                                                            
                                                                                              
       

             

       
                                                         
                                                              
                                              
                                           
                                                
                                              
                                            
   
  
theorem BoundedFunctionsFormCommutativeRing (A : Set ℝ) :
    ∀ f g : ℝ → ℝ, FunctionBounded f A → FunctionBounded g A →
      FunctionBounded (fun x => f x + g x) A ∧
        FunctionBounded (fun x => -f x) A ∧
        FunctionBounded (fun x => f x * g x) A ∧
        FunctionBounded (fun _ => (0 : ℝ)) A ∧
        FunctionBounded (fun _ => (1 : ℝ)) A := by
  sorry

                                                 
                                                                                                
                                                                                            
                                                               

             

       
                                                         
                                                                         
                                              
                                           
                                                
                                            
   
  
theorem BoundedFunctionsFormRealVectorSpace (A : Set ℝ) :
    ∀ f g : ℝ → ℝ, ∀ lam : ℝ, FunctionBounded f A → FunctionBounded g A →
      FunctionBounded (fun x => f x + g x) A ∧
        FunctionBounded (fun x => -f x) A ∧
        FunctionBounded (fun x => lam * f x) A ∧
        FunctionBounded (fun _ => (0 : ℝ)) A := by
  sorry

                              
                                                                            
                                                                                

             

       
                                                     
                                                                       
                                          
   
  
theorem BoundedAwayQuotient (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBoundedAwayFromZero g A) :
    FunctionBounded (fun x => f x / g x) A := by
  sorry

                                                                            
                                                                                

             

       
                                                                         
                                                                       
                                          
   
  
theorem BoundedQuotientByBoundedAwayDenominator (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : FunctionBounded f A) (hg : FunctionBoundedAwayFromZero g A) :
    FunctionBounded (fun x => f x / g x) A := by
  sorry

end LRA.Analysis.Functions
