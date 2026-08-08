import LRA.VolumeI.Functions.Preimages
import LRA.VolumeI.Identity.Theory

namespace LRA.VolumeI.Functions

universe u

open LRA.VolumeI.Set.Operations

/-- A set `imageSet` is the direct image of `source` under `map` when its
members are exactly the codomain elements hit by some member of `source`. -/
def IsImageOf
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (imageSet : codomainOperations.SetObject)
    (map : Function domainOperations.Element codomainOperations.Element)
    (source : domainOperations.SetObject) : Prop :=
  ∀ output,
    codomainOperations.member output imageSet ↔
      ∃ input,
        domainOperations.member input source /\ map input = output

/-- Direct image of a generic set under a function. -/
def Image
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (subset : domainOperations.SetObject) :
    codomainOperations.SetObject :=
  codomainOperations.separation codomainOperations.universal
    (fun output =>
      exists input,
        domainOperations.member input subset /\ map input = output)

/-- For every source set, a direct image set exists. -/
theorem ImageExists
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (laws : BooleanComprehensionSetInterfaceLaws codomainOperations)
    (map : Function domainOperations.Element codomainOperations.Element)
    (source : domainOperations.SetObject) :
    LRA.VolumeI.Identity.Exists
      (fun imageSet : codomainOperations.SetObject =>
        IsImageOf domainOperations codomainOperations imageSet map source) := by
  sorry

/-- A direct image set is uniquely determined by its memberwise specification. -/
theorem ImageUnique
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (laws : BooleanComprehensionSetInterfaceLaws codomainOperations)
    (map : Function domainOperations.Element codomainOperations.Element)
    (source : domainOperations.SetObject) :
    LRA.VolumeI.Identity.Unique
      (fun imageSet : codomainOperations.SetObject =>
        IsImageOf domainOperations codomainOperations imageSet map source) := by
  sorry

/-- For every source set, there is exactly one direct image set. -/
theorem ImageExistsAndUnique
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (laws : BooleanComprehensionSetInterfaceLaws codomainOperations)
    (map : Function domainOperations.Element codomainOperations.Element)
    (source : domainOperations.SetObject) :
    LRA.VolumeI.Identity.ExistsAndUnique
      (fun imageSet : codomainOperations.SetObject =>
        IsImageOf domainOperations codomainOperations imageSet map source) := by
  sorry

/-- The constructed direct image satisfies its defining membership
specification. -/
theorem ImageMembershipIff
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (laws : BooleanComprehensionSetInterfaceLaws codomainOperations)
    (map : Function domainOperations.Element codomainOperations.Element)
    (source : domainOperations.SetObject)
    (output : codomainOperations.Element) :
    codomainOperations.member output
        (Image domainOperations codomainOperations map source) ↔
      ∃ input,
        domainOperations.member input source /\ map input = output := by
  sorry

/-- Alias emphasizing the forward direction of image. -/
def DirectImage
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (subset : domainOperations.SetObject) :
    codomainOperations.SetObject :=
  Image domainOperations codomainOperations map subset

/-- Pointwise equal functions have equal images of every source set. -/
theorem ImageCongrFunction
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (leftMap rightMap :
      Function domainOperations.Element codomainOperations.Element)
    (source : domainOperations.SetObject)
    (sameValues : ∀ input, leftMap input = rightMap input) :
    Image domainOperations codomainOperations leftMap source =
      Image domainOperations codomainOperations rightMap source := by
  sorry

/-- Equal source sets have equal direct images. -/
theorem ImageCongrSet
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (left right : domainOperations.SetObject)
    (sameSet : left = right) :
    Image domainOperations codomainOperations map left =
      Image domainOperations codomainOperations map right := by
  sorry

/-- The image of a preimage is the target set restricted to the range of the
function. -/
theorem ImagePreimageEqIntersectionRange
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (Target : codomainOperations.SetObject) :
    Image domainOperations codomainOperations map
      (Preimage domainOperations codomainOperations map Target) =
      codomainOperations.intersection Target
        (Image domainOperations codomainOperations map domainOperations.universal) := by
  sorry

/-- If the target set lies inside the range, the image of its preimage is the
target set. -/
theorem ImagePreimageEqOfSubsetRange
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (Target : codomainOperations.SetObject)
    (TargetSubsetRange :
      codomainOperations.subset Target
        (Image domainOperations codomainOperations map domainOperations.universal)) :
    Image domainOperations codomainOperations map
      (Preimage domainOperations codomainOperations map Target) = Target := by
  sorry

end LRA.VolumeI.Functions
