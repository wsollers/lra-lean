  
                                                             
                                                                                                        
                                                                    
                                                                        
                                                                     
                                                                     
                                                                       
                                                                        
                                                                       
                                               

                                                                  
                                                                
                                                                       
                                                                       
                                                                      
                                                                 
                                                                     
                                                                       
                                           

                                                                        
                                                                    
                             
  

import Mathlib.Data.Real.Basic
import Mathlib.Data.Fin.Basic

namespace LRA.Analysis.Functions

                             

             

       
                                                                        
                  
                    
   
  
def AtPointOperation {n : ℕ} (Φ : (Fin n → ℝ) → ℝ) (f : Fin n → (ℝ → ℝ))
    (x : ℝ) : ℝ :=
  Φ (fun i => f i x)

                                     

             

       
                                                         
                                    
                             
   
  
def PointwiseOperationOnSet {n : ℕ} (Φ : (Fin n → ℝ) → ℝ)
    (f : Fin n → (ℝ → ℝ)) : ℝ → ℝ :=
  fun x => Φ (fun i => f i x)

                            

             

       
                                                                          
                     
                    
   
  
def AtPointRelation {n : ℕ} (R : (Fin n → ℝ) → Prop) (f : Fin n → (ℝ → ℝ))
    (x : ℝ) : Prop :=
  R (fun i => f i x)

                                    

             

       
                                                           
                                               
                             
   
  
def PointwiseRelationOnSet {n : ℕ} (R : (Fin n → ℝ) → Prop)
    (f : Fin n → (ℝ → ℝ)) (A : Set ℝ) : Prop :=
  ∀ x ∈ A, R (fun i => f i x)

                                        

             

       
                                                               
                                                       
                                                                  
   
  
def PointwiseRelationNearPoint {n : ℕ} (R : (Fin n → ℝ) → Prop)
    (f : Fin n → (ℝ → ℝ)) (c : ℝ) (A : Set ℝ) : Prop :=
  ∃ δ > 0, ∀ x ∈ A, 0 < |x - c| ∧ |x - c| < δ → R (fun i => f i x)

                                                                                                   
                                                        

             

       
                                                                  
                                       
                                                                   
   
  
theorem PointwiseOperationEvaluation {n : ℕ} (Φ : (Fin n → ℝ) → ℝ)
    (f : Fin n → (ℝ → ℝ)) (A : Set ℝ) :
    ∀ x ∈ A, PointwiseOperationOnSet Φ f x = AtPointOperation Φ f x := by
  sorry

                                                                                            
                                                                

             

       
                                                                    
                                       
                                                                 
   
  
theorem PointwiseRelationEvaluation {n : ℕ} (R : (Fin n → ℝ) → Prop)
    (f : Fin n → (ℝ → ℝ)) (A : Set ℝ) :
    PointwiseRelationOnSet R f A ↔ ∀ x ∈ A, AtPointRelation R f x := by
  sorry

                                                                                                 
                                                                                            
                  

             

       
                                                                       
                                               
                                        
                                                                        
   
  
theorem PointwiseRelationNearUnpacking {n : ℕ} (R : (Fin n → ℝ) → Prop)
    (f : Fin n → (ℝ → ℝ)) (c : ℝ) (A : Set ℝ) :
    PointwiseRelationNearPoint R f c A ↔
      ∃ δ > 0, ∀ x ∈ A, (0 < |x - c| ∧ |x - c| < δ) → R (fun i => f i x) := by
  sorry

end LRA.Analysis.Functions
