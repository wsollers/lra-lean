import LRA.VolumeI.Functions.Preimages
import LRA.VolumeI.Identity.Model.Theory

namespace LRA.VolumeI.Functions

open LRA.VolumeI.Set

universe u v

/-!
Direct images of generic sets under functions. Same capability profile as
`Preimages.lean`: `Image` separates from the *codomain's* universal set,
so this vocabulary requires `HasUniversal` and is available for `LRASet`
but structurally not for Enderton sets.
-/

section Images

variable {DomainElement CodomainElement : Type u}
variable {DomainSet CodomainSet : Type v}
variable [Membership DomainElement DomainSet]
variable [Membership CodomainElement CodomainSet]

/-- A set `imageSet` is the direct image of `source` under `map` when its
members are exactly the codomain elements hit by some member of `source`.

Logical form:

```lean
def IsImageOf
    (imageSet : CodomainSet)
    (map : Function DomainElement CodomainElement)
    (source : DomainSet) : Prop :=
  ∀ output : CodomainElement,
    output ∈ imageSet ↔
      ∃ input : DomainElement, input ∈ source /\ map input = output
```
-/
def IsImageOf
    (imageSet : CodomainSet)
    (map : Function DomainElement CodomainElement)
    (source : DomainSet) : Prop :=
  ∀ output : CodomainElement,
    output ∈ imageSet ↔
      ∃ input : DomainElement, input ∈ source /\ map input = output

section WithSeparation

variable [HasSeparation CodomainElement CodomainSet]
variable [HasUniversal CodomainSet]

/-- Direct image of a generic set under a function: the members of the
codomain universe hit by some member of `subset`.

Logical form:

```lean
def Image
    (map : Function DomainElement CodomainElement)
    (subset : DomainSet) : CodomainSet :=
  HasSeparation.separation (𝒰 : CodomainSet)
    (fun output =>
      exists input : DomainElement, input ∈ subset /\ map input = output)
```
-/
def Image
    (map : Function DomainElement CodomainElement)
    (subset : DomainSet) : CodomainSet :=
  HasSeparation.separation (𝒰 : CodomainSet)
    (fun output =>
      exists input : DomainElement, input ∈ subset /\ map input = output)

/-- Alias emphasizing the forward direction of image.

Logical form:

```lean
def DirectImage
    (map : Function DomainElement CodomainElement)
    (subset : DomainSet) : CodomainSet :=
  Image map subset
```
-/
def DirectImage
    (map : Function DomainElement CodomainElement)
    (subset : DomainSet) : CodomainSet :=
  Image map subset

section Laws

variable [HasComplement CodomainSet]
variable [ExtensionalityLaw CodomainElement CodomainSet]
variable [SeparationLaws CodomainElement CodomainSet]
variable [UniversalMembershipLaws CodomainElement CodomainSet]

/-- For every source set, a direct image set exists.

Logical form:

```lean
theorem ImageExists
    (map : Function DomainElement CodomainElement)
    (source : DomainSet) :
    LRA.VolumeI.Identity.Exists
      (fun imageSet : CodomainSet =>
        IsImageOf imageSet map source)
```
-/
theorem ImageExists
    (map : Function DomainElement CodomainElement)
    (source : DomainSet) :
    LRA.VolumeI.Identity.Exists
      (fun imageSet : CodomainSet =>
        IsImageOf imageSet map source) := by
  sorry

/-- A direct image set is uniquely determined by its memberwise
specification.

Logical form:

```lean
theorem ImageUnique
    (map : Function DomainElement CodomainElement)
    (source : DomainSet) :
    LRA.VolumeI.Identity.Unique
      (fun imageSet : CodomainSet =>
        IsImageOf imageSet map source)
```
-/
theorem ImageUnique
    (map : Function DomainElement CodomainElement)
    (source : DomainSet) :
    LRA.VolumeI.Identity.Unique
      (fun imageSet : CodomainSet =>
        IsImageOf imageSet map source) := by
  sorry

/-- For every source set, there is exactly one direct image set.

Logical form:

```lean
theorem ImageExistsAndUnique
    (map : Function DomainElement CodomainElement)
    (source : DomainSet) :
    LRA.VolumeI.Identity.ExistsAndUnique
      (fun imageSet : CodomainSet =>
        IsImageOf imageSet map source)
```
-/
theorem ImageExistsAndUnique
    (map : Function DomainElement CodomainElement)
    (source : DomainSet) :
    LRA.VolumeI.Identity.ExistsAndUnique
      (fun imageSet : CodomainSet =>
        IsImageOf imageSet map source) := by
  sorry

/-- The constructed direct image satisfies its defining membership
specification.

Logical form:

```lean
theorem ImageMembershipIff
    (map : Function DomainElement CodomainElement)
    (source : DomainSet)
    (output : CodomainElement) :
    output ∈ (Image map source : CodomainSet) ↔
      ∃ input : DomainElement, input ∈ source /\ map input = output
```
-/
theorem ImageMembershipIff
    (map : Function DomainElement CodomainElement)
    (source : DomainSet)
    (output : CodomainElement) :
    output ∈ (Image map source : CodomainSet) ↔
      ∃ input : DomainElement, input ∈ source /\ map input = output := by
  sorry

/-- Pointwise equal functions have equal images of every source set.

Logical form:

```lean
theorem ImageCongrFunction
    (leftMap rightMap : Function DomainElement CodomainElement)
    (source : DomainSet)
    (sameValues : ∀ input, leftMap input = rightMap input) :
    (Image leftMap source : CodomainSet) = Image rightMap source
```
-/
theorem ImageCongrFunction
    (leftMap rightMap : Function DomainElement CodomainElement)
    (source : DomainSet)
    (sameValues : ∀ input, leftMap input = rightMap input) :
    (Image leftMap source : CodomainSet) = Image rightMap source := by
  sorry

/-- Equal source sets have equal direct images.

Logical form:

```lean
theorem ImageCongrSet
    (map : Function DomainElement CodomainElement)
    (left right : DomainSet)
    (sameSet : left = right) :
    (Image map left : CodomainSet) = Image map right
```
-/
theorem ImageCongrSet
    (map : Function DomainElement CodomainElement)
    (left right : DomainSet)
    (sameSet : left = right) :
    (Image map left : CodomainSet) = Image map right := by
  sorry

section WithDomainSeparation

variable [HasSeparation DomainElement DomainSet] [HasUniversal DomainSet]
variable [Inter CodomainSet] [HasSubset CodomainSet]
variable [SeparationLaws DomainElement DomainSet]
variable [HasComplement DomainSet]
variable [UniversalMembershipLaws DomainElement DomainSet]

/-- The image of a preimage is the target set restricted to the range of
the function.

Logical form:

```lean
theorem ImagePreimageEqIntersectionRange
    (map : Function DomainElement CodomainElement)
    (Target : CodomainSet) :
    Image map ((Preimage map Target : DomainSet)) =
      Target ∩ Image map (𝒰 : DomainSet)
```
-/
theorem ImagePreimageEqIntersectionRange
    (map : Function DomainElement CodomainElement)
    (Target : CodomainSet) :
    Image map ((Preimage map Target : DomainSet)) =
      Target ∩ Image map (𝒰 : DomainSet) := by
  sorry

/-- If the target set lies inside the range, the image of its preimage is
the target set.

Logical form:

```lean
theorem ImagePreimageEqOfSubsetRange
    (map : Function DomainElement CodomainElement)
    (Target : CodomainSet)
    (TargetSubsetRange : Target ⊆ (Image map (𝒰 : DomainSet) : CodomainSet)) :
    Image map ((Preimage map Target : DomainSet)) = Target
```
-/
theorem ImagePreimageEqOfSubsetRange
    (map : Function DomainElement CodomainElement)
    (Target : CodomainSet)
    (TargetSubsetRange : Target ⊆ (Image map (𝒰 : DomainSet) : CodomainSet)) :
    Image map ((Preimage map Target : DomainSet)) = Target := by
  sorry

end WithDomainSeparation

end Laws

end WithSeparation

end Images

end LRA.VolumeI.Functions
