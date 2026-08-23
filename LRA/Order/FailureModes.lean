import LRA.Order
import LRA.Order.Examples
import LRA.Relation.Properties.Definition
import LRA.Set.Interop.Mathlib.PredicateSet
import Mathlib.Data.Int.Order.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Logic.Function.Defs
import Mathlib.Order.Interval.Set.Defs

   
                                                           

                                                                             
                                                                              
                                               

                                                                        
                                                                          
                                                 

                                                                       
                                                                      
  

universe u v w x

                           

namespace LRA.Order

open LRA.Set

   
                                                       

                                                                           
                                                         

                                                                                                                            
  
def UpperBoundsFailToPreserveIndexedIntersectionsAsUnions
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) : Prop :=
  UpperBounds relation (HasIndexedIntersection.indexedIntersection family) ≠
    HasIndexedUnion.indexedUnion
      (fun index => UpperBounds relation (family index))

   
                                                        

                                                                           
                                                                       
                 

                                                                                                                       
  
theorem IntegerSingletonsWitnessUpperBoundsIntersectionFailure :
    UpperBoundsFailToPreserveIndexedIntersectionsAsUnions
      (fun left right : Int => left ≤ right)
      (fun index : Bool => if index then ({1} : Set Int) else {0}) := by
  sorry

   
                                                       

                                                                           
                                                         

                                                                                                                            
  
def LowerBoundsFailToPreserveIndexedIntersectionsAsUnions
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasIndexedUnion SetObject] [HasIndexedIntersection SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) : Prop :=
  LowerBounds relation (HasIndexedIntersection.indexedIntersection family) ≠
    HasIndexedUnion.indexedUnion
      (fun index => LowerBounds relation (family index))

   
                                                        

                                                                           
                                                                       
                 

                                                                                                                       
  
theorem IntegerSingletonsWitnessLowerBoundsIntersectionFailure :
    LowerBoundsFailToPreserveIndexedIntersectionsAsUnions
      (fun left right : Int => left ≤ right)
      (fun index : Bool => if index then ({1} : Set Int) else {0}) := by
  sorry

   
                                              

                                                                             
                                                                        

                                                                                                                                                                       
  
def EmptyIndexedIntersectionCreatesVacuousBounds
    {Element : Type u} {SetObject : Type v} {Index : Type w}
    [Membership Element SetObject]
    [HasIndexedIntersection SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (family : Index -> SetObject) : Prop :=
  (forall element,
      element ∉ HasIndexedIntersection.indexedIntersection family) /\
    (forall bound,
      UpperBound relation
          (HasIndexedIntersection.indexedIntersection family) bound /\
        LowerBound relation
          (HasIndexedIntersection.indexedIntersection family) bound)

   
                                              

                                                                           
                                                                     

                                                                                                              
  
theorem DisjointIntegerSingletonsCreateVacuousBounds :
    EmptyIndexedIntersectionCreatesVacuousBounds
      (fun left right : Int => left ≤ right)
      (fun index : Bool => if index then ({1} : Set Int) else {0}) := by
  sorry

end LRA.Order

                         

namespace LRA.Order

open LRA.Set

   
              

                                                                                        

                                              
  
def FailsBounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Bounded relation subset)

section IntegerUniverse

   
                             

                                                             

                                                                                         
  
theorem IntegerUniverseFailsBounded :
    FailsBounded (fun left right : Int => left ≤ right) (Set.univ : Set Int) := by
  sorry

end IntegerUniverse

   
                                       

                                                                             
                                                                      

                                                                                                            
  
def ComplementDestroysTwoSidedBoundedness
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [HasComplement SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Bounded relation subset /\
    Not (BoundedAbove relation subsetᶜ) /\
    Not (BoundedBelow relation subsetᶜ)

   
                                           

                                                                            
                                  

                                                                                              
  
theorem EveryBoundedRealSetHasUnboundedComplement
    (subset : Set Real)
    (subsetIsBounded :
      Bounded (fun left right : Real => left ≤ right) subset) :
    ComplementDestroysTwoSidedBoundedness
      (fun left right : Real => left ≤ right) subset := by
  sorry

end LRA.Order

                              

namespace LRA.Order

   
                   

                                                                                   

                                                   
  
def FailsBoundedAbove
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (BoundedAbove relation subset)

section IntegerUniverse

   
                                  

                                                                   

                                                                                              
  
theorem IntegerUniverseFailsBoundedAbove :
    FailsBoundedAbove (fun left right : Int => left ≤ right) (Set.univ : Set Int) := by
  sorry

end IntegerUniverse

end LRA.Order

                              

namespace LRA.Order

   
                   

                                                                                   

                                                   
  
def FailsBoundedBelow
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (BoundedBelow relation subset)

section IntegerUniverse

   
                                  

                                                                   

                                                                                              
  
theorem IntegerUniverseFailsBoundedBelow :
    FailsBoundedBelow (fun left right : Int => left ≤ right) (Set.univ : Set Int) := by
  sorry

end IntegerUniverse

end LRA.Order

                                 

namespace LRA.Order

   
                      

                                                                             

                                                                
  
def FailsGreatestElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (GreatestElement relation subset candidate)

section RealOpenUnitInterval

   
                                           

                                                                            

                                                                                             
  
theorem OneFailsGreatestElementOfOpenUnitInterval :
    FailsGreatestElement
      (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1 := by
  sorry

end RealOpenUnitInterval

end LRA.Order

                                            

namespace LRA.Order

   
                                 

                                                                                        

                                                                    
  
def FailsGreatestLowerBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (GreatestLowerBoundProperty SetObject relation)

section RationalOrder

   
                                              

                                                                

                                                                                                 
  
theorem RationalOrderFailsGreatestLowerBoundProperty :
    FailsGreatestLowerBoundProperty (Set Rat)
      (fun left right : Rat => left ≤ right) := by
  sorry

end RationalOrder

end LRA.Order

                         

namespace LRA.Order

   
              

                                                                                                 

                                                                                
  
def FailsInfimum
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Exists fun candidate => Infimum relation subset candidate)

section IntegerEmptySet

   
                             

                                                                                   

                                                                                  
  
theorem EmptyIntegerSetFailsInfimum :
    FailsInfimum (fun left right : Int => left ≤ right) (∅ : Set Int) := by
  sorry

end IntegerEmptySet

   
                                                                           
                                           

                                                                                                 
  
def ComplementInfimumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (complement : SetObject -> SetObject) (subset : SetObject) : Prop :=
  (exists infimum, Infimum relation subset infimum) /\
    Not (exists infimum, Infimum relation (complement subset) infimum)

   
                                                                           
                                                                            
                                              

                                                                              
  
theorem IntegerSingletonComplementHasNoInfimum :
    ComplementInfimumFormulaFails
      (fun left right : Int => left ≤ right) Set.compl ({0} : Set Int) := by
  sorry

   
                                                                          
                                                            

                                                                                                                                
  
def DifferenceInfimumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [SDiff SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (left removed : SetObject) : Prop :=
  (exists infimum, Infimum relation left infimum) /\
    (exists infimum, Infimum relation removed infimum) /\
      Not (exists infimum, Infimum relation (left \ removed) infimum)

   
                                                                              
                                                                   

                                                                                  
  
theorem IntegerSingletonDifferenceHasNoInfimum :
    DifferenceInfimumFormulaFails
      (fun left right : Int => left ≤ right)
      ({0} : Set Int) ({0} : Set Int) := by
  sorry

end LRA.Order

                              

namespace LRA.Order

   
                   

                                                                          

                                                             
  
def FailsLeastElement
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (LeastElement relation subset candidate)

section RealOpenUnitInterval

   
                                         

                                                                          

                                                                                          
  
theorem ZeroFailsLeastElementOfOpenUnitInterval :
    FailsLeastElement
      (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0 := by
  sorry

end RealOpenUnitInterval

end LRA.Order

                                         

namespace LRA.Order

   
                              

                                                                                         

                                                                 
  
def FailsLeastUpperBoundProperty
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (LeastUpperBoundProperty SetObject relation)

section RationalOrder

   
                                           

                                                             

                                                                                              
  
theorem RationalOrderFailsLeastUpperBoundProperty :
    FailsLeastUpperBoundProperty (Set Rat)
      (fun left right : Rat => left ≤ right) := by
  sorry

end RationalOrder

end LRA.Order

                            

namespace LRA.Order

   
                 

                                                                               

                                                           
  
def FailsLowerBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (LowerBound relation subset candidate)

section RealOpenUnitInterval

   
                                      

                                                                

                                                                                        
  
theorem OneFailsLowerBoundOfOpenUnitInterval :
    FailsLowerBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 1 := by
  sorry

end RealOpenUnitInterval

end LRA.Order

                                

namespace LRA.Order

   
                                

                                                                             
                                          

                                                                                                                          
  
def MaximalityFailsToImplyGreatest
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation nonStrictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  MaximalElement strictRelation subset candidate /\
    Not (GreatestElement nonStrictRelation subset candidate)

   
                                                         

                                                                           
                        

                                                                           
                   
  
theorem BooleanAntichainHasDistinctMaximalElementsButNoGreatest :
    MaximalityFailsToImplyGreatest
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) false /\
      MaximalityFailsToImplyGreatest
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) true /\
      false ≠ true := by
  sorry

end LRA.Order

                                

namespace LRA.Order

   
                             

                                                                              
                                      

                                                                                                                       
  
def MinimalityFailsToImplyLeast
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (strictRelation nonStrictRelation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  MinimalElement strictRelation subset candidate /\
    Not (LeastElement nonStrictRelation subset candidate)

   
                                                      

                                                                           
                     

                                                                            
               
  
theorem BooleanAntichainHasDistinctMinimalElementsButNoLeast :
    MinimalityFailsToImplyLeast
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) false /\
      MinimalityFailsToImplyLeast
        (StrictPart (fun left right : Bool => left = right))
        (fun left right : Bool => left = right)
        (Set.univ : Set Bool) true /\
      false ≠ true := by
  sorry

end LRA.Order

                          

namespace LRA.Order

   
                         

                                                                            

                                                                                                                                           
  
def FailsSupremumUniqueness
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  exists first second,
    first ≠ second /\
      Supremum relation subset first /\
        Supremum relation subset second

   
                                  

                                                                             
                                                               

                                                                                                                           
  
theorem SupremaNeedNotBeUniqueInPreorder :
    Preorder (fun _ _ : Bool => True) /\
      FailsSupremumUniqueness
        (fun _ _ : Bool => True) (Set.univ : Set Bool) := by
  sorry

   
                                                                            
                                           

                                                                                                   
  
def ComplementSupremumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (complement : SetObject -> SetObject) (subset : SetObject) : Prop :=
  (exists supremum, Supremum relation subset supremum) /\
    Not (exists supremum, Supremum relation (complement subset) supremum)

   
                                                                            
                                                                              
                                               

                                                                               
  
theorem IntegerSingletonComplementHasNoSupremum :
    ComplementSupremumFormulaFails
      (fun left right : Int => left ≤ right) Set.compl ({0} : Set Int) := by
  sorry

   
                                                                           
                                                             

                                                                                                                                   
  
def DifferenceSupremumFormulaFails
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [SDiff SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (left removed : SetObject) : Prop :=
  (exists supremum, Supremum relation left supremum) /\
    (exists supremum, Supremum relation removed supremum) /\
      Not (exists supremum, Supremum relation (left \ removed) supremum)

   
                                                                                
                                                                   

                                                                                   
  
theorem IntegerSingletonDifferenceHasNoSupremum :
    DifferenceSupremumFormulaFails
      (fun left right : Int => left ≤ right)
      ({0} : Set Int) ({0} : Set Int) := by
  sorry

end LRA.Order

                            

namespace LRA.Order

   
                 

                                                                                

                                                           
  
def FailsUpperBound
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) (candidate : Element) : Prop :=
  Not (UpperBound relation subset candidate)

section RealOpenUnitInterval

   
                                       

                                                                  

                                                                                        
  
theorem ZeroFailsUpperBoundOfOpenUnitInterval :
    FailsUpperBound (fun left right : Real => left ≤ right) (Set.Ioo 0 1) 0 := by
  sorry

end RealOpenUnitInterval

end LRA.Order

                                     

namespace LRA.Order

   
                           

                                                            

                                                                                      
  
def ProductOrderFailsTotality
    {Left : Type u} {Right : Type v}
    (leftRelation : LRA.Relation.Endorelation Left)
    (rightRelation : LRA.Relation.Endorelation Right) : Prop :=
  Not (LRA.Relation.Total
    (ProductRelation leftRelation rightRelation))

   
                                      

                                                                                

                                                                                                                        
  
theorem ProductOfLinearOrdersNeedNotBeLinear :
    ProductOrderFailsTotality
      (fun left right : Nat => left ≤ right)
      (fun left right : Nat => left ≤ right) := by
  sorry

end LRA.Order

                                   

namespace LRA.Order

   
                       

                                                        

                                                
  
def FailsDenseLinearOrder
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (DenseLinearOrder relation)

   
                                         

                                                            

                                                                             
  
theorem IntegerStrictOrderIsNotDenseLinearOrder :
    FailsDenseLinearOrder (fun left right : Int => left < right) := by
  sorry

end LRA.Order

                             

namespace LRA.Order

   
                                   

                                                                           
                    

                                                                              
  
def ReflexivityMakesRawDensityVacuous
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  LRA.Relation.Reflexive relation -> LRA.Relation.Dense relation

   
                             

                                                                          
                                                 

                                                           
  
theorem ReflexiveRelationIsRawDense
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha} :
    ReflexivityMakesRawDensityVacuous relation := by
  sorry

end LRA.Order

                             

namespace LRA.Order

   
            

                                                                    
                      

                                            
  
def FailsChain
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Not (Chain relation subset)

section NaturalDivisibility

   
                                  

                                                                               
                      

                                                                         
  
theorem TwoAndThreeFailDivisibilityChain :
    FailsChain (fun left right : Nat => left ∣ right)
      ({number | number = 2 \/ number = 3} : Set Nat) := by
  sorry

end NaturalDivisibility

end LRA.Order

                                

namespace LRA.Order

   
                               

                                                            

                                                                       
  
def DirectednessFailsToImplyChain
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Directed relation subset /\ Not (Chain relation subset)

   
                              

                                                                                

                                                                                                                               
  
def DirectednessFailsUnderSubset
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element)
    (ambient subset : SetObject) : Prop :=
  Directed relation ambient /\
    (forall element, element ∈ subset -> element ∈ ambient) /\
      Not (Directed relation subset)

   
                           

                                                                       

                                                                                               
  
theorem DirectedDoesNotImplyChain :
    let subset : Set Nat := {element | element = 2 \/ element = 3 \/ element = 6}
    DirectednessFailsToImplyChain
      (fun left right : Nat => left ∣ right) subset := by
  sorry

   
                                      

                                                                              

                                                                                                    
  
theorem SubsetOfDirectedSetNeedNotBeDirected :
    let relation := fun left right : Nat => left ∣ right
    let ambient : Set Nat := Set.univ
    let subset : Set Nat := {element | element = 2 \/ element = 3}
    DirectednessFailsUnderSubset relation ambient subset := by
  sorry

end LRA.Order

                                   

namespace LRA.Order

   
                      

                                                                             
                    

                                                         
  
def FailsCompleteLattice
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (CompleteLattice SetObject relation)

   
                                                           

                                                                        
                                                     

                                                                                                                                                                 
  
theorem IntegerLeastUpperBoundPropertyDoesNotImplyCompleteLattice :
    LeastUpperBoundProperty (Set Int) (fun left right : Int => left ≤ right) /\
      FailsCompleteLattice (Set Int)
        (fun left right : Int => left ≤ right) := by
  sorry

end LRA.Order

                                       

namespace LRA.Order

   
                          

                                                                            

                                                                      
  
def FailsDistributiveLattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Lattice relation /\ Not (DistributiveLattice relation)

   
            

                                                                          
                                       

                                                    
  
def M3Relation : LRA.Relation.Endorelation (Fin 5) :=
  fun left right =>
    left = right \/ left = 0 \/ right = 4

   
            

                                                                             
                               

                                                                             
  
def N5Relation : LRA.Relation.Endorelation (Fin 5) :=
  fun left right =>
    left = right \/ left = 0 \/ right = 4 \/ (left = 1 /\ right = 2)

   
                            

                                                                 

                                                    
  
theorem M3IsNondistributiveLattice :
    FailsDistributiveLattice M3Relation := by
  sorry

   
                            

                                                                  

                                                    
  
theorem N5IsNondistributiveLattice :
    FailsDistributiveLattice N5Relation := by
  sorry

end LRA.Order

                        

namespace LRA.Order

   
           

                                                                           

                                                         
  
def FailsJoin
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element)
    (left right candidate : Element) : Prop :=
  Not (Join relation left right candidate)

section NaturalNumbers

   
                           

                                                                        

                                                                       
  
theorem TwoFailsJoinOfTwoAndThree :
    FailsJoin (fun left right : Nat => left ≤ right) 2 3 2 := by
  sorry

end NaturalNumbers

end LRA.Order

                                   

namespace LRA.Order

   
                      

                                                      

                                               
  
def FailsJoinSemilattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (JoinSemilattice relation)

section BooleanAntichain

   
                                     

                                                                                

                                                                             
  
theorem BooleanEqualityFailsJoinSemilattice :
    FailsJoinSemilattice (fun left right : Bool => left = right) := by
  sorry

end BooleanAntichain

end LRA.Order

                           

namespace LRA.Order

   
              

                                             

                                       
  
def FailsLattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (Lattice relation)

section BooleanAntichain

   
                             

                                                                                  

                                                                     
  
theorem BooleanEqualityFailsLattice :
    FailsLattice (fun left right : Bool => left = right) := by
  sorry

end BooleanAntichain

end LRA.Order

                        

namespace LRA.Order

   
           

                                                                           

                                                         
  
def FailsMeet
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element)
    (left right candidate : Element) : Prop :=
  Not (Meet relation left right candidate)

section NaturalNumbers

   
                             

                                                                          

                                                                       
  
theorem ThreeFailsMeetOfTwoAndThree :
    FailsMeet (fun left right : Nat => left ≤ right) 2 3 3 := by
  sorry

end NaturalNumbers

end LRA.Order

                                   

namespace LRA.Order

   
                      

                                                      

                                               
  
def FailsMeetSemilattice
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (MeetSemilattice relation)

section BooleanAntichain

   
                                     

                                                                                

                                                                             
  
theorem BooleanEqualityFailsMeetSemilattice :
    FailsMeetSemilattice (fun left right : Bool => left = right) := by
  sorry

end BooleanAntichain

end LRA.Order

                                      

namespace LRA.Order

   
                                                                 
  

                                                         
def FailsLeftTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  Not (LeftTranslationPreservesRelation relation operation)

                                                          
def FailsRightTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  Not (RightTranslationPreservesRelation relation operation)

                                                                               
def NaturalSubtractionForOrderCompatibilityFailure :
    LRA.Operation.BinaryEndoOperation Nat :=
  fun left right => left - right

   
                                                                             

                                                                            
  
theorem NaturalSubtractionFailsLeftTranslationPreservesLessEqual :
    FailsLeftTranslationPreservesRelation
      (fun left right : Nat => left <= right)
      NaturalSubtractionForOrderCompatibilityFailure := by
  sorry

end LRA.Order

                             

namespace LRA.Order

   
               

                                                          

                                                                 
  
def FailsAntitone
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (map : Source -> Target) : Prop :=
  Not (Antitone sourceRelation targetRelation map)

section NaturalNumbers

   
                              

                                                               

                                                                                                               
  
theorem NaturalIdentityFailsAntitone :
    FailsAntitone
      (fun left right : Nat => left ≤ right)
      (fun left right : Nat => left ≤ right)
      (fun value => value) := by
  sorry

end NaturalNumbers

end LRA.Order

                             

namespace LRA.Order

   
               

                                                           

                                                                 
  
def FailsMonotone
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (map : Source -> Target) : Prop :=
  Not (Monotone sourceRelation targetRelation map)

section Integers

   
                              

                                                                             

                                                                                                                                  
  
theorem IntegerNegationFailsMonotone :
    FailsMonotone
      (fun left right : Int => left ≤ right)
      (fun left right : Int => left ≤ right)
      (fun value => -value) := by
  sorry

end Integers

end LRA.Order

                                   

namespace LRA.Order

   
                     

                                                                       

                                                                       
  
def FailsOrderEmbedding
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (map : Source -> Target) : Prop :=
  Not (OrderEmbedding sourceRelation targetRelation map)

   
                      

                                                                          
       

                                            
  
def BooleanChainRelation : LRA.Relation.Endorelation Bool :=
  fun left right => left = false \/ right = true

   
                                             

                                                                         
                                                                             
                       

                                                                             
                                       
  
theorem MonotoneBijectionNeedNotHaveMonotoneInverse :
    Function.Bijective (fun value : Bool => value) /\
      Monotone (fun left right : Bool => left = right)
        BooleanChainRelation (fun value => value) /\
      Not (Monotone BooleanChainRelation
        (fun left right : Bool => left = right) (fun value => value)) /\
      FailsOrderEmbedding
        (fun left right : Bool => left = right)
        BooleanChainRelation (fun value => value) := by
  sorry

end LRA.Order

                                     

namespace LRA.Order

   
                       

                                                                        

                                                                                     
  
def FailsOrderIsomorphism
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (forward : Source -> Target) (inverse : Target -> Source) : Prop :=
  Not (OrderIsomorphism sourceRelation targetRelation forward inverse)

section Booleans

   
                                         

                                                                                   

                                                                                                  
  
theorem BooleanConstantMapsFailOrderIsomorphism :
    FailsOrderIsomorphism
      (fun left right : Bool => left = false \/ right = true)
      (fun left right : Bool => left = false \/ right = true)
      (fun _ => false) (fun _ => false) := by
  sorry

end Booleans

end LRA.Order

                                  

namespace LRA.Order.OrderedSets.LinearOrder

   
               

                                                                         

                                                  
  
def FailsTotality
    {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier) : Prop :=
  Not (LRA.Relation.Total relation)

   
                                          

                                                                          

                                                                            
  
theorem BooleanEqualityPartialOrderFailsTotality :
    FailsTotality
      LRA.Order.OrderedSets.PartialOrder.BooleanEqualityNonStrictPartialOrder.relation := by
  sorry

   
                                     

                                                                          
                             

                                                                     
  
theorem NaturalDivisibilityIsNotLinearOrder :
    FailsTotality (fun left right : Nat => left ∣ right) := by
  sorry

end LRA.Order.OrderedSets.LinearOrder

                               

namespace LRA.Order.OrderedSets.Preorder

   
               

                                                              

             

       
                                 
   
  
def FailsPreorder
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Order.Preorder relation)

   
                                    

                                                                                  

                                                                                          
  
def StrictPartConstructionsFailToAgree
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Prop :=
  LRA.Order.StrictPart preorder.relation ≠
    StrictPartByNotConverse preorder

   
                                   

                                                                             
                                       

                                                
  
def ImmediateSuccessorOrEqualRelation :
    LRA.Relation.Endorelation Nat :=
  fun left right => left = right \/ right = left + 1

   
                                        

                                                                            
                                         

                                                        
                                                        
  
theorem ImmediateSuccessorOrEqualFailsPreorder :
    LRA.Relation.Reflexive ImmediateSuccessorOrEqualRelation /\
      Not (LRA.Relation.Transitive
        ImmediateSuccessorOrEqualRelation) /\
      FailsPreorder ImmediateSuccessorOrEqualRelation := by
  sorry

   
                             

                                                                          
                       

                                                        
                                                             
  
theorem NatStrictOrderFailsPreorder :
    LRA.Relation.Transitive (fun left right : Nat => left < right) /\
      Not (LRA.Relation.Reflexive
        (fun left right : Nat => left < right)) /\
      FailsPreorder (fun left right : Nat => left < right) := by
  sorry

   
                                                  

                                                                            
                                                                             
         

                                                                            
  
theorem StrictPartConstructionsDifferOnUniversalPreorder :
    StrictPartConstructionsFailToAgree BooleanUniversalPreorder := by
  sorry

end LRA.Order.OrderedSets.Preorder

                                   

namespace LRA.Order.OrderedSets.PartialOrder

   
                            

                                                                              

             

       
                                     
   
  
def FailsNonStrictPartialOrder
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Order.PartialOrder relation)

   
                   

                                             

             

       
                                      
   
  
def FailsTransitivity
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Relation.Transitive relation)

   
                                            

                                                                                      
                       

             

       
                                                   
   
  
theorem ImmediateSuccessorOrEqualFailsTransitivity :
    LRA.Relation.Reflexive
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      LRA.Relation.Antisymmetric
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      FailsTransitivity
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      FailsNonStrictPartialOrder
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation := by
  sorry

   
                                          

                                                                                       
                            

             

       
                                                                 
   
  
theorem NatStrictOrderFailsNonStrictPartialOrder :
    Not (LRA.Relation.Reflexive
        (fun left right : Nat => left < right)) /\
      LRA.Relation.Antisymmetric
        (fun left right : Nat => left < right) /\
      LRA.Relation.Transitive
        (fun left right : Nat => left < right) /\
      FailsNonStrictPartialOrder (fun left right : Nat => left < right) := by
  sorry

   
                                                    

                                                                                        
                        

             

       
                                                   
   
  
theorem BooleanUniversalRelationFailsNonStrictPartialOrder :
    LRA.Relation.Reflexive (fun _ _ : Bool => True) /\
      Not (LRA.Relation.Antisymmetric
        (fun _ _ : Bool => True)) /\
      LRA.Relation.Transitive (fun _ _ : Bool => True) /\
      FailsNonStrictPartialOrder (fun _ _ : Bool => True) := by
  sorry

   
                                                 

                                                                              
                                            

                                                                                                                                              
  
theorem IntegerDivisibilityIsPreorderButNotPartialOrder :
    LRA.Order.Preorder (fun left right : Int => left ∣ right) /\
      FailsNonStrictPartialOrder
        (fun left right : Int => left ∣ right) := by
  sorry

end LRA.Order.OrderedSets.PartialOrder

                            

namespace LRA.Order.OrderedSets.Poset

   
                

                                                                        
                     

             

       
                                     
   
  
def FailsPosetLaws {alpha : Type u}
    (relation : LRA.Relation.Endorelation alpha) : Prop :=
  Not (LRA.Order.PartialOrder relation)

   
                              

                                                                                        
              

             

       
                                                     
   
  
theorem NatStrictOrderFailsPosetLaws :
    FailsPosetLaws (fun left right : Nat => left < right) := by
  sorry

end LRA.Order.OrderedSets.Poset

                                        

namespace LRA.Order

   
                        

                                                         

                                                 
  
def FailsStrictLinearOrder
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (StrictLinearOrder relation)

section Booleans

   
                                       

                                                                        

                                                                               
  
theorem BooleanEqualityFailsStrictLinearOrder :
    FailsStrictLinearOrder (fun left right : Bool => left = right) := by
  sorry

end Booleans

end LRA.Order

                                  

namespace LRA.Order.OrderedSets.StrictOrder

   
                  

                                                                  

             

       
                                    
   
  
def FailsStrictOrder
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Order.StrictOrder relation)

   
                                   

                                                                                       
                      

             

       
                                                        
   
  
theorem NatNonStrictOrderFailsStrictOrder :
    LRA.Relation.Transitive (fun left right : Nat => left <= right) /\
      Not (LRA.Relation.Irreflexive
        (fun left right : Nat => left <= right)) /\
      FailsStrictOrder (fun left right : Nat => left <= right) := by
  sorry

   
                            

                                                                        
                                         

                                 
  
def ImmediateSuccessorRelation : LRA.Relation.Endorelation Nat :=
  fun left right => right = left + 1

   
                                    

                                                                              
                                                    

                                                          
                                                    
  
theorem ImmediateSuccessorFailsStrictOrder :
    LRA.Relation.Irreflexive ImmediateSuccessorRelation /\
      Not (LRA.Relation.Transitive ImmediateSuccessorRelation) /\
      FailsStrictOrder ImmediateSuccessorRelation := by
  sorry

end LRA.Order.OrderedSets.StrictOrder

                                

namespace LRA.Order

   
                

                                                                               

                                                   
  
def FailsWellOrder
    {Element : Type u} (SetObject : Type v)
    [Membership Element SetObject]
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (WellOrder SetObject relation)

   
                           

                                                                    

                                                                                
  
theorem IntegersAreNotWellOrdered :
    FailsWellOrder (Set Int) (fun left right : Int => left ≤ right) := by
  sorry

end LRA.Order
