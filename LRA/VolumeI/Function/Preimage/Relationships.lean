import LRA.VolumeI.Function.Preimage.Theorems
import LRA.VolumeI.Function.Preimage.Definition
import LRA.VolumeI.Function.Fiber.Definition

namespace LRA.Function.Preimage

open LRA.Set
open LRA.Function

universe u₁ u₂ v₁ v₂

/--
**[Theorem — PreimageContainsInputOfTargetMember]**

If an input maps into the target, then it belongs to any set satisfying the
preimage predicate.

Logical form:

```lean
theorem PreimageContainsInputOfTargetMember
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {preimageSet : DomainSet}
    {map : Function DomainElement CodomainElement}
    {target : CodomainSet}
    (isPreimage : IsPreimageOf preimageSet map target)
    {input : DomainElement}
    (valueInTarget : map input ∈ target) :
    input ∈ preimageSet
```
-/
theorem PreimageContainsInputOfTargetMember
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {preimageSet : DomainSet}
    {map : Function DomainElement CodomainElement}
    {target : CodomainSet}
    (isPreimage : IsPreimageOf preimageSet map target)
    {input : DomainElement}
    (valueInTarget : map input ∈ target) :
    input ∈ preimageSet := by
  sorry
/--
**[Theorem — TargetMemberOfPreimageMember]**

Membership in a preimage predicate means the input's value lies in the target.

Logical form:

```lean
theorem TargetMemberOfPreimageMember
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {preimageSet : DomainSet}
    {map : Function DomainElement CodomainElement}
    {target : CodomainSet}
    (isPreimage : IsPreimageOf preimageSet map target)
    {input : DomainElement}
    (inputInPreimage : input ∈ preimageSet) :
    map input ∈ target
```
-/
theorem TargetMemberOfPreimageMember
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {preimageSet : DomainSet}
    {map : Function DomainElement CodomainElement}
    {target : CodomainSet}
    (isPreimage : IsPreimageOf preimageSet map target)
    {input : DomainElement}
    (inputInPreimage : input ∈ preimageSet) :
    map input ∈ target := by
  sorry
/--
**[Theorem — IsPreimageOfSingletonLikeIffIsFiberOf]**

The preimage of a singleton-like target is exactly the fiber over its point.

Logical form:

```lean
theorem IsPreimageOfSingletonLikeIffIsFiberOf
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {preimageSet : DomainSet}
    {map : Function DomainElement CodomainElement}
    {target : CodomainSet}
    {output : CodomainElement}
    (singletonLike :
      forall value : CodomainElement, value ∈ target <-> value = output) :
    IsPreimageOf preimageSet map target <->
      LRA.Function.Fiber.IsFiberOf preimageSet map output
```
-/
theorem IsPreimageOfSingletonLikeIffIsFiberOf
    {DomainElement : Type u₁} {CodomainElement : Type u₂}
    {DomainSet : Type v₁} {CodomainSet : Type v₂}
    [Membership DomainElement DomainSet]
    [Membership CodomainElement CodomainSet]
    {preimageSet : DomainSet}
    {map : Function DomainElement CodomainElement}
    {target : CodomainSet}
    {output : CodomainElement}
    (singletonLike :
      forall value : CodomainElement, value ∈ target <-> value = output) :
    IsPreimageOf preimageSet map target <->
      LRA.Function.Fiber.IsFiberOf preimageSet map output := by
  sorry
end LRA.Function.Preimage
