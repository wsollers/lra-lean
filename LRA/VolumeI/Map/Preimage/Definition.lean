import LRA.VolumeI.Map.Typed.Definition
import LRA.VolumeI.Set.Interface.Membership
import LRA.VolumeI.Set.Interface.Operations

namespace LRA.Map.Preimage

open LRA.Set
open LRA.Map.Typed

universe u₁ u₂ v₁ v₂

section Preimage

variable {DomainElement : Type u₁} {CodomainElement : Type u₂}
variable {DomainSet : Type v₁} {CodomainSet : Type v₂}
variable [Membership DomainElement DomainSet]
variable [Membership CodomainElement CodomainSet]

/--
A set is the preimage of a target set under a typed map when its members are
exactly the domain elements whose values lie in the target.
-/
def IsPreimageOf
    (preimageSet : DomainSet)
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) : Prop :=
  forall input : DomainElement, input ∈ preimageSet <-> map input ∈ target

section WithSeparation

variable [HasSeparation DomainElement DomainSet]
variable [HasUniversal DomainSet]

/--
The preimage of a target set under a typed map, formed by separating from the
domain universe.
-/
def Preimage
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) : DomainSet :=
  HasSeparation.separation (𝒰 : DomainSet)
    (fun input : DomainElement => map input ∈ target)

/--
Alias emphasizing inverse image notation.
-/
def InverseImage
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) : DomainSet :=
  Preimage map target

end WithSeparation

end Preimage

end LRA.Map.Preimage
