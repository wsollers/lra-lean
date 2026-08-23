import LRA.Function.Operations.Inverse.Definition
import LRA.Function.Calculus.Classes.Definition

namespace LRA.Function

universe u v

                                                 

                                                                             
                                                                             
                              
theorem BijectiveHasTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (bijective : Bijective function) :
    ∃ inverse : LRA.Function Codomain Domain,
      TwoSidedInverse function inverse := by
  sorry

                                                        
theorem TwoSidedInverseGivesBijective
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (twoSided : TwoSidedInverse function inverse) :
    Bijective function := by
  sorry

                                     
theorem TwoSidedInverseUnique
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (first second : LRA.Function Codomain Domain)
    (firstIsInverse : TwoSidedInverse function first)
    (secondIsInverse : TwoSidedInverse function second) :
    ∀ output, first output = second output := by
  sorry

section SubsetRelativeInverses

open LRA.Set
variable {Domain : Type u} {Codomain : Type v}
variable (function : LRA.Function Domain Codomain)
variable (inverse : LRA.Function Codomain Domain)

                                                                 
theorem LeftInverseGivesLeftInverseOn
    (leftInverse : LeftInverse function inverse) (source : SetClass Domain) :
    LeftInverseOn function inverse source := by
  sorry

                                                                    
theorem RightInverseGivesRightInverseOn
    (rightInverse : RightInverse function inverse) (target : SetClass Codomain) :
    RightInverseOn function inverse target := by
  sorry

                                                                                     
theorem TwoSidedInverseGivesTwoSidedInverseOn
    (twoSided : TwoSidedInverse function inverse)
    (source : SetClass Domain) (target : SetClass Codomain) :
    TwoSidedInverseOn function inverse source target := by
  sorry

                                                                                 
theorem RightInverseOnImageOfLeftInverseOn
    (source : SetClass Domain)
    (leftInverse : LeftInverseOn function inverse source) :
    RightInverseOn function inverse (ImageClass function source) := by
  sorry

                                                                             
             
theorem TwoSidedInverseOnImageOfLeftInverseOn
    (source : SetClass Domain)
    (leftInverse : LeftInverseOn function inverse source) :
    TwoSidedInverseOn function inverse source (ImageClass function source) := by
  sorry

                                                                    
theorem PreimageClassEqualsImageClassOfInverse
    (twoSided : TwoSidedInverse function inverse) (target : SetClass Codomain) :
    PreimageClass function target = ImageClass inverse target := by
  sorry

end SubsetRelativeInverses

section OneSidedConsequences

variable {Domain : Type u} {Codomain : Type v}
variable {function : LRA.Function Domain Codomain}
variable {inverse : LRA.Function Codomain Domain}

                                                   
theorem InjectiveOfLeftInverse
    (leftInverse : LeftInverse function inverse) : Injective function := by
  sorry

                                                     
theorem SurjectiveOfRightInverse
    (rightInverse : RightInverse function inverse) : Surjective function := by
  sorry

                                                                   
theorem TwoSidedInverseIsBijective
    (twoSided : TwoSidedInverse function inverse) : Bijective inverse := by
  sorry

end OneSidedConsequences

end LRA.Function
