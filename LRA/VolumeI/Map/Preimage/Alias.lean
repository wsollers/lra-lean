import LRA.VolumeI.Map.Preimage.Definition

namespace LRA.Map.Preimage

open LRA.Map.Typed

universe u₁ u₂ v₁ v₂

variable {DomainElement : Type u₁} {CodomainElement : Type u₂}
variable {DomainSet : Type v₁} {CodomainSet : Type v₂}
variable [Membership DomainElement DomainSet]
variable [Membership CodomainElement CodomainSet]
variable [LRA.Set.HasSeparation DomainElement DomainSet]
variable [LRA.Set.HasUniversal DomainSet]

/--
Sources: Faris, Shurman, Evans, and many topology texts use "inverse image"
for set preimage. This does not assert that `map` has an inverse function.
-/
abbrev InverseImageOfSet
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) : DomainSet :=
  Preimage map target

/--
Sources: category/topology usage often calls inverse image a pullback of
subsets along a map.
-/
abbrev PullbackSet
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) : DomainSet :=
  Preimage map target

/--
Sources: older set-theory texts sometimes use "counterimage" for inverse
image; LRA keeps `Preimage` canonical.
-/
abbrev Counterimage
    (map : TypedMap DomainElement CodomainElement)
    (target : CodomainSet) : DomainSet :=
  Preimage map target

end LRA.Map.Preimage
