import LRA.VolumeI.Map.Preimage.Theorems
import LRA.VolumeI.Map.Preimage.Definition
import LRA.VolumeI.Map.Fiber.Definition

namespace LRA.Map.Preimage

open LRA.Set
open LRA.Map.Typed

universe u₁ u₂ v₁ v₂

/--
If an input maps into the target, then it belongs to any set satisfying the
preimage predicate.
-/
theorem PreimageContainsInputOfTargetMember
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {preimageSet : DomainSet}
    {map : TypedMap DomainElement CodomainElement}
    {target : CodomainSet}
    (isPreimage : IsPreimageOf preimageSet map target)
    {input : DomainElement}
    (valueInTarget : map input ∈ target) :
    input ∈ preimageSet :=
  (isPreimage input).mpr valueInTarget

/--
Membership in a preimage predicate means the input's value lies in the target.
-/
theorem TargetMemberOfPreimageMember
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {preimageSet : DomainSet}
    {map : TypedMap DomainElement CodomainElement}
    {target : CodomainSet}
    (isPreimage : IsPreimageOf preimageSet map target)
    {input : DomainElement}
    (inputInPreimage : input ∈ preimageSet) :
    map input ∈ target :=
  (isPreimage input).mp inputInPreimage

/--
The preimage of a singleton-like target is exactly the fiber over its point.
-/
theorem IsPreimageOfSingletonLikeIffIsFiberOf
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {preimageSet : DomainSet}
    {map : TypedMap DomainElement CodomainElement}
    {target : CodomainSet}
    {output : CodomainElement}
    (singletonLike :
      forall value : CodomainElement, value ∈ target <-> value = output) :
    IsPreimageOf preimageSet map target <->
      LRA.Map.Fiber.IsFiberOf preimageSet map output := by
  constructor
  · intro isPreimage input
    calc
      input ∈ preimageSet <-> map input ∈ target := isPreimage input
      _ <-> map input = output := singletonLike (map input)
  · intro isFiber input
    calc
      input ∈ preimageSet <-> map input = output := isFiber input
      _ <-> map input ∈ target := (singletonLike (map input)).symm

end LRA.Map.Preimage
