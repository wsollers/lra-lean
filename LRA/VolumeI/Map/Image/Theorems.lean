import LRA.VolumeI.Map.Image.Definition
import LRA.VolumeI.Map.Preimage.Definition
import LRA.VolumeI.Map.Composition.Definition
import LRA.VolumeI.Map.Identity.Definition
import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Surjective.Definition
import LRA.VolumeI.Set.Interface.Indexed
import LRA.VolumeI.Identity.Model.Theory

namespace LRA.Map.Image

open LRA.Set
open LRA.Map.Typed

universe u₁ u₂ u₃ v₁ v₂ v₃

section Image

variable {DomainElement : Type u₁} {CodomainElement : Type u₂}
variable {DomainSet : Type v₁} {CodomainSet : Type v₂}
variable [Membership DomainElement DomainSet]
variable [Membership CodomainElement CodomainSet]
variable [HasSeparation CodomainElement CodomainSet]
variable [HasUniversal CodomainSet]
variable [HasComplement CodomainSet]
variable [SeparationLaws CodomainElement CodomainSet]
variable [UniversalMembershipLaws CodomainElement CodomainSet]

/--
**[Theorem — ImageMembershipIff]**

Membership in the constructed direct image is exactly being hit by a source
member.

Logical form:

```lean
theorem ImageMembershipIff
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (output : CodomainElement) :
    output ∈ (Image map source : CodomainSet) <->
      exists input : DomainElement, input ∈ source /\ map input = output
```
-/
theorem ImageMembershipIff
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (output : CodomainElement) :
    output ∈ (Image map source : CodomainSet) <->
      exists input : DomainElement, input ∈ source /\ map input = output := by
  sorry

/--
**[Theorem — FiniteImageIff]**

The finite image predicate is exactly finiteness of the set of codomain values
hit by source elements.

Logical form:

```lean
theorem FiniteImageIff
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) :
    FiniteImage map source <->
      Set.Finite
        {output : CodomainElement |
          exists input : DomainElement, input ∈ source /\ map input = output}
```
-/
theorem FiniteImageIff
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) :
    FiniteImage map source <->
      Set.Finite
        {output : CodomainElement |
          exists input : DomainElement, input ∈ source /\ map input = output} := by
  sorry
section Existence

variable [ExtensionalityLaw CodomainElement CodomainSet]

/--
**[Theorem — ImageExists]**

For every source set, a direct image set exists.

Logical form:

```lean
theorem ImageExists
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) :
    LRA.Identity.Exists
      (fun imageSet : CodomainSet =>
        IsImageOf imageSet map source)
```
-/
theorem ImageExists
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) :
    LRA.Identity.Exists
      (fun imageSet : CodomainSet =>
        IsImageOf imageSet map source) := by
  sorry

/--
**[Theorem — ImageUnique]**

A direct image set is uniquely determined by its memberwise specification.

Logical form:

```lean
theorem ImageUnique
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) :
    LRA.Identity.Unique
      (fun imageSet : CodomainSet =>
        IsImageOf imageSet map source)
```
-/
theorem ImageUnique
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) :
    LRA.Identity.Unique
      (fun imageSet : CodomainSet =>
        IsImageOf imageSet map source) := by
  sorry

/--
**[Theorem — ImageExistsAndUnique]**

For every source set, there is exactly one direct image set.

Logical form:

```lean
theorem ImageExistsAndUnique
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) :
    LRA.Identity.ExistsAndUnique
      (fun imageSet : CodomainSet =>
        IsImageOf imageSet map source)
```
-/
theorem ImageExistsAndUnique
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) :
    LRA.Identity.ExistsAndUnique
      (fun imageSet : CodomainSet =>
        IsImageOf imageSet map source) := by
  sorry

end Existence

/--
**[Theorem — ImageCongrFunction]**

Pointwise equal maps have equal images of every source set.

Logical form:

```lean
theorem ImageCongrFunction
    [ExtensionalityLaw CodomainElement CodomainSet]
    (leftMap rightMap : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (sameValues : forall input, leftMap input = rightMap input) :
    (Image leftMap source : CodomainSet) = Image rightMap source
```
-/
theorem ImageCongrFunction
    [ExtensionalityLaw CodomainElement CodomainSet]
    (leftMap rightMap : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (sameValues : forall input, leftMap input = rightMap input) :
    (Image leftMap source : CodomainSet) = Image rightMap source := by
  sorry

/--
**[Theorem — ImageCongrSet]**

Equal source sets have equal direct images.

Logical form:

```lean
theorem ImageCongrSet
    [ExtensionalityLaw CodomainElement CodomainSet]
    (map : TypedMap DomainElement CodomainElement)
    (left right : DomainSet)
    (sameSet : left = right) :
    (Image map left : CodomainSet) = Image map right
```
-/
theorem ImageCongrSet
    [ExtensionalityLaw CodomainElement CodomainSet]
    (map : TypedMap DomainElement CodomainElement)
    (left right : DomainSet)
    (sameSet : left = right) :
    (Image map left : CodomainSet) = Image map right := by
  sorry

section SetOperations

variable [Union DomainSet] [Inter DomainSet] [SDiff DomainSet]
variable [EmptyCollection DomainSet] [HasSubset DomainSet]
variable [Union CodomainSet] [Inter CodomainSet] [SDiff CodomainSet]
variable [EmptyCollection CodomainSet] [HasSubset CodomainSet]
variable [ExtensionalityLaw CodomainElement CodomainSet]
variable [MembershipLaws DomainElement DomainSet]
variable [MembershipLaws CodomainElement CodomainSet]

/--
**[Theorem — ImageEmpty]**

The direct image of the empty set is empty.

Logical form:

```lean
theorem ImageEmpty
    (map : TypedMap DomainElement CodomainElement) :
    (Image map (∅ : DomainSet) : CodomainSet) = ∅
```
-/
theorem ImageEmpty
    (map : TypedMap DomainElement CodomainElement) :
    (Image map (∅ : DomainSet) : CodomainSet) = ∅ := by
  sorry

/--
**[Theorem — ImageUnion]**

Direct image distributes over binary union.

Logical form:

```lean
theorem ImageUnion
    (map : TypedMap DomainElement CodomainElement)
    (left right : DomainSet) :
    (Image map (left ∪ right) : CodomainSet) =
      Image map left ∪ Image map right
```
-/
theorem ImageUnion
    (map : TypedMap DomainElement CodomainElement)
    (left right : DomainSet) :
    (Image map (left ∪ right) : CodomainSet) =
      Image map left ∪ Image map right := by
  sorry

/--
**[Theorem — ImageIntersectionSubsetIntersectionImages]**

The image of an intersection is contained in the intersection of the images.

Logical form:

```lean
theorem ImageIntersectionSubsetIntersectionImages
    (map : TypedMap DomainElement CodomainElement)
    (left right : DomainSet) :
    (Image map (left ∩ right) : CodomainSet) ⊆
      Image map left ∩ Image map right
```
-/
theorem ImageIntersectionSubsetIntersectionImages
    (map : TypedMap DomainElement CodomainElement)
    (left right : DomainSet) :
    (Image map (left ∩ right) : CodomainSet) ⊆
      Image map left ∩ Image map right := by
  sorry

/--
**[Theorem — DifferenceImagesSubsetImageDifference]**

The difference of two images is contained in the image of the difference.

Logical form:

```lean
theorem DifferenceImagesSubsetImageDifference
    (map : TypedMap DomainElement CodomainElement)
    (left right : DomainSet) :
    (Image map left \ Image map right : CodomainSet) ⊆
      Image map (left \ right)
```
-/
theorem DifferenceImagesSubsetImageDifference
    (map : TypedMap DomainElement CodomainElement)
    (left right : DomainSet) :
    (Image map left \ Image map right : CodomainSet) ⊆
      Image map (left \ right) := by
  sorry

/--
**[Theorem — ImageDifferenceOfInjective]**

For injective maps, direct image preserves set difference.

Logical form:

```lean
theorem ImageDifferenceOfInjective
    (map : TypedMap DomainElement CodomainElement)
    (injective : LRA.Map.Injective.Injective map)
    (left right : DomainSet) :
    (Image map (left \ right) : CodomainSet) =
      Image map left \ Image map right
```
-/
theorem ImageDifferenceOfInjective
    (map : TypedMap DomainElement CodomainElement)
    (injective : LRA.Map.Injective.Injective map)
    (left right : DomainSet) :
    (Image map (left \ right) : CodomainSet) =
      Image map left \ Image map right := by
  sorry

/--
**[Theorem — ImageIntersectionOfInjective]**

For injective maps, direct image preserves binary intersection.

Logical form:

```lean
theorem ImageIntersectionOfInjective
    (map : TypedMap DomainElement CodomainElement)
    (injective : LRA.Map.Injective.Injective map)
    (left right : DomainSet) :
    (Image map (left ∩ right) : CodomainSet) =
      Image map left ∩ Image map right
```
-/
theorem ImageIntersectionOfInjective
    (map : TypedMap DomainElement CodomainElement)
    (injective : LRA.Map.Injective.Injective map)
    (left right : DomainSet) :
    (Image map (left ∩ right) : CodomainSet) =
      Image map left ∩ Image map right := by
  sorry

/--
**[Theorem — ImageMonotone]**

Direct image is monotone with respect to source inclusion.

Logical form:

```lean
theorem ImageMonotone
    (map : TypedMap DomainElement CodomainElement)
    {left right : DomainSet}
    (subset : left ⊆ right) :
    (Image map left : CodomainSet) ⊆ Image map right
```
-/
theorem ImageMonotone
    (map : TypedMap DomainElement CodomainElement)
    {left right : DomainSet}
    (subset : left ⊆ right) :
    (Image map left : CodomainSet) ⊆ Image map right := by
  sorry

section IndexedSetOperations

variable {Index : Type u₃}
variable [HasIndexedUnion DomainSet] [HasIndexedIntersection DomainSet]
variable [HasIndexedUnion CodomainSet] [HasIndexedIntersection CodomainSet]
variable [IndexedMembershipLaws DomainElement DomainSet]
variable [IndexedMembershipLaws CodomainElement CodomainSet]

/--
**[Theorem — ImageIndexedUnion]**

Direct image preserves arbitrary indexed unions.

Logical form:

```lean
theorem ImageIndexedUnion
    (map : TypedMap DomainElement CodomainElement)
    (family : Index → DomainSet) :
    (Image map (HasIndexedUnion.indexedUnion family) : CodomainSet) =
      HasIndexedUnion.indexedUnion
        (fun index : Index => (Image map (family index) : CodomainSet))
```
-/
theorem ImageIndexedUnion
    (map : TypedMap DomainElement CodomainElement)
    (family : Index → DomainSet) :
    (Image map (HasIndexedUnion.indexedUnion family) : CodomainSet) =
      HasIndexedUnion.indexedUnion
        (fun index : Index => (Image map (family index) : CodomainSet)) := by
  sorry

/--
**[Theorem — ImageIndexedIntersectionSubset]**

The direct image of an arbitrary indexed intersection is contained in the
indexed intersection of the direct images.

Logical form:

```lean
theorem ImageIndexedIntersectionSubset
    (map : TypedMap DomainElement CodomainElement)
    (family : Index → DomainSet) :
    (Image map (HasIndexedIntersection.indexedIntersection family) :
      CodomainSet) ⊆
      HasIndexedIntersection.indexedIntersection
        (fun index : Index => (Image map (family index) : CodomainSet))
```
-/
theorem ImageIndexedIntersectionSubset
    (map : TypedMap DomainElement CodomainElement)
    (family : Index → DomainSet) :
    (Image map (HasIndexedIntersection.indexedIntersection family) :
      CodomainSet) ⊆
      HasIndexedIntersection.indexedIntersection
        (fun index : Index => (Image map (family index) : CodomainSet)) := by
  sorry

/--
**[Theorem — ImageIndexedIntersectionOfInjective]**

For injective maps, direct image preserves arbitrary indexed intersections.

Logical form:

```lean
theorem ImageIndexedIntersectionOfInjective
    (map : TypedMap DomainElement CodomainElement)
    (injective : LRA.Map.Injective.Injective map)
    (family : Index → DomainSet) :
    (Image map (HasIndexedIntersection.indexedIntersection family) :
      CodomainSet) =
      HasIndexedIntersection.indexedIntersection
        (fun index : Index => (Image map (family index) : CodomainSet))
```
-/
theorem ImageIndexedIntersectionOfInjective
    (map : TypedMap DomainElement CodomainElement)
    (injective : LRA.Map.Injective.Injective map)
    (family : Index → DomainSet) :
    (Image map (HasIndexedIntersection.indexedIntersection family) :
      CodomainSet) =
      HasIndexedIntersection.indexedIntersection
        (fun index : Index => (Image map (family index) : CodomainSet)) := by
  sorry

end IndexedSetOperations

section CountableSetOperations

variable [HasCountableUnion DomainSet] [HasCountableIntersection DomainSet]
variable [HasCountableUnion CodomainSet] [HasCountableIntersection CodomainSet]
variable [CountableMembershipLaws DomainElement DomainSet]
variable [CountableMembershipLaws CodomainElement CodomainSet]

/--
**[Theorem — ImageCountableUnion]**

Direct image preserves countable unions.

Logical form:

```lean
theorem ImageCountableUnion
    (map : TypedMap DomainElement CodomainElement)
    (family : Nat → DomainSet) :
    (Image map (HasCountableUnion.countableUnion family) : CodomainSet) =
      HasCountableUnion.countableUnion
        (fun index : Nat => (Image map (family index) : CodomainSet))
```
-/
theorem ImageCountableUnion
    (map : TypedMap DomainElement CodomainElement)
    (family : Nat → DomainSet) :
    (Image map (HasCountableUnion.countableUnion family) : CodomainSet) =
      HasCountableUnion.countableUnion
        (fun index : Nat => (Image map (family index) : CodomainSet)) := by
  sorry

/--
**[Theorem — ImageCountableIntersectionSubset]**

The direct image of a countable intersection is contained in the countable
intersection of the direct images.

Logical form:

```lean
theorem ImageCountableIntersectionSubset
    (map : TypedMap DomainElement CodomainElement)
    (family : Nat → DomainSet) :
    (Image map (HasCountableIntersection.countableIntersection family) :
      CodomainSet) ⊆
      HasCountableIntersection.countableIntersection
        (fun index : Nat => (Image map (family index) : CodomainSet))
```
-/
theorem ImageCountableIntersectionSubset
    (map : TypedMap DomainElement CodomainElement)
    (family : Nat → DomainSet) :
    (Image map (HasCountableIntersection.countableIntersection family) :
      CodomainSet) ⊆
      HasCountableIntersection.countableIntersection
        (fun index : Nat => (Image map (family index) : CodomainSet)) := by
  sorry

/--
**[Theorem — ImageCountableIntersectionOfInjective]**

For injective maps, direct image preserves countable intersections.

Logical form:

```lean
theorem ImageCountableIntersectionOfInjective
    (map : TypedMap DomainElement CodomainElement)
    (injective : LRA.Map.Injective.Injective map)
    (family : Nat → DomainSet) :
    (Image map (HasCountableIntersection.countableIntersection family) :
      CodomainSet) =
      HasCountableIntersection.countableIntersection
        (fun index : Nat => (Image map (family index) : CodomainSet))
```
-/
theorem ImageCountableIntersectionOfInjective
    (map : TypedMap DomainElement CodomainElement)
    (injective : LRA.Map.Injective.Injective map)
    (family : Nat → DomainSet) :
    (Image map (HasCountableIntersection.countableIntersection family) :
      CodomainSet) =
      HasCountableIntersection.countableIntersection
        (fun index : Nat => (Image map (family index) : CodomainSet)) := by
  sorry

end CountableSetOperations

section Adjunction

variable [HasSeparation DomainElement DomainSet]
variable [HasUniversal DomainSet]
variable [HasComplement DomainSet]
variable [SeparationLaws DomainElement DomainSet]
variable [UniversalMembershipLaws DomainElement DomainSet]

/--
**[Theorem — ImagePreimageSubsetAdjunction]**

Image/preimage adjunction: a source lies in the preimage of a target exactly
when its image lies in that target.

Logical form:

```lean
theorem ImagePreimageSubsetAdjunction
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) :
    source ⊆ (LRA.Map.Preimage.Preimage map target : DomainSet) <->
      (Image map source : CodomainSet) ⊆ target
```
-/
theorem ImagePreimageSubsetAdjunction
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) :
    source ⊆ (LRA.Map.Preimage.Preimage map target : DomainSet) <->
      (Image map source : CodomainSet) ⊆ target := by
  sorry

/--
**[Theorem — MapsIntoIffImageSubset]**

The neighborhood-style statement `f(A) ⊆ B` is the same as saying that every
point of `A` is mapped into `B`.

Logical form:

```lean
theorem MapsIntoIffImageSubset
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) :
    MapsInto map source target <->
      (Image map source : CodomainSet) ⊆ target
```
-/
theorem MapsIntoIffImageSubset
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) :
    MapsInto map source target <->
      (Image map source : CodomainSet) ⊆ target := by
  sorry

/--
**[Theorem — MapsIntoIffSubsetPreimage]**

Equivalently, mapping a source into a target says that the source is contained
in the preimage of the target.

Logical form:

```lean
theorem MapsIntoIffSubsetPreimage
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) :
    MapsInto map source target <->
      source ⊆ (LRA.Map.Preimage.Preimage map target : DomainSet)
```
-/
theorem MapsIntoIffSubsetPreimage
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) :
    MapsInto map source target <->
      source ⊆ (LRA.Map.Preimage.Preimage map target : DomainSet) := by
  sorry

/--
**[Theorem — SourceSubsetPreimageImage]**

Every source is contained in the preimage of its image.

Logical form:

```lean
theorem SourceSubsetPreimageImage
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) :
    source ⊆
      (LRA.Map.Preimage.Preimage map
        (Image map source : CodomainSet) : DomainSet)
```
-/
theorem SourceSubsetPreimageImage
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) :
    source ⊆
      (LRA.Map.Preimage.Preimage map
        (Image map source : CodomainSet) : DomainSet) := by
  sorry

/--
**[Theorem — ImagePreimageSubset]**

The image of a preimage is contained in the target.

Logical form:

```lean
theorem ImagePreimageSubset
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    (Image map
      (LRA.Map.Preimage.Preimage map target : DomainSet) : CodomainSet) ⊆
      target
```
-/
theorem ImagePreimageSubset
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    (Image map
      (LRA.Map.Preimage.Preimage map target : DomainSet) : CodomainSet) ⊆
      target := by
  sorry

/--
**[Theorem — ImagePreimageOfSurjective]**

For surjective maps, the image of a preimage is the original target.

Logical form:

```lean
theorem ImagePreimageOfSurjective
    (map : TypedMap DomainElement CodomainElement)
    (surjective : LRA.Map.Surjective.Surjective map)
    (target : CodomainSet) :
    (Image map
      (LRA.Map.Preimage.Preimage map target : DomainSet) : CodomainSet) =
      target
```
-/
theorem ImagePreimageOfSurjective
    (map : TypedMap DomainElement CodomainElement)
    (surjective : LRA.Map.Surjective.Surjective map)
    (target : CodomainSet) :
    (Image map
      (LRA.Map.Preimage.Preimage map target : DomainSet) : CodomainSet) =
      target := by
  sorry

/--
**[Theorem — ImagePreimageEqIntersectionRange]**

The image of a preimage is the target set restricted to the range of the map.

Logical form:

```lean
theorem ImagePreimageEqIntersectionRange
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    (Image map
      (LRA.Map.Preimage.Preimage map target : DomainSet) : CodomainSet) =
      target ∩ Image map (𝒰 : DomainSet)
```
-/
theorem ImagePreimageEqIntersectionRange
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    (Image map
      (LRA.Map.Preimage.Preimage map target : DomainSet) : CodomainSet) =
      target ∩ Image map (𝒰 : DomainSet) := by
  sorry

/--
**[Theorem — ImagePreimageEqOfSubsetRange]**

If the target set lies inside the range, the image of its preimage is the
target set.

Logical form:

```lean
theorem ImagePreimageEqOfSubsetRange
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet)
    (targetSubsetRange :
      target ⊆ (Image map (𝒰 : DomainSet) : CodomainSet)) :
    (Image map
      (LRA.Map.Preimage.Preimage map target : DomainSet) : CodomainSet) =
      target
```
-/
theorem ImagePreimageEqOfSubsetRange
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet)
    (targetSubsetRange :
      target ⊆ (Image map (𝒰 : DomainSet) : CodomainSet)) :
    (Image map
      (LRA.Map.Preimage.Preimage map target : DomainSet) : CodomainSet) =
      target := by
  sorry

/--
**[Theorem — PreimageImageOfInjective]**

For injective maps, a source is exactly the preimage of its image.

Logical form:

```lean
theorem PreimageImageOfInjective
    (map : TypedMap DomainElement CodomainElement)
    (injective : LRA.Map.Injective.Injective map)
    (source : DomainSet) :
    (LRA.Map.Preimage.Preimage map
      (Image map source : CodomainSet) : DomainSet) =
      source
```
-/
theorem PreimageImageOfInjective
    (map : TypedMap DomainElement CodomainElement)
    (injective : LRA.Map.Injective.Injective map)
    (source : DomainSet) :
    (LRA.Map.Preimage.Preimage map
      (Image map source : CodomainSet) : DomainSet) =
      source := by
  sorry

end Adjunction

end SetOperations

section FiniteRange

variable [HasSeparation CodomainElement CodomainSet]
variable [HasUniversal CodomainSet]

/--
**[Theorem — FiniteRangeIffFiniteImage]**

Finite range is finite image of the chosen ambient domain.

Logical form:

```lean
theorem FiniteRangeIffFiniteImage
    (map : TypedMap DomainElement CodomainElement)
    (ambientDomain : DomainSet) :
    FiniteRange map ambientDomain <-> FiniteImage map ambientDomain
```
-/
theorem FiniteRangeIffFiniteImage
    (map : TypedMap DomainElement CodomainElement)
    (ambientDomain : DomainSet) :
    FiniteRange map ambientDomain <-> FiniteImage map ambientDomain := by
  sorry
end FiniteRange

section SameBackend

variable {Element : Type u₁} {SetObject : Type v₁}
variable [Membership Element SetObject]
variable [HasSeparation Element SetObject]
variable [HasUniversal SetObject]
variable [HasComplement SetObject]
variable [ExtensionalityLaw Element SetObject]
variable [SeparationLaws Element SetObject]
variable [UniversalMembershipLaws Element SetObject]

/--
**[Theorem — ImageIdentity]**

Image under the identity map is the original set.

Logical form:

```lean
theorem ImageIdentity
    (subset : SetObject) :
    (Image (LRA.Map.Identity.IdentityMap Element) subset : SetObject) =
      subset
```
-/
theorem ImageIdentity
    (subset : SetObject) :
    (Image (LRA.Map.Identity.IdentityMap Element) subset : SetObject) =
      subset := by
  sorry

end SameBackend

section Composition

variable {FirstElement : Type u₁}
variable {MiddleElement : Type u₂}
variable {ThirdElement : Type u₃}
variable {FirstSet : Type v₁}
variable {MiddleSet : Type v₂}
variable {ThirdSet : Type v₃}
variable [Membership FirstElement FirstSet]
variable [Membership MiddleElement MiddleSet]
variable [Membership ThirdElement ThirdSet]
variable [HasSeparation MiddleElement MiddleSet]
variable [HasUniversal MiddleSet]
variable [HasSeparation ThirdElement ThirdSet]
variable [HasUniversal ThirdSet]
variable [HasComplement MiddleSet] [HasComplement ThirdSet]
variable [ExtensionalityLaw ThirdElement ThirdSet]
variable [SeparationLaws MiddleElement MiddleSet]
variable [SeparationLaws ThirdElement ThirdSet]
variable [UniversalMembershipLaws MiddleElement MiddleSet]
variable [UniversalMembershipLaws ThirdElement ThirdSet]

/--
**[Theorem — ImageComposition]**

Pushing forward along a composite is the same as pushing forward in two steps.

Logical form:

```lean
theorem ImageComposition
    (secondMap : TypedMap MiddleElement ThirdElement)
    (firstMap : TypedMap FirstElement MiddleElement)
    (source : FirstSet) :
    (Image (LRA.Map.Composition.Compose secondMap firstMap) source :
      ThirdSet) =
      Image secondMap ((Image firstMap source : MiddleSet))
```
-/
theorem ImageComposition
    (secondMap : TypedMap MiddleElement ThirdElement)
    (firstMap : TypedMap FirstElement MiddleElement)
    (source : FirstSet) :
    (Image (LRA.Map.Composition.Compose secondMap firstMap) source :
      ThirdSet) =
      Image secondMap ((Image firstMap source : MiddleSet)) := by
  sorry

end Composition

end Image

end LRA.Map.Image
