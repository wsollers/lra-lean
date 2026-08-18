import LRA.Function.Operations.Inverse.Definition
import LRA.Function.Calculus.Classes.Definition

namespace LRA.Function

universe u v

/-- A bijective function has a two-sided inverse.

Stated as existence rather than as a construction: building the inverse arrow
would require a choice principle, and no evaluation in this subject is routed
through `Classical.choose`. -/
theorem BijectiveHasTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (bijective : Bijective function) :
    ∃ inverse : LRA.Function Codomain Domain,
      TwoSidedInverse function inverse := by
  sorry

/-- A function with a two-sided inverse is bijective. -/
theorem TwoSidedInverseGivesBijective
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (twoSided : TwoSidedInverse function inverse) :
    Bijective function := by
  sorry

/-- A two-sided inverse is unique. -/
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

/-- A left inverse is a left inverse on every class of inputs. -/
theorem LeftInverseGivesLeftInverseOn
    (leftInverse : LeftInverse function inverse) (source : SetClass Domain) :
    LeftInverseOn function inverse source := by
  sorry

/-- A right inverse is a right inverse on every class of outputs. -/
theorem RightInverseGivesRightInverseOn
    (rightInverse : RightInverse function inverse) (target : SetClass Codomain) :
    RightInverseOn function inverse target := by
  sorry

/-- A two-sided inverse is a two-sided inverse on every displayed pair of classes. -/
theorem TwoSidedInverseGivesTwoSidedInverseOn
    (twoSided : TwoSidedInverse function inverse)
    (source : SetClass Domain) (target : SetClass Codomain) :
    TwoSidedInverseOn function inverse source target := by
  sorry

/-- A left inverse on a source class is a right inverse on that class's image. -/
theorem RightInverseOnImageOfLeftInverseOn
    (source : SetClass Domain)
    (leftInverse : LeftInverseOn function inverse source) :
    RightInverseOn function inverse (ImageClass function source) := by
  sorry

/-- A left inverse on a source class is a two-sided inverse on that class and
its image. -/
theorem TwoSidedInverseOnImageOfLeftInverseOn
    (source : SetClass Domain)
    (leftInverse : LeftInverseOn function inverse source) :
    TwoSidedInverseOn function inverse source (ImageClass function source) := by
  sorry

/-- The preimage under a function is the image under its inverse. -/
theorem PreimageClassEqualsImageClassOfInverse
    (twoSided : TwoSidedInverse function inverse) (target : SetClass Codomain) :
    PreimageClass function target = ImageClass inverse target := by
  sorry

end SubsetRelativeInverses

section OneSidedConsequences

variable {Domain : Type u} {Codomain : Type v}
variable {function : LRA.Function Domain Codomain}
variable {inverse : LRA.Function Codomain Domain}

/-- A function with a left inverse is injective. -/
theorem InjectiveOfLeftInverse
    (leftInverse : LeftInverse function inverse) : Injective function := by
  sorry

/-- A function with a right inverse is surjective. -/
theorem SurjectiveOfRightInverse
    (rightInverse : RightInverse function inverse) : Surjective function := by
  sorry

/-- The inverse in a two-sided inverse pair is itself bijective. -/
theorem TwoSidedInverseIsBijective
    (twoSided : TwoSidedInverse function inverse) : Bijective inverse := by
  sorry

end OneSidedConsequences

end LRA.Function
