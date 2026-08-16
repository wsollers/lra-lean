import LRA.VolumeI.Map.Image.Definition

namespace LRA.Map.Image

open LRA.Map.Typed

universe u₁ u₂ v₁ v₂

variable {DomainElement : Type u₁} {CodomainElement : Type u₂}
variable {DomainSet : Type v₁} {CodomainSet : Type v₂}
variable [Membership DomainElement DomainSet]
variable [Membership CodomainElement CodomainSet]
variable [LRA.Set.HasSeparation CodomainElement CodomainSet]
variable [LRA.Set.HasUniversal CodomainSet]

/--
Sources: Tao (*Analysis I*) uses "forward image" to distinguish `f(S)` from
the inverse image notation `f⁻¹(U)`.
-/
abbrev ForwardImage
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : CodomainSet :=
  Image map source

/--
Sources: Sohrab (*Basic Real Analysis*) and Hilgert (*Mathematical
Structures*) use "direct image" for the set image operation.
-/
abbrev DirectImageOfSet
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : CodomainSet :=
  Image map source

/--
Sources: measure texts use "pushforward" for measures built from preimages;
this set-level alias records the same forward direction without introducing
measure structure here.
-/
abbrev PushforwardSet
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : CodomainSet :=
  Image map source

/--
Sources: Zorich and Bruckner/Thomson use containment formulations such as
`f(U) ⊆ V` in continuity and limit statements.
-/
abbrev MapsSetInto
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) : Prop :=
  MapsInto map source target

/--
Sources: neighborhood-style analysis often says that a map "carries" one set
into another.
-/
abbrev CarriesInto
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) : Prop :=
  MapsInto map source target

/--
Sources: Tao's measure-theory discussion of simple functions is phrased in
terms of finite image/range.
-/
abbrev FiniteRangeOn
    (map : TypedMap DomainElement CodomainElement)
    (ambientDomain : DomainSet) : Prop :=
  FiniteRange map ambientDomain

end LRA.Map.Image
