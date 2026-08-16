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
**[Abbreviation — ForwardImage]**

Sources: Tao (*Analysis I*) uses "forward image" to distinguish `f(S)` from
the inverse image notation `f⁻¹(U)`.

Logical form:

```lean
abbrev ForwardImage
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : CodomainSet
```
-/
abbrev ForwardImage
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : CodomainSet :=
  Image map source

/--
**[Abbreviation — DirectImageOfSet]**

Sources: Sohrab (*Basic Real Analysis*) and Hilgert (*Mathematical
Structures*) use "direct image" for the set image operation.

Logical form:

```lean
abbrev DirectImageOfSet
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : CodomainSet
```
-/
abbrev DirectImageOfSet
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : CodomainSet :=
  Image map source

/--
**[Abbreviation — PushforwardSet]**

Sources: measure texts use "pushforward" for measures built from preimages;
this set-level alias records the same forward direction without introducing
measure structure here.

Logical form:

```lean
abbrev PushforwardSet
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : CodomainSet
```
-/
abbrev PushforwardSet
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : CodomainSet :=
  Image map source

/--
**[Abbreviation — MapsSetInto]**

Sources: Zorich and Bruckner/Thomson use containment formulations such as
`f(U) ⊆ V` in continuity and limit statements.

Logical form:

```lean
abbrev MapsSetInto
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) : Prop
```
-/
abbrev MapsSetInto
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) : Prop :=
  MapsInto map source target

/--
**[Abbreviation — CarriesInto]**

Sources: neighborhood-style analysis often says that a map "carries" one set
into another.

Logical form:

```lean
abbrev CarriesInto
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) : Prop
```
-/
abbrev CarriesInto
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) : Prop :=
  MapsInto map source target

end LRA.Map.Image
