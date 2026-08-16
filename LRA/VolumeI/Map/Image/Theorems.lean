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
Membership in the constructed direct image is exactly being hit by a source
member.
-/
theorem ImageMembershipIff
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (output : CodomainElement) :
    output ∈ (Image map source : CodomainSet) <->
      exists input : DomainElement, input ∈ source /\ map input = output := by
  sorry

/--
The finite image predicate is exactly finiteness of the set of codomain values
hit by source elements.
-/
theorem FiniteImageIff
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) :
    FiniteImage map source <->
      Set.Finite
        {output : CodomainElement |
          exists input : DomainElement, input ∈ source /\ map input = output} := by
  rfl

section Existence

variable [ExtensionalityLaw CodomainElement CodomainSet]

/--
For every source set, a direct image set exists.
-/
theorem ImageExists
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) :
    LRA.Identity.Exists
      (fun imageSet : CodomainSet =>
        IsImageOf imageSet map source) := by
  sorry

/--
A direct image set is uniquely determined by its memberwise specification.
-/
theorem ImageUnique
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) :
    LRA.Identity.Unique
      (fun imageSet : CodomainSet =>
        IsImageOf imageSet map source) := by
  sorry

/--
For every source set, there is exactly one direct image set.
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
Pointwise equal maps have equal images of every source set.
-/
theorem ImageCongrFunction
    [ExtensionalityLaw CodomainElement CodomainSet]
    (leftMap rightMap : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (sameValues : forall input, leftMap input = rightMap input) :
    (Image leftMap source : CodomainSet) = Image rightMap source := by
  sorry

/--
Equal source sets have equal direct images.
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
The direct image of the empty set is empty.
-/
theorem ImageEmpty
    (map : TypedMap DomainElement CodomainElement) :
    (Image map (∅ : DomainSet) : CodomainSet) = ∅ := by
  sorry

/--
Direct image distributes over binary union.
-/
theorem ImageUnion
    (map : TypedMap DomainElement CodomainElement)
    (left right : DomainSet) :
    (Image map (left ∪ right) : CodomainSet) =
      Image map left ∪ Image map right := by
  sorry

/--
The image of an intersection is contained in the intersection of the images.
-/
theorem ImageIntersectionSubsetIntersectionImages
    (map : TypedMap DomainElement CodomainElement)
    (left right : DomainSet) :
    (Image map (left ∩ right) : CodomainSet) ⊆
      Image map left ∩ Image map right := by
  sorry

/--
The difference of two images is contained in the image of the difference.
-/
theorem DifferenceImagesSubsetImageDifference
    (map : TypedMap DomainElement CodomainElement)
    (left right : DomainSet) :
    (Image map left \ Image map right : CodomainSet) ⊆
      Image map (left \ right) := by
  sorry

/--
For injective maps, direct image preserves set difference.
-/
theorem ImageDifferenceOfInjective
    (map : TypedMap DomainElement CodomainElement)
    (injective : LRA.Map.Injective.Injective map)
    (left right : DomainSet) :
    (Image map (left \ right) : CodomainSet) =
      Image map left \ Image map right := by
  sorry

/--
For injective maps, direct image preserves binary intersection.
-/
theorem ImageIntersectionOfInjective
    (map : TypedMap DomainElement CodomainElement)
    (injective : LRA.Map.Injective.Injective map)
    (left right : DomainSet) :
    (Image map (left ∩ right) : CodomainSet) =
      Image map left ∩ Image map right := by
  sorry

/--
Direct image is monotone with respect to source inclusion.
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
Direct image preserves arbitrary indexed unions.
-/
theorem ImageIndexedUnion
    (map : TypedMap DomainElement CodomainElement)
    (family : Index → DomainSet) :
    (Image map (HasIndexedUnion.indexedUnion family) : CodomainSet) =
      HasIndexedUnion.indexedUnion
        (fun index : Index => (Image map (family index) : CodomainSet)) := by
  sorry

/--
The direct image of an arbitrary indexed intersection is contained in the
indexed intersection of the direct images.
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
For injective maps, direct image preserves arbitrary indexed intersections.
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
Direct image preserves countable unions.
-/
theorem ImageCountableUnion
    (map : TypedMap DomainElement CodomainElement)
    (family : Nat → DomainSet) :
    (Image map (HasCountableUnion.countableUnion family) : CodomainSet) =
      HasCountableUnion.countableUnion
        (fun index : Nat => (Image map (family index) : CodomainSet)) := by
  sorry

/--
The direct image of a countable intersection is contained in the countable
intersection of the direct images.
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
For injective maps, direct image preserves countable intersections.
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
Image/preimage adjunction: a source lies in the preimage of a target exactly
when its image lies in that target.
-/
theorem ImagePreimageSubsetAdjunction
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) :
    source ⊆ (LRA.Map.Preimage.Preimage map target : DomainSet) <->
      (Image map source : CodomainSet) ⊆ target := by
  sorry

/--
The neighborhood-style statement `f(A) ⊆ B` is the same as saying that every
point of `A` is mapped into `B`.
-/
theorem MapsIntoIffImageSubset
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) :
    MapsInto map source target <->
      (Image map source : CodomainSet) ⊆ target := by
  sorry

/--
Equivalently, mapping a source into a target says that the source is contained
in the preimage of the target.
-/
theorem MapsIntoIffSubsetPreimage
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) :
    MapsInto map source target <->
      source ⊆ (LRA.Map.Preimage.Preimage map target : DomainSet) := by
  sorry

/--
Every source is contained in the preimage of its image.
-/
theorem SourceSubsetPreimageImage
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) :
    source ⊆
      (LRA.Map.Preimage.Preimage map
        (Image map source : CodomainSet) : DomainSet) := by
  sorry

/--
The image of a preimage is contained in the target.
-/
theorem ImagePreimageSubset
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    (Image map
      (LRA.Map.Preimage.Preimage map target : DomainSet) : CodomainSet) ⊆
      target := by
  sorry

/--
For surjective maps, the image of a preimage is the original target.
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
The image of a preimage is the target set restricted to the range of the map.
-/
theorem ImagePreimageEqIntersectionRange
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) :
    (Image map
      (LRA.Map.Preimage.Preimage map target : DomainSet) : CodomainSet) =
      target ∩ Image map (𝒰 : DomainSet) := by
  sorry

/--
If the target set lies inside the range, the image of its preimage is the
target set.
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
For injective maps, a source is exactly the preimage of its image.
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
Finite range is finite image of the chosen ambient domain.
-/
theorem FiniteRangeIffFiniteImage
    (map : TypedMap DomainElement CodomainElement)
    (ambientDomain : DomainSet) :
    FiniteRange map ambientDomain <-> FiniteImage map ambientDomain := by
  rfl

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
Image under the identity map is the original set.
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
Pushing forward along a composite is the same as pushing forward in two steps.
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
