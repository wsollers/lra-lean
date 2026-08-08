import LRA.VolumeI.Functions.Preimages

namespace LRA.VolumeI.Functions

universe u

open LRA.VolumeI.Set.Operations

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

/-- Alias emphasizing the forward direction of image. -/
def DirectImage
    (domainOperations codomainOperations :
      BooleanComprehensionSetOperations.{u, u})
    (map : Function domainOperations.Element codomainOperations.Element)
    (subset : domainOperations.SetObject) :
    codomainOperations.SetObject :=
  Image domainOperations codomainOperations map subset

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
