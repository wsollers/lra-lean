import LRA.Function.Operations.Composition.Definition
import LRA.Function.Canonical.Identity.Definition
import LRA.Function.Properties.Definition
import LRA.Function.Operations.Inverse.Definition

namespace LRA.Function

universe u v w x

                                                                   
theorem ComposeValue
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (outer : LRA.Function Middle Codomain)
    (inner : LRA.Function Domain Middle)
    (input : Domain) :
    Compose outer inner input = outer (inner input) := by
  sorry

                                                               
theorem ComposeLeftIdentity {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Compose (IdentityFunction Codomain) function = function := by
  sorry

                                                                
theorem ComposeRightIdentity {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Compose function (IdentityFunction Domain) = function := by
  sorry

                                               
theorem ComposeAssociative {Domain : Type u} {Middle : Type v}
    {Later : Type w} {Codomain : Type x}
    (outer : LRA.Function Later Codomain)
    (middle : LRA.Function Middle Later)
    (inner : LRA.Function Domain Middle) :
    Compose outer (Compose middle inner) = Compose (Compose outer middle) inner := by
  sorry

section CompositionProperties

variable {Domain : Type u} {Middle : Type v} {Codomain : Type w}
variable {outer : LRA.Function Middle Codomain}
variable {inner : LRA.Function Domain Middle}

                                                       
theorem ComposeInjective
    (outerInjective : Injective outer) (innerInjective : Injective inner) :
    Injective (Compose outer inner) := by
  sorry

                                                         
theorem ComposeSurjective
    (outerSurjective : Surjective outer) (innerSurjective : Surjective inner) :
    Surjective (Compose outer inner) := by
  sorry

                                                       
theorem ComposeBijective
    (outerBijective : Bijective outer) (innerBijective : Bijective inner) :
    Bijective (Compose outer inner) := by
  sorry

                                                                        
theorem ComposeInjectiveGivesInnerInjective
    (compositeInjective : Injective (Compose outer inner)) :
    Injective inner := by
  sorry

                                                                          
theorem ComposeSurjectiveGivesOuterSurjective
    (compositeSurjective : Surjective (Compose outer inner)) :
    Surjective outer := by
  sorry

end CompositionProperties

section CompositionInverses

variable {Domain : Type u} {Middle : Type v} {Codomain : Type w}
variable {outer : LRA.Function Middle Codomain}
variable {inner : LRA.Function Domain Middle}
variable {outerInverse : LRA.Function Codomain Middle}
variable {innerInverse : LRA.Function Middle Domain}

                                                    
theorem ComposeLeftInverse
    (outerLeftInverse : LeftInverse outer outerInverse)
    (innerLeftInverse : LeftInverse inner innerInverse) :
    LeftInverse (Compose outer inner) (Compose innerInverse outerInverse) := by
  sorry

                                                     
theorem ComposeRightInverse
    (outerRightInverse : RightInverse outer outerInverse)
    (innerRightInverse : RightInverse inner innerInverse) :
    RightInverse (Compose outer inner) (Compose innerInverse outerInverse) := by
  sorry

                                                         
theorem ComposeTwoSidedInverse
    (outerTwoSided : TwoSidedInverse outer outerInverse)
    (innerTwoSided : TwoSidedInverse inner innerInverse) :
    TwoSidedInverse (Compose outer inner) (Compose innerInverse outerInverse) := by
  sorry

end CompositionInverses

end LRA.Function
