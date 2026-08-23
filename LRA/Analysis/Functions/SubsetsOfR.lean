  
                                                             
                                                              
                                                                       
                                                                        
                                                                      
                                               

                                                                
                                                                        
                                                                        
                                                                     
                                                                     
                                                                 
                                                                      
                                                                      
                                        

                                                                 
                                                                  
                                                                   
                                                                       
                                                                
                                                                  
                                                                
                                                                     
                                                              
                                                                     
                                                                        
                                  

                                                                   
                                                                       
                                                                 
                                                                
                                                                
                                                                        
                                                                

                                                                    
                                                                 
                                                                   
                                                                     
                                                                       
                                                                
                                                                  

                                                            
                                                                         
                                                                   
                                                             
                                                             
                                                                       

                                                                    
                                                                
                                                                     
                                                                
                                                                       
                                                                   
                                   
  

import Mathlib.Data.Real.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Interval.Set.OrdConnected

namespace LRA.Analysis.Functions

                                

             

       
                                                                   
   
  
def CenteredOpenInterval (x ε : ℝ) : Set ℝ := {y : ℝ | |y - x| < ε}

                                        

             

       
                                                      
                                
   
  
def PuncturedCenteredOpenInterval (x ε : ℝ) : Set ℝ :=
  CenteredOpenInterval x ε \ {x}

                          

             

       
                                                 
                                     
   
  
def IsClusterPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ y ∈ X \ {x}, |y - x| < ε

                                 
                                                                                                
                                        

             

       
                                                    
                         
                                         
                                              
   
  
theorem ClusterPointSequential (c : ℝ) (A : Set ℝ) :
    IsClusterPointR c A ↔
      ∃ a : ℕ → ℝ, (∀ n, a n ∈ A \ {c}) ∧
        Filter.Tendsto a Filter.atTop (nhds c) := by
  sorry

                           

             

       
                                                  
                               
   
  
def IsAdherentPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ y ∈ X, |y - x| < ε

                           

             

       
                                                  
                                                     
   
  
def IsIsolatedPointR (x : ℝ) (X : Set ℝ) : Prop :=
  x ∈ X ∧ ∃ ε > 0, CenteredOpenInterval x ε ∩ X = {x}

                           

             

       
                                                  
                                       
   
  
def IsInteriorPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∃ ε > 0, CenteredOpenInterval x ε ⊆ X

                           

             

       
                                                  
                                                    
                                            
   
  
def IsBoundaryPointR (x : ℝ) (X : Set ℝ) : Prop :=
  ∀ ε > 0, (CenteredOpenInterval x ε ∩ X).Nonempty ∧
    (CenteredOpenInterval x ε ∩ Xᶜ).Nonempty

                     

             

       
                                                                   
   
  
def InteriorR (X : Set ℝ) : Set ℝ := {x : ℝ | IsInteriorPointR x X}

                     

             

       
                                                                   
   
  
def BoundaryR (X : Set ℝ) : Set ℝ := {x : ℝ | IsBoundaryPointR x X}

                    

             

       
                                                                  
   
  
def ClosureR (X : Set ℝ) : Set ℝ := {x : ℝ | IsAdherentPointR x X}

                                                                              

             

       
                                                            
                                         
   
  
theorem AdherentPointsAreClosurePoints (x : ℝ) (X : Set ℝ) :
    x ∈ ClosureR X ↔ IsAdherentPointR x X := by
  sorry

                                                                                                   
                         

             

       
                                                                     
                  
                                                                       
   
  
theorem IsolatedPointsAreNonclusterAdherentPoints (x : ℝ) (X : Set ℝ)
    (hx : x ∈ X) :
    IsIsolatedPointR x X ↔ IsAdherentPointR x X ∧ ¬ IsClusterPointR x X := by
  sorry

                                                                               

             

       
                                                                
                                          
   
  
theorem InteriorMembershipCharacterization (x : ℝ) (X : Set ℝ) :
    x ∈ InteriorR X ↔ IsInteriorPointR x X := by
  sorry

                                            

             

       
                                                              
   
  
theorem InteriorIsContainedInSet (X : Set ℝ) : InteriorR X ⊆ X := by
  sorry

                       

             

       
                                                  
   
  
def IsClosedR (E : Set ℝ) : Prop := ClosureR E = E

                                                                                                   
                    

             

       
                                                     
                                             
                                                       
   
  
theorem ClosureIsSmallestClosedSuperset (X : Set ℝ) :
    X ⊆ ClosureR X ∧ IsClosedR (ClosureR X) ∧
      ∀ C : Set ℝ, IsClosedR C → X ⊆ C → ClosureR X ⊆ C := by
  sorry

                                                                   

             

       
                                                    
                                          
   
  
theorem BoundaryAsClosureMinusInterior (X : Set ℝ) :
    BoundaryR X = ClosureR X \ InteriorR X := by
  sorry

                           
                                                                                                   
                                                                       

             

       
                                         
                    
                                                  
                                                  
                                       
   
  
theorem ClosureElementary (X Y : Set ℝ) :
    X ⊆ ClosureR X ∧
      ClosureR (X ∪ Y) = ClosureR X ∪ ClosureR Y ∧
      ClosureR (X ∩ Y) ⊆ ClosureR X ∩ ClosureR Y ∧
      (X ⊆ Y → ClosureR X ⊆ ClosureR Y) := by
  sorry

                                                                                                
                               

             

       
                                        
                 
                                   
                                                               
   
  
theorem ClosedIffSeqLimits (X : Set ℝ) :
    IsClosedR X ↔
      ∀ a : ℕ → ℝ, (∀ n, a n ∈ X) →
        ∀ x : ℝ, Filter.Tendsto a Filter.atTop (nhds x) → x ∈ X := by
  sorry

                                                                                              
                     

             

       
                                                                                               
                                
   
  
theorem IntervalAllLimitPoints (I : Set ℝ) (hI : I.OrdConnected) (hnontrivial : I.Nontrivial) :
    ∀ x ∈ I, IsClusterPointR x I := by
  sorry

                        

             

       
                                                                 
   
  
def IsBoundedSetR (X : Set ℝ) : Prop := ∃ M > 0, ∀ x ∈ X, |x| ≤ M

                                      
                                                                                                    
                                                                         

             

       
                                               
                                     
                                   
                                   
                                                               
   
  
theorem HeineBorelSubsetsRealLine (X : Set ℝ) :
    (IsClosedR X ∧ IsBoundedSetR X) ↔
      ∀ a : ℕ → ℝ, (∀ n, a n ∈ X) →
        ∃ φ : ℕ → ℕ, StrictMono φ ∧
          ∃ L ∈ X, Filter.Tendsto (a ∘ φ) Filter.atTop (nhds L) := by
  sorry

                                                                        
                                                                        
                                                                 
                                                         

             

       
                                              
                                                     
   
  
def TrueNear (Q : ℝ → Prop) (x₀ : ℝ) : Prop :=
  ∃ δ > 0, ∀ x : ℝ, 0 < |x - x₀| ∧ |x - x₀| < δ → Q x

                                                                                                   
                    

             

       
                                                            
                         
                                                       
   
  
theorem TrueNearStableUnderShrinking (Q : ℝ → Prop) (x₀ : ℝ)
    (h : TrueNear Q x₀) :
    ∃ η > 0, ∀ x : ℝ, 0 < |x - x₀| ∧ |x - x₀| < η → Q x := by
  sorry

                                                                                           
                                   

             

       
                                                                
                                               
                                    
   
  
theorem TrueNearStableUnderConjunction (P Q : ℝ → Prop) (x₀ : ℝ)
    (hP : TrueNear P x₀) (hQ : TrueNear Q x₀) :
    TrueNear (fun x => P x ∧ Q x) x₀ := by
  sorry

                                                                      
                                                                     
                                                                      
                            

             

       
                                                 
   
  
def IsOpenR (X : Set ℝ) : Prop := InteriorR X = X

                                                     

             

       
                                             
                            
   
  
theorem OpenIffComplementClosed (X : Set ℝ) :
    IsOpenR X ↔ IsClosedR Xᶜ := by
  sorry

                                                                                               

             

       
                                                       
                                                  
   
  
theorem FiniteSetIsClosed (X : Set ℝ) (hX : X.Finite) :
    (∀ x : ℝ, ¬ IsClusterPointR x X) ∧ IsClosedR X := by
  sorry

end LRA.Analysis.Functions
