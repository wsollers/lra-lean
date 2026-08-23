import LRA.Function.Calculus.Classes.Definition
import LRA.Function.Properties.Definition
import LRA.Relation.Structures.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition
import LRA.Set.SetClass.Operations

namespace LRA.Function

universe u v w

                                                             
theorem EveryInputInDomainClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (input : Domain) :
    DomainClass function input := by
  sorry

                                                                                
theorem KernelRelationIsEquivalenceRelation
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    LRA.Relation.EquivalenceRelation (KernelRelation function) := by
  sorry

                                                                                
theorem InjectiveIffKernelIsIdentityRelation
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Injective function ↔
      KernelRelation function = LRA.Relation.IdentityRelation Domain := by
  sorry

   
                                                   

                                                                          
                                                                       
                                                                            
                                                                     

                                                                        
                                                                            
                                                                 

                                                                      
                                                                       
                                                                          
                                                                           
  

section FunctionalPreimageLaws

open LRA.Set
variable {Domain : Type u} {Codomain : Type v}
variable (function : LRA.Function Domain Codomain)

                                                                          
                                                                               
                                           
theorem PreimageClassIntersection (left right : SetClass Codomain) :
    PreimageClass function (SetClass.Intersection left right) =
      SetClass.Intersection (PreimageClass function left)
        (PreimageClass function right) := by
  sorry

                                                                  
theorem PreimageClassDifference (left right : SetClass Codomain) :
    PreimageClass function (SetClass.Difference left right) =
      SetClass.Difference (PreimageClass function left)
        (PreimageClass function right) := by
  sorry

                                                                               
theorem PreimageClassComplement (target : SetClass Codomain) :
    PreimageClass function (SetClass.Complement target) =
      SetClass.Complement (PreimageClass function target) := by
  sorry

                                                                            
theorem PreimageClassSymmetricDifference (left right : SetClass Codomain) :
    PreimageClass function
        (SetClass.Union (SetClass.Difference left right)
          (SetClass.Difference right left)) =
      SetClass.Union
        (SetClass.Difference (PreimageClass function left)
          (PreimageClass function right))
        (SetClass.Difference (PreimageClass function right)
          (PreimageClass function left)) := by
  sorry

                                                                                   
theorem PreimageClassDifferenceUnion (left middle right : SetClass Codomain) :
    PreimageClass function
        (SetClass.Difference left (SetClass.Union middle right)) =
      SetClass.Difference (PreimageClass function left)
        (SetClass.Union (PreimageClass function middle)
          (PreimageClass function right)) := by
  sorry

                                                                    
theorem PreimageClassUniversal :
    PreimageClass function (SetClass.Universal : SetClass Codomain) =
      (SetClass.Universal : SetClass Domain) := by
  sorry

                                                                            
theorem PreimageClassIndexedIntersection {Index : Type w}
    (family : Index → SetClass Codomain) :
    PreimageClass function (fun output => ∀ index, family index output) =
      (fun input => ∀ index, PreimageClass function (family index) input) := by
  sorry

                                                                              
theorem PreimageClassCountableIntersection (family : Nat → SetClass Codomain) :
    PreimageClass function (fun output => ∀ index, family index output) =
      (fun input => ∀ index, PreimageClass function (family index) input) := by
  sorry

end FunctionalPreimageLaws

section ImagePreimageAdjunction

open LRA.Set
variable {Domain : Type u} {Codomain : Type v}
variable (function : LRA.Function Domain Codomain)

                                                              
theorem ImagePreimageAdjunction
    (source : SetClass Domain) (target : SetClass Codomain) :
    SetClass.Included source (PreimageClass function target) ↔
      SetClass.Included (ImageClass function source) target := by
  sorry

                                                                   
                           
theorem ImageOfPreimageClassIncluded (target : SetClass Codomain) :
    SetClass.Included
      (ImageClass function (PreimageClass function target)) target := by
  sorry

                                                                       
                  
theorem SourceIncludedInPreimageOfImageClass (source : SetClass Domain) :
    SetClass.Included source
      (PreimageClass function (ImageClass function source)) := by
  sorry

                                                                
theorem ImageOfPreimageClassEqualsMeetWithRange (target : SetClass Codomain) :
    ImageClass function (PreimageClass function target) =
      SetClass.Intersection target (RangeClass function) := by
  sorry

                                                                                 
theorem ImageOfPreimageClassOfIncludedInRange (target : SetClass Codomain)
    (insideRange : SetClass.Included target (RangeClass function)) :
    ImageClass function (PreimageClass function target) = target := by
  sorry

                                                                             
                              
theorem MapsIntoClassIffImageIncluded
    (source : SetClass Domain) (target : SetClass Codomain) :
    MapsIntoClass function source target ↔
      SetClass.Included (ImageClass function source) target := by
  sorry

                                                                              
                                
theorem MapsIntoClassIffIncludedInPreimage
    (source : SetClass Domain) (target : SetClass Codomain) :
    MapsIntoClass function source target ↔
      SetClass.Included source (PreimageClass function target) := by
  sorry

end ImagePreimageAdjunction

section InjectiveAndSurjectiveLaws

open LRA.Set
variable {Domain : Type u} {Codomain : Type v}
variable (function : LRA.Function Domain Codomain)

                                                                       
theorem ImageClassIntersectionOfInjective
    (injective : Injective function) (left right : SetClass Domain) :
    ImageClass function (SetClass.Intersection left right) =
      SetClass.Intersection (ImageClass function left)
        (ImageClass function right) := by
  sorry

                                                                     
theorem ImageClassDifferenceOfInjective
    (injective : Injective function) (left right : SetClass Domain) :
    ImageClass function (SetClass.Difference left right) =
      SetClass.Difference (ImageClass function left)
        (ImageClass function right) := by
  sorry

                                                                            
                                                                              
                                                                          
                                                                         

             

       
                                                                                  
                                                                         
                                                                    
                                                                        
   
  
theorem ImageClassIndexedIntersectionOfInjective {Index : Type w} [Nonempty Index]
    (injective : Injective function) (family : Index → SetClass Domain) :
    ImageClass function (fun input => ∀ index, family index input) =
      (fun output => ∀ index, ImageClass function (family index) output) := by
  sorry

                                                                                 
theorem ImageClassCountableIntersectionOfInjective
    (injective : Injective function) (family : Nat → SetClass Domain) :
    ImageClass function (fun input => ∀ index, family index input) =
      (fun output => ∀ index, ImageClass function (family index) output) := by
  sorry

                                                                                
theorem ImageClassWitnessUniqueOfInjective
    (injective : Injective function) (source : SetClass Domain)
    (output : Codomain) (firstInput secondInput : Domain)
    (firstWitness : source firstInput ∧ function firstInput = output)
    (secondWitness : source secondInput ∧ function secondInput = output) :
    firstInput = secondInput := by
  sorry

                                                                                   
theorem PreimageOfImageClassOfInjective
    (injective : Injective function) (source : SetClass Domain) :
    PreimageClass function (ImageClass function source) = source := by
  sorry

                                                                                   
theorem ImageOfPreimageClassOfSurjective
    (surjective : Surjective function) (target : SetClass Codomain) :
    ImageClass function (PreimageClass function target) = target := by
  sorry

                                                                        
              
theorem SurjectiveOfImageClassCoversCodomain
    (covers : ∀ output : Codomain,
      ImageClass function (SetClass.Universal : SetClass Domain) output) :
    Surjective function := by
  sorry

end InjectiveAndSurjectiveLaws

section KernelLaws

open LRA.Set
variable {Domain : Type u} {Codomain : Type v}
variable (function : LRA.Function Domain Codomain)

                                                                              
theorem FiberClassOverValueIffKernelRelated
    (representative input : Domain) :
    FiberClass function (function representative) input ↔
      KernelRelation function input representative := by
  sorry

                                                
theorem FiberClassSaturatedBy (output : Codomain) :
    SaturatedBy (FiberClass function output) function := by
  sorry

                                                                               

                                                                     
                                                                      
                  
theorem FiberClassEqualsKernelEquivalenceClass
    (representative : Domain) :
    FiberClass function (function representative) =
      (fun input => KernelRelation function input representative) := by
  sorry

                                              
def KernelClassMapsTo
    (classOfInputs : SetClass Domain) (output : Codomain) : Prop :=
  ∀ input, classOfInputs input → function input = output

                                                            
theorem KernelClassMapsToRepresentativeValue
    (representative : Domain) :
    KernelClassMapsTo function
      (FiberClass function (function representative)) (function representative) := by
  sorry

                                                   
theorem KernelClassMapsToOutputUnique
    (classOfInputs : SetClass Domain) (firstOutput secondOutput : Codomain)
    (inhabited : ∃ input, classOfInputs input)
    (firstMapsTo : KernelClassMapsTo function classOfInputs firstOutput)
    (secondMapsTo : KernelClassMapsTo function classOfInputs secondOutput) :
    firstOutput = secondOutput := by
  sorry

                                                             
theorem KernelClassMapsToExistsOfRangeMember
    (output : Codomain) (inRange : RangeClass function output) :
    ∃ classOfInputs : SetClass Domain,
      (∃ input, classOfInputs input) ∧
        KernelClassMapsTo function classOfInputs output := by
  sorry

                                                                 
theorem KernelQuotientProjectionWellDefined
    (leftInput rightInput : Domain)
    (kernelRelated : KernelRelation function leftInput rightInput) :
    function leftInput = function rightInput := by
  sorry

end KernelLaws

end LRA.Function
