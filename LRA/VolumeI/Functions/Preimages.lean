import LRA.VolumeI.Functions.Composition
import LRA.VolumeI.Functions.IdentityFunction
import LRA.VolumeI.Identity.Model.Theory
import LRA.VolumeI.Set.Interface.Membership

namespace LRA.Function

open LRA.Set

universe u v

/-!
Preimages of generic sets under functions.

`Preimage` separates from the *universal* set of the domain backend, so
everything below requires `HasUniversal` -- this file's vocabulary is
therefore available for `LRASet` (and any future Mathlib backend) but
structurally not for Enderton sets, exactly as the retired
`BooleanComprehensionSetOperations` record already demanded. For the
universal-free, every-backend variant over an explicit ambient set, see
`Fibers.lean`.

The theorems carry the membership-law certificates
(`MembershipLaws`, `SeparationLaws`, `UniversalMembershipLaws`,
`SymmDiffMembershipLaws`) as instance hypotheses -- the same strength the
old `BooleanComprehensionSetInterfaceLaws` record bundled, now resolved by
instance search. A side effect of the port: several statements that
previously omitted their laws record (and were unprovable as stated) now
carry the hypotheses they need.
-/

section Preimages

variable {DomainElement CodomainElement : Type u}
variable {DomainSet CodomainSet : Type v}
variable [Membership DomainElement DomainSet]
variable [Membership CodomainElement CodomainSet]

/-- A set `preimageSet` is the preimage of `target` under `map` when its
members are exactly the domain elements whose image lies in `target`.

Logical form:

```lean
def IsPreimageOf
    (preimageSet : DomainSet)
    (map : Function DomainElement CodomainElement)
    (target : CodomainSet) : Prop :=
  ∀ input : DomainElement, input ∈ preimageSet ↔ map input ∈ target
```
-/
def IsPreimageOf
    (preimageSet : DomainSet)
    (map : Function DomainElement CodomainElement)
    (target : CodomainSet) : Prop :=
  ∀ input : DomainElement, input ∈ preimageSet ↔ map input ∈ target

section WithSeparation

variable [HasSeparation DomainElement DomainSet] [HasUniversal DomainSet]

/-- Preimage of a generic set under a function: the members of the domain
universe whose image lands in `subset`.

Logical form:

```lean
def Preimage
    (map : Function DomainElement CodomainElement)
    (subset : CodomainSet) : DomainSet :=
  HasSeparation.separation (𝒰 : DomainSet)
    (fun input => map input ∈ subset)
```
-/
def Preimage
    (map : Function DomainElement CodomainElement)
    (subset : CodomainSet) : DomainSet :=
  HasSeparation.separation (𝒰 : DomainSet)
    (fun input => map input ∈ subset)

/-- Alias emphasizing inverse image notation.

Logical form:

```lean
def InverseImage
    (map : Function DomainElement CodomainElement)
    (subset : CodomainSet) : DomainSet :=
  Preimage map subset
```
-/
def InverseImage
    (map : Function DomainElement CodomainElement)
    (subset : CodomainSet) : DomainSet :=
  Preimage map subset

section Laws

variable [Union DomainSet] [Inter DomainSet] [SDiff DomainSet]
variable [EmptyCollection DomainSet] [HasSubset DomainSet]
variable [HasComplement DomainSet] [HasSymmDiff DomainSet]
variable [Union CodomainSet] [Inter CodomainSet] [SDiff CodomainSet]
variable [EmptyCollection CodomainSet] [HasSubset CodomainSet]
variable [HasComplement CodomainSet] [HasUniversal CodomainSet]
variable [HasSymmDiff CodomainSet]
variable [ExtensionalityLaw DomainElement DomainSet]
variable [MembershipLaws DomainElement DomainSet]
variable [MembershipLaws CodomainElement CodomainSet]
variable [SeparationLaws DomainElement DomainSet]
variable [UniversalMembershipLaws DomainElement DomainSet]
variable [UniversalMembershipLaws CodomainElement CodomainSet]
variable [SymmDiffMembershipLaws DomainElement DomainSet]
variable [SymmDiffMembershipLaws CodomainElement CodomainSet]

/-- For every target set, a preimage set exists.

Logical form:

```lean
theorem PreimageExists
    (map : Function DomainElement CodomainElement)
    (target : CodomainSet) :
    LRA.Identity.Exists
      (fun preimageSet : DomainSet =>
        IsPreimageOf preimageSet map target)
```
-/
theorem PreimageExists
    (map : Function DomainElement CodomainElement)
    (target : CodomainSet) :
    LRA.Identity.Exists
      (fun preimageSet : DomainSet =>
        IsPreimageOf preimageSet map target) := by
  sorry

/-- A preimage set is uniquely determined by its memberwise specification.

Logical form:

```lean
theorem PreimageUnique
    (map : Function DomainElement CodomainElement)
    (target : CodomainSet) :
    LRA.Identity.Unique
      (fun preimageSet : DomainSet =>
        IsPreimageOf preimageSet map target)
```
-/
theorem PreimageUnique
    (map : Function DomainElement CodomainElement)
    (target : CodomainSet) :
    LRA.Identity.Unique
      (fun preimageSet : DomainSet =>
        IsPreimageOf preimageSet map target) := by
  sorry

/-- For every target set, there is exactly one preimage set.

Logical form:

```lean
theorem PreimageExistsAndUnique
    (map : Function DomainElement CodomainElement)
    (target : CodomainSet) :
    LRA.Identity.ExistsAndUnique
      (fun preimageSet : DomainSet =>
        IsPreimageOf preimageSet map target)
```
-/
theorem PreimageExistsAndUnique
    (map : Function DomainElement CodomainElement)
    (target : CodomainSet) :
    LRA.Identity.ExistsAndUnique
      (fun preimageSet : DomainSet =>
        IsPreimageOf preimageSet map target) := by
  sorry

/-- The constructed preimage satisfies its defining membership
specification.

Logical form:

```lean
theorem PreimageMembershipIff
    (map : Function DomainElement CodomainElement)
    (target : CodomainSet)
    (input : DomainElement) :
    input ∈ (Preimage map target : DomainSet) ↔ map input ∈ target
```
-/
theorem PreimageMembershipIff
    (map : Function DomainElement CodomainElement)
    (target : CodomainSet)
    (input : DomainElement) :
    input ∈ (Preimage map target : DomainSet) ↔ map input ∈ target := by
  sorry

/-- The preimage of the whole codomain is the whole domain.

Logical form:

```lean
theorem PreimageUniversal
    (map : Function DomainElement CodomainElement) :
    (Preimage map (𝒰 : CodomainSet) : DomainSet) = (𝒰 : DomainSet)
```
-/
theorem PreimageUniversal
    (map : Function DomainElement CodomainElement) :
    (Preimage map (𝒰 : CodomainSet) : DomainSet) = (𝒰 : DomainSet) := by
  sorry

/-- The preimage of the empty set is empty.

Logical form:

```lean
theorem PreimageEmpty
    (map : Function DomainElement CodomainElement) :
    (Preimage map (∅ : CodomainSet) : DomainSet) = (∅ : DomainSet)
```
-/
theorem PreimageEmpty
    (map : Function DomainElement CodomainElement) :
    (Preimage map (∅ : CodomainSet) : DomainSet) = (∅ : DomainSet) := by
  sorry

/-- Preimage preserves binary union.

Logical form:

```lean
theorem PreimageUnion
    (map : Function DomainElement CodomainElement)
    (Left Right : CodomainSet) :
    (Preimage map (Left ∪ Right) : DomainSet) =
      Preimage map Left ∪ Preimage map Right
```
-/
theorem PreimageUnion
    (map : Function DomainElement CodomainElement)
    (Left Right : CodomainSet) :
    (Preimage map (Left ∪ Right) : DomainSet) =
      Preimage map Left ∪ Preimage map Right := by
  sorry

/-- Preimage preserves binary intersection.

Logical form:

```lean
theorem PreimageIntersection
    (map : Function DomainElement CodomainElement)
    (Left Right : CodomainSet) :
    (Preimage map (Left ∩ Right) : DomainSet) =
      Preimage map Left ∩ Preimage map Right
```
-/
theorem PreimageIntersection
    (map : Function DomainElement CodomainElement)
    (Left Right : CodomainSet) :
    (Preimage map (Left ∩ Right) : DomainSet) =
      Preimage map Left ∩ Preimage map Right := by
  sorry

/-- Preimage preserves set difference.

Logical form:

```lean
theorem PreimageDifference
    (map : Function DomainElement CodomainElement)
    (Left Right : CodomainSet) :
    (Preimage map (Left \ Right) : DomainSet) =
      Preimage map Left \ Preimage map Right
```
-/
theorem PreimageDifference
    (map : Function DomainElement CodomainElement)
    (Left Right : CodomainSet) :
    (Preimage map (Left \ Right) : DomainSet) =
      Preimage map Left \ Preimage map Right := by
  sorry

/-- Preimage preserves complement.

Logical form:

```lean
theorem PreimageComplement
    (map : Function DomainElement CodomainElement)
    (Target : CodomainSet) :
    (Preimage map Targetᶜ : DomainSet) = (Preimage map Target)ᶜ
```
-/
theorem PreimageComplement
    (map : Function DomainElement CodomainElement)
    (Target : CodomainSet) :
    (Preimage map Targetᶜ : DomainSet) = (Preimage map Target)ᶜ := by
  sorry

/-- Preimage preserves symmetric difference.

Logical form:

```lean
theorem PreimageSymmetricDifference
    (map : Function DomainElement CodomainElement)
    (Left Right : CodomainSet) :
    (Preimage map (Left ∆ Right) : DomainSet) =
      Preimage map Left ∆ Preimage map Right
```
-/
theorem PreimageSymmetricDifference
    (map : Function DomainElement CodomainElement)
    (Left Right : CodomainSet) :
    (Preimage map (Left ∆ Right) : DomainSet) =
      Preimage map Left ∆ Preimage map Right := by
  sorry

/-- A preimage is a subset of the domain universe.

Logical form:

```lean
theorem PreimageSubsetUniversal
    (map : Function DomainElement CodomainElement)
    (Target : CodomainSet) :
    (Preimage map Target : DomainSet) ⊆ (𝒰 : DomainSet)
```
-/
theorem PreimageSubsetUniversal
    (map : Function DomainElement CodomainElement)
    (Target : CodomainSet) :
    (Preimage map Target : DomainSet) ⊆ (𝒰 : DomainSet) := by
  sorry

/-- Preimage is monotone with respect to subset inclusion.

Logical form:

```lean
theorem PreimageMonotone
    (map : Function DomainElement CodomainElement)
    (Left Right : CodomainSet)
    (LeftSubsetRight : Left ⊆ Right) :
    (Preimage map Left : DomainSet) ⊆ Preimage map Right
```
-/
theorem PreimageMonotone
    (map : Function DomainElement CodomainElement)
    (Left Right : CodomainSet)
    (LeftSubsetRight : Left ⊆ Right) :
    (Preimage map Left : DomainSet) ⊆ Preimage map Right := by
  sorry

/-- Pointwise equal functions have equal preimages of every target set.

Logical form:

```lean
theorem PreimageCongrFunction
    (leftMap rightMap : Function DomainElement CodomainElement)
    (Target : CodomainSet)
    (sameValues : ∀ input, leftMap input = rightMap input) :
    (Preimage leftMap Target : DomainSet) = Preimage rightMap Target
```
-/
theorem PreimageCongrFunction
    (leftMap rightMap : Function DomainElement CodomainElement)
    (Target : CodomainSet)
    (sameValues : ∀ input, leftMap input = rightMap input) :
    (Preimage leftMap Target : DomainSet) = Preimage rightMap Target := by
  sorry

/-- Equal target sets have equal preimages.

Logical form:

```lean
theorem PreimageCongrSet
    (map : Function DomainElement CodomainElement)
    (Left Right : CodomainSet)
    (sameSet : Left = Right) :
    (Preimage map Left : DomainSet) = Preimage map Right
```
-/
theorem PreimageCongrSet
    (map : Function DomainElement CodomainElement)
    (Left Right : CodomainSet)
    (sameSet : Left = Right) :
    (Preimage map Left : DomainSet) = Preimage map Right := by
  sorry

/-- A mixed preimage drill combining difference and union.

Logical form:

```lean
theorem PreimageDifferenceUnion
    (map : Function DomainElement CodomainElement)
    (Left Middle Right : CodomainSet) :
    (Preimage map (Left \ (Middle ∪ Right)) : DomainSet) =
      Preimage map Left \
        (Preimage map Middle ∪ Preimage map Right)
```
-/
theorem PreimageDifferenceUnion
    (map : Function DomainElement CodomainElement)
    (Left Middle Right : CodomainSet) :
    (Preimage map (Left \ (Middle ∪ Right)) : DomainSet) =
      Preimage map Left \
        (Preimage map Middle ∪ Preimage map Right) := by
  sorry

end Laws

end WithSeparation

end Preimages

section SameBackend

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [HasSeparation Element SetObject] [HasUniversal SetObject]

/-- Preimage under the identity function is the original set.

Logical form:

```lean
theorem PreimageIdentity
    [ExtensionalityLaw Element SetObject]
    [SeparationLaws Element SetObject]
    [HasComplement SetObject]
    [UniversalMembershipLaws Element SetObject]
    (Subset : SetObject) :
    (Preimage (IdentityFunction Element) Subset : SetObject) = Subset
```
-/
theorem PreimageIdentity
    [ExtensionalityLaw Element SetObject]
    [SeparationLaws Element SetObject]
    [HasComplement SetObject]
    [UniversalMembershipLaws Element SetObject]
    (Subset : SetObject) :
    (Preimage (IdentityFunction Element) Subset : SetObject) = Subset := by
  sorry

end SameBackend

section Composition

variable {FirstElement MiddleElement ThirdElement : Type u}
variable {FirstSet MiddleSet ThirdSet : Type v}
variable [Membership FirstElement FirstSet]
variable [Membership MiddleElement MiddleSet]
variable [Membership ThirdElement ThirdSet]
variable [HasSeparation FirstElement FirstSet] [HasUniversal FirstSet]
variable [HasSeparation MiddleElement MiddleSet] [HasUniversal MiddleSet]

/-- Pulling back along a composite is the same as pulling back in two
steps.

Logical form:

```lean
theorem PreimageComposition
    [ExtensionalityLaw FirstElement FirstSet]
    [SeparationLaws FirstElement FirstSet]
    [SeparationLaws MiddleElement MiddleSet]
    [HasComplement FirstSet] [HasComplement MiddleSet]
    [UniversalMembershipLaws FirstElement FirstSet]
    [UniversalMembershipLaws MiddleElement MiddleSet]
    (secondMap : Function MiddleElement ThirdElement)
    (firstMap : Function FirstElement MiddleElement)
    (Target : ThirdSet) :
    (Preimage (Composition secondMap firstMap) Target : FirstSet) =
      Preimage firstMap ((Preimage secondMap Target : MiddleSet))
```
-/
theorem PreimageComposition
    [ExtensionalityLaw FirstElement FirstSet]
    [SeparationLaws FirstElement FirstSet]
    [SeparationLaws MiddleElement MiddleSet]
    [HasComplement FirstSet] [HasComplement MiddleSet]
    [UniversalMembershipLaws FirstElement FirstSet]
    [UniversalMembershipLaws MiddleElement MiddleSet]
    (secondMap : Function MiddleElement ThirdElement)
    (firstMap : Function FirstElement MiddleElement)
    (Target : ThirdSet) :
    (Preimage (Composition secondMap firstMap) Target : FirstSet) =
      Preimage firstMap ((Preimage secondMap Target : MiddleSet)) := by
  sorry

/-- Preimage under a composite is monotone with respect to the target set.

Logical form:

```lean
theorem PreimageCompositionMonotone
    [HasSubset FirstSet] [HasSubset ThirdSet]
    [Union FirstSet] [Inter FirstSet] [SDiff FirstSet]
    [EmptyCollection FirstSet]
    [Union ThirdSet] [Inter ThirdSet] [SDiff ThirdSet]
    [EmptyCollection ThirdSet]
    [MembershipLaws FirstElement FirstSet]
    [MembershipLaws ThirdElement ThirdSet]
    [SeparationLaws FirstElement FirstSet]
    [HasComplement FirstSet]
    [UniversalMembershipLaws FirstElement FirstSet]
    (secondMap : Function MiddleElement ThirdElement)
    (firstMap : Function FirstElement MiddleElement)
    (Left Right : ThirdSet)
    (LeftSubsetRight : Left ⊆ Right) :
    (Preimage (Composition secondMap firstMap) Left : FirstSet) ⊆
      Preimage (Composition secondMap firstMap) Right
```
-/
theorem PreimageCompositionMonotone
    [HasSubset FirstSet] [HasSubset ThirdSet]
    [Union FirstSet] [Inter FirstSet] [SDiff FirstSet]
    [EmptyCollection FirstSet]
    [Union ThirdSet] [Inter ThirdSet] [SDiff ThirdSet]
    [EmptyCollection ThirdSet]
    [MembershipLaws FirstElement FirstSet]
    [MembershipLaws ThirdElement ThirdSet]
    [SeparationLaws FirstElement FirstSet]
    [HasComplement FirstSet]
    [UniversalMembershipLaws FirstElement FirstSet]
    (secondMap : Function MiddleElement ThirdElement)
    (firstMap : Function FirstElement MiddleElement)
    (Left Right : ThirdSet)
    (LeftSubsetRight : Left ⊆ Right) :
    (Preimage (Composition secondMap firstMap) Left : FirstSet) ⊆
      Preimage (Composition secondMap firstMap) Right := by
  sorry

end Composition

end LRA.Function
