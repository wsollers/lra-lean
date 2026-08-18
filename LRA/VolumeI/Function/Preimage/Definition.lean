import LRA.VolumeI.Function.Typed.Definition
import LRA.VolumeI.Set.Interface.Membership
import LRA.VolumeI.Set.Interface.Operations

namespace LRA.Function.Preimage

open LRA.Set
open LRA.Function

universe u₁ u₂ v₁ v₂

section Preimage

variable {DomainElement : Type u₁} {CodomainElement : Type u₂}
variable {DomainSet : Type v₁} {CodomainSet : Type v₂}
variable [Membership DomainElement DomainSet]
variable [Membership CodomainElement CodomainSet]

/--
**[Definition — IsPreimageOf]**

A set is the preimage of a target set under a typed function when its members are
exactly the domain elements whose values lie in the target.

Logical form:

```lean
def IsPreimageOf
    (preimageSet : DomainSet)
    (map : Function DomainElement CodomainElement)
    (target : CodomainSet) : Prop
```
-/
def IsPreimageOf
    (preimageSet : DomainSet)
    (map : Function DomainElement CodomainElement)
    (target : CodomainSet) : Prop :=
  forall input : DomainElement, input ∈ preimageSet <-> map input ∈ target

section WithSeparation

variable [HasSeparation DomainElement DomainSet]
variable [HasUniversal DomainSet]

/--
**[Definition — Preimage]**

The preimage of a target set under a typed function, formed by separating from the
domain universe.

Logical form:

```lean
def Preimage
    (map : Function DomainElement CodomainElement)
    (target : CodomainSet) : DomainSet
```
-/
def Preimage
    (map : Function DomainElement CodomainElement)
    (target : CodomainSet) : DomainSet :=
  HasSeparation.separation (𝒰 : DomainSet)
    (fun input : DomainElement => map input ∈ target)

end WithSeparation

end Preimage

end LRA.Function.Preimage
