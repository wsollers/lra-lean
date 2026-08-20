import LRA.Function.Calculus.Classes.Definition
import LRA.Function.Properties.Definition
import LRA.Relation.Structures.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition
import LRA.Set.SetClass.Operations

namespace LRA.Function

universe u v w

/-- Every input belongs to the domain class of a function. -/
theorem EveryInputInDomainClass {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) (input : Domain) :
    DomainClass function input := by
  sorry

/-- The kernel relation induced by every function is an equivalence relation. -/
theorem KernelRelationIsEquivalenceRelation
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    LRA.Relation.EquivalenceRelation (KernelRelation function) := by
  sorry

/-- A function is injective exactly when its kernel is the identity relation. -/
theorem InjectiveIffKernelIsIdentityRelation
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Injective function ↔
      KernelRelation function = LRA.Relation.IdentityRelation Domain := by
  sorry

/-!
## The genuinely functional image and preimage laws

Each statement below mentions single-valuedness or totality, explicitly or
through a hypothesis implying it, so none of them holds of an arbitrary
relation. The laws that *do* hold of an arbitrary relation were relocated to
`LRA.Set.Interface.RelationLaws` by §7.1.2 and are not restated here.

Everything is stated through `Graph`: `ImageClass`, `PreimageClass`, and
`FiberClass` are the `LRA.Relation` calculus applied to `Graph function`, so
this subject specializes that calculus rather than redefining it.

Why preimage is the asymmetric case: `LRA.Set.Interface.PreimageOf` is
existential, so preimage commutes with union for any relation but needs
single-valuedness to commute with intersection, difference, complement, or
symmetric difference, and needs totality to return the whole ambient class.
-/

section FunctionalPreimageLaws

open LRA.Set
variable {Domain : Type u} {Codomain : Type v}
variable (function : LRA.Function Domain Codomain)

/-- Preimage commutes with intersection. Needs single-valuedness: a merely
existential preimage of an intersection is smaller than the intersection of the
preimages when one input has two values. -/
theorem PreimageClassIntersection (left right : SetClass Codomain) :
    PreimageClass function (SetClass.Intersection left right) =
      SetClass.Intersection (PreimageClass function left)
        (PreimageClass function right) := by
  sorry

/-- Preimage commutes with difference. Needs single-valuedness. -/
theorem PreimageClassDifference (left right : SetClass Codomain) :
    PreimageClass function (SetClass.Difference left right) =
      SetClass.Difference (PreimageClass function left)
        (PreimageClass function right) := by
  sorry

/-- Preimage commutes with complement. Needs single-valuedness and totality. -/
theorem PreimageClassComplement (target : SetClass Codomain) :
    PreimageClass function (SetClass.Complement target) =
      SetClass.Complement (PreimageClass function target) := by
  sorry

/-- Preimage commutes with symmetric difference. Needs single-valuedness. -/
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

/-- Preimage of a difference from a union, distributed. Needs single-valuedness. -/
theorem PreimageClassDifferenceUnion (left middle right : SetClass Codomain) :
    PreimageClass function
        (SetClass.Difference left (SetClass.Union middle right)) =
      SetClass.Difference (PreimageClass function left)
        (SetClass.Union (PreimageClass function middle)
          (PreimageClass function right)) := by
  sorry

/-- Preimage of the universal class is universal. Needs totality. -/
theorem PreimageClassUniversal :
    PreimageClass function (SetClass.Universal : SetClass Codomain) =
      (SetClass.Universal : SetClass Domain) := by
  sorry

/-- Preimage commutes with indexed intersection. Needs single-valuedness. -/
theorem PreimageClassIndexedIntersection {Index : Type w}
    (family : Index → SetClass Codomain) :
    PreimageClass function (fun output => ∀ index, family index output) =
      (fun input => ∀ index, PreimageClass function (family index) input) := by
  sorry

/-- Preimage commutes with countable intersection. Needs single-valuedness. -/
theorem PreimageClassCountableIntersection (family : Nat → SetClass Codomain) :
    PreimageClass function (fun output => ∀ index, family index output) =
      (fun input => ∀ index, PreimageClass function (family index) input) := by
  sorry

end FunctionalPreimageLaws

section ImagePreimageAdjunction

open LRA.Set
variable {Domain : Type u} {Codomain : Type v}
variable (function : LRA.Function Domain Codomain)

/-- The image–preimage adjunction. Needs single-valuedness. -/
theorem ImagePreimageAdjunction
    (source : SetClass Domain) (target : SetClass Codomain) :
    SetClass.Included source (PreimageClass function target) ↔
      SetClass.Included (ImageClass function source) target := by
  sorry

/-- The counit: the image of a preimage is contained in the target.
Needs single-valuedness. -/
theorem ImageOfPreimageClassIncluded (target : SetClass Codomain) :
    SetClass.Included
      (ImageClass function (PreimageClass function target)) target := by
  sorry

/-- The unit: a source class is contained in the preimage of its image.
Needs totality. -/
theorem SourceIncludedInPreimageOfImageClass (source : SetClass Domain) :
    SetClass.Included source
      (PreimageClass function (ImageClass function source)) := by
  sorry

/-- The image of a preimage is the target met with the range. -/
theorem ImageOfPreimageClassEqualsMeetWithRange (target : SetClass Codomain) :
    ImageClass function (PreimageClass function target) =
      SetClass.Intersection target (RangeClass function) := by
  sorry

/-- The image of a preimage recovers the target when it lies inside the range. -/
theorem ImageOfPreimageClassOfIncludedInRange (target : SetClass Codomain)
    (insideRange : SetClass.Included target (RangeClass function)) :
    ImageClass function (PreimageClass function target) = target := by
  sorry

/-- A function maps a source class into a target class exactly when the image
is contained in the target. -/
theorem MapsIntoClassIffImageIncluded
    (source : SetClass Domain) (target : SetClass Codomain) :
    MapsIntoClass function source target ↔
      SetClass.Included (ImageClass function source) target := by
  sorry

/-- A function maps a source class into a target class exactly when the source
is contained in the preimage. -/
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

/-- Image commutes with intersection when the function is injective. -/
theorem ImageClassIntersectionOfInjective
    (injective : Injective function) (left right : SetClass Domain) :
    ImageClass function (SetClass.Intersection left right) =
      SetClass.Intersection (ImageClass function left)
        (ImageClass function right) := by
  sorry

/-- Image commutes with difference when the function is injective. -/
theorem ImageClassDifferenceOfInjective
    (injective : Injective function) (left right : SetClass Domain) :
    ImageClass function (SetClass.Difference left right) =
      SetClass.Difference (ImageClass function left)
        (ImageClass function right) := by
  sorry

/-- Image commutes with indexed intersection when the function is injective. -/
theorem ImageClassIndexedIntersectionOfInjective {Index : Type w}
    (injective : Injective function) (family : Index → SetClass Domain) :
    ImageClass function (fun input => ∀ index, family index input) =
      (fun output => ∀ index, ImageClass function (family index) output) := by
  sorry

/-- Image commutes with countable intersection when the function is injective. -/
theorem ImageClassCountableIntersectionOfInjective
    (injective : Injective function) (family : Nat → SetClass Domain) :
    ImageClass function (fun input => ∀ index, family index input) =
      (fun output => ∀ index, ImageClass function (family index) output) := by
  sorry

/-- An injective function has at most one source witness for an image member. -/
theorem ImageClassWitnessUniqueOfInjective
    (injective : Injective function) (source : SetClass Domain)
    (output : Codomain) (firstInput secondInput : Domain)
    (firstWitness : source firstInput ∧ function firstInput = output)
    (secondWitness : source secondInput ∧ function secondInput = output) :
    firstInput = secondInput := by
  sorry

/-- The preimage of an image recovers the source when the function is injective. -/
theorem PreimageOfImageClassOfInjective
    (injective : Injective function) (source : SetClass Domain) :
    PreimageClass function (ImageClass function source) = source := by
  sorry

/-- The image of a preimage recovers the target when the function is surjective. -/
theorem ImageOfPreimageClassOfSurjective
    (surjective : Surjective function) (target : SetClass Codomain) :
    ImageClass function (PreimageClass function target) = target := by
  sorry

/-- A function whose image of the universal class covers the codomain is
surjective. -/
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

/-- The fiber over a value is exactly the kernel class of a representative. -/
theorem FiberClassOverValueIffKernelRelated
    (representative input : Domain) :
    FiberClass function (function representative) input ↔
      KernelRelation function input representative := by
  sorry

/-- Every fiber is saturated by the function. -/
theorem FiberClassSaturatedBy (output : Codomain) :
    SaturatedBy (FiberClass function output) function := by
  sorry

/-- The fiber over a value is the kernel equivalence class of a representative.

The ambient-set form of this statement was dropped when the `𝒰`-built
`AmbientFiber` went; stated here class-wise it needs no ambient and no
`HasUniversal`. -/
theorem FiberClassEqualsKernelEquivalenceClass
    (representative : Domain) :
    FiberClass function (function representative) =
      (fun input => KernelRelation function input representative) := by
  sorry

/-- A kernel class maps to a single output. -/
def KernelClassMapsTo
    (classOfInputs : SetClass Domain) (output : Codomain) : Prop :=
  ∀ input, classOfInputs input → function input = output

/-- A representative of a kernel class carries its value. -/
theorem KernelClassMapsToRepresentativeValue
    (representative : Domain) :
    KernelClassMapsTo function
      (FiberClass function (function representative)) (function representative) := by
  sorry

/-- The output a kernel class maps to is unique. -/
theorem KernelClassMapsToOutputUnique
    (classOfInputs : SetClass Domain) (firstOutput secondOutput : Codomain)
    (inhabited : ∃ input, classOfInputs input)
    (firstMapsTo : KernelClassMapsTo function classOfInputs firstOutput)
    (secondMapsTo : KernelClassMapsTo function classOfInputs secondOutput) :
    firstOutput = secondOutput := by
  sorry

/-- Every range member is the output of some kernel class. -/
theorem KernelClassMapsToExistsOfRangeMember
    (output : Codomain) (inRange : RangeClass function output) :
    ∃ classOfInputs : SetClass Domain,
      (∃ input, classOfInputs input) ∧
        KernelClassMapsTo function classOfInputs output := by
  sorry

/-- The projection out of the kernel quotient is well defined. -/
theorem KernelQuotientProjectionWellDefined
    (leftInput rightInput : Domain)
    (kernelRelated : KernelRelation function leftInput rightInput) :
    function leftInput = function rightInput := by
  sorry

end KernelLaws

end LRA.Function
