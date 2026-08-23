import Mathlib.Data.Set.Basic
import LRA.Set.Interop.Mathlib.PredicateSet.Instances
import LRA.Set
import LRA.Set.PredicateSet
import LRA.Set.ZFC
import LRA.Set.ZFCSet
import LRA.Set.Model
import LRA.SetSystems
import LRA.SetSystems.AlgebraOfSets
import LRA.SetSystems.SigmaAlgebra

namespace LRA.SetSystems.Instantiations

open LRA.SetSystems LRA.Set

   
                                                                      
                                                               
                                                                   
                                                                     
                                                                      
                                                     

                                                                   
  

                                                        

             

       
                                            
   
  
abbrev ActiveSet (Point : Type) := Set Point

                                                                  

                                       

             

       
                                                                 
   
  
theorem activeSetAlgebraMembersAreSubsets (Point : Type) :
    ∀ A : ActiveSet Point, True → A ⊆ Set.univ := by
  sorry

   
                                                                            
                      

             

       
                                           
   
  
theorem activeSetAlgebraUnionIsMember (Point : Type) :
    ∀ A B : ActiveSet Point, True → True → True := by
  sorry

   
                                                                          
                                      

             

       
                                           
   
  
theorem activeSetAlgebraIntersectionIsMember (Point : Type) :
    ∀ A B : ActiveSet Point, True → True → True := by
  sorry

   
                                                                        
                                             

             

       
                                           
   
  
theorem activeSetAlgebraDifferenceIsMember (Point : Type) :
    ∀ A B : ActiveSet Point, True → True → True := by
  sorry

   
                                                                          
                                                      

             

       
                                           
   
  
theorem activeSetAlgebraSymmetricDifferenceIsMember (Point : Type) :
    ∀ A B : ActiveSet Point, True → True → True := by
  sorry

   
                                                                           
                                 

             

       
                                     
                                              
   
  
def activeSetAlgebra (Point : Type) :
    AlgebraOfSets (Set.univ : ActiveSet Point) where
  IsMember := fun _ => True
  MembersAreSubsets := activeSetAlgebraMembersAreSubsets Point
  EmptyIsMember := trivial
  UnionIsMember := activeSetAlgebraUnionIsMember Point
  IntersectionIsMember := activeSetAlgebraIntersectionIsMember Point
  DifferenceIsMember := activeSetAlgebraDifferenceIsMember Point
  SymmetricDifferenceIsMember := activeSetAlgebraSymmetricDifferenceIsMember Point
  AmbientIsMember := trivial

                                                                    
             

                                       

             

       
                      
                                                                    
   
  
theorem emptyUniversalSetAlgebraMembersAreSubsets (Point : Type) :
    ∀ A : ActiveSet Point, (A = ∅ ∨ A = Set.univ) → A ⊆ Set.univ := by
  sorry

   
                                                                            
                                    

             

       
                                                              
   
  
theorem emptyUniversalSetAlgebraEmptyIsMember (Point : Type) :
    ((∅ : ActiveSet Point) = ∅ ∨ (∅ : ActiveSet Point) = Set.univ) := by
  sorry

   
                                                                           
                              

             

       
                        
                          
                          
                                
   
  
theorem emptyUniversalSetAlgebraUnionIsMember (Point : Type) :
    ∀ A B : ActiveSet Point,
      (A = ∅ ∨ A = Set.univ) →
      (B = ∅ ∨ B = Set.univ) →
      (A ∪ B = ∅ ∨ A ∪ B = Set.univ) := by
  sorry

   
                                                                      
                                                 

             

       
                        
                          
                          
                                
   
  
theorem emptyUniversalSetAlgebraIntersectionIsMember (Point : Type) :
    ∀ A B : ActiveSet Point,
      (A = ∅ ∨ A = Set.univ) →
      (B = ∅ ∨ B = Set.univ) →
      (A ∩ B = ∅ ∨ A ∩ B = Set.univ) := by
  sorry

   
                                                                    
                                                        

             

       
                        
                          
                          
                                
   
  
theorem emptyUniversalSetAlgebraDifferenceIsMember (Point : Type) :
    ∀ A B : ActiveSet Point,
      (A = ∅ ∨ A = Set.univ) →
      (B = ∅ ∨ B = Set.univ) →
      (A \ B = ∅ ∨ A \ B = Set.univ) := by
  sorry

   
                                                                          
                                                             

             

       
                        
                          
                          
                                
   
  
theorem emptyUniversalSetAlgebraSymmetricDifferenceIsMember (Point : Type) :
    ∀ A B : ActiveSet Point,
      (A = ∅ ∨ A = Set.univ) →
      (B = ∅ ∨ B = Set.univ) →
      (A ∆ B = ∅ ∨ A ∆ B = Set.univ) := by
  sorry

   
                                                                           
                                           

             

       
                                   
                                          
   
  
theorem emptyUniversalSetAlgebraAmbientIsMember (Point : Type) :
    ((Set.univ : ActiveSet Point) = ∅ ∨
      (Set.univ : ActiveSet Point) = Set.univ) := by
  sorry

   
                                                                         
                                             

             

       
                                             
                                              
   
  
def emptyUniversalSetAlgebra (Point : Type) :
    AlgebraOfSets (Set.univ : ActiveSet Point) where
  IsMember := fun setObject => setObject = ∅ ∨ setObject = Set.univ
  MembersAreSubsets := emptyUniversalSetAlgebraMembersAreSubsets Point
  EmptyIsMember := emptyUniversalSetAlgebraEmptyIsMember Point
  UnionIsMember := emptyUniversalSetAlgebraUnionIsMember Point
  IntersectionIsMember := emptyUniversalSetAlgebraIntersectionIsMember Point
  DifferenceIsMember := emptyUniversalSetAlgebraDifferenceIsMember Point
  SymmetricDifferenceIsMember :=
    emptyUniversalSetAlgebraSymmetricDifferenceIsMember Point
  AmbientIsMember := emptyUniversalSetAlgebraAmbientIsMember Point

                                                               

                                       

             

       
                                                                   
   
  
theorem activeSigmaAlgebraCountableUnionIsMember (Point : Type) :
    ∀ family : Nat → ActiveSet Point,
      (∀ index, (activeSetAlgebra Point).IsMember (family index)) →
        (activeSetAlgebra Point).IsMember
          (HasCountableUnion.countableUnion family) := by
  sorry

   
                                                                          
                                 

             

       
                                       
                                                   
   
  
def activeSigmaAlgebra (Point : Type) :
    SigmaAlgebraOfSets (Set.univ : ActiveSet Point) where
  toAlgebraOfSets := activeSetAlgebra Point
  CountableUnionIsMember := activeSigmaAlgebraCountableUnionIsMember Point

                                                                     
              

                                       

             

       
                                  
                                         
   
  
theorem lraSetAlgebraMembersAreSubsets (Point : Type) :
    ∀ A : LRA.Set.PredicateSet Point, True →
      A ⊆ LRA.Set.PredicateSet.Universal Point := by
  sorry

   
                                                                          
                      

             

       
                                                       
   
  
theorem lraSetAlgebraUnionIsMember (Point : Type) :
    ∀ A B : LRA.Set.PredicateSet Point, True → True → True := by
  sorry

   
                                                                        
                                      

             

       
                                                       
   
  
theorem lraSetAlgebraIntersectionIsMember (Point : Type) :
    ∀ A B : LRA.Set.PredicateSet Point, True → True → True := by
  sorry

   
                                                                      
                                             

             

       
                                                       
   
  
theorem lraSetAlgebraDifferenceIsMember (Point : Type) :
    ∀ A B : LRA.Set.PredicateSet Point, True → True → True := by
  sorry

   
                                                                       
                                                       

             

       
                                                       
   
  
theorem lraSetAlgebraSymmetricDifferenceIsMember (Point : Type) :
    ∀ A B : LRA.Set.PredicateSet Point, True → True → True := by
  sorry

   
                                                                            
                                               

             

       
                                  
                                                  
   
  
def lraSetAlgebra (Point : Type) :
    AlgebraOfSets (LRA.Set.PredicateSet.Universal Point) where
  IsMember := fun _ => True
  MembersAreSubsets := lraSetAlgebraMembersAreSubsets Point
  EmptyIsMember := trivial
  UnionIsMember := lraSetAlgebraUnionIsMember Point
  IntersectionIsMember := lraSetAlgebraIntersectionIsMember Point
  DifferenceIsMember := lraSetAlgebraDifferenceIsMember Point
  SymmetricDifferenceIsMember := lraSetAlgebraSymmetricDifferenceIsMember Point
  AmbientIsMember := trivial


end LRA.SetSystems.Instantiations
