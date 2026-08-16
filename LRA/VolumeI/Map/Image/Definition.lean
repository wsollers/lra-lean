import LRA.VolumeI.Map.Typed.Definition
import LRA.VolumeI.Set.Interface.Membership
import LRA.VolumeI.Set.Interface.Operations

namespace LRA.Map.Image

open LRA.Set
open LRA.Map.Typed

universe u₁ u₂ v₁ v₂

section Image

variable {DomainElement : Type u₁} {CodomainElement : Type u₂}
variable {DomainSet : Type v₁} {CodomainSet : Type v₂}
variable [Membership DomainElement DomainSet]
variable [Membership CodomainElement CodomainSet]

/--
**[Definition — MapsInto]**

`map` sends the source set into the target set. This is the set-containment
form used by neighborhood definitions of continuity and limit statements.

Logical form:

```lean
def MapsInto
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) : Prop
```
-/
def MapsInto
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) : Prop :=
  forall input : DomainElement, input ∈ source -> map input ∈ target

/--
**[Definition — IsImageOf]**

A set is the direct image of a source set under a typed map when its members
are exactly the codomain elements hit by members of the source.

Logical form:

```lean
def IsImageOf
    (imageSet : CodomainSet)
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : Prop
```
-/
def IsImageOf
    (imageSet : CodomainSet)
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : Prop :=
  forall output : CodomainElement,
    output ∈ imageSet <->
      exists input : DomainElement, input ∈ source /\ map input = output

section WithSeparation

variable [HasSeparation CodomainElement CodomainSet]
variable [HasUniversal CodomainSet]

/--
**[Definition — Image]**

The direct image of a source set under a typed map, formed by separating from
the codomain universe.

Logical form:

```lean
def Image
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : CodomainSet
```
-/
def Image
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : CodomainSet :=
  HasSeparation.separation (𝒰 : CodomainSet)
    (fun output : CodomainElement =>
      exists input : DomainElement, input ∈ source /\ map input = output)

/--
**[Definition — DirectImage]**

Alias emphasizing the forward direction of image.

Logical form:

```lean
def DirectImage
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : CodomainSet
```
-/
def DirectImage
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : CodomainSet :=
  Image map source

/--
**[Definition — Range]**

The range of a typed map, represented as the image of an ambient domain set.

Logical form:

```lean
def Range
    (map : TypedMap DomainElement CodomainElement)
    (ambientDomain : DomainSet) : CodomainSet
```
-/
def Range
    (map : TypedMap DomainElement CodomainElement)
    (ambientDomain : DomainSet) : CodomainSet :=
  Image map ambientDomain

end WithSeparation

end Image

section FiniteImage

variable {DomainElement : Type u₁} {CodomainElement : Type u₂}
variable {DomainSet : Type v₁}
variable [Membership DomainElement DomainSet]

/--
**[Definition — FinitelyEnumerates]**

A finite list exactly enumerates the elements satisfying a predicate. This is
the project-local finiteness witness used for finite image/range statements,
without importing Mathlib's finite-set API.

Logical form:

```lean
def FinitelyEnumerates
    (values : List Element)
    (predicate : Element -> Prop) : Prop
```
-/
def FinitelyEnumerates
    {Element : Type u₁}
    (values : List Element)
    (predicate : Element -> Prop) : Prop :=
  forall value : Element, value ∈ values <-> predicate value

/--
**[Definition — HasFiniteEnumeration]**

A predicate describes a finite collection when some finite list exactly
enumerates its satisfying elements.

Logical form:

```lean
def HasFiniteEnumeration
    (predicate : Element -> Prop) : Prop
```
-/
def HasFiniteEnumeration
    {Element : Type u₁}
    (predicate : Element -> Prop) : Prop :=
  exists values : List Element, FinitelyEnumerates values predicate

/--
**[Definition — FiniteImage]**

The image of a source set is finite when the codomain values hit by source
members have a finite list enumeration.

Logical form:

```lean
def FiniteImage
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : Prop
```
-/
def FiniteImage
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : Prop :=
  HasFiniteEnumeration
    (fun output : CodomainElement =>
      exists input : DomainElement, input ∈ source /\ map input = output)

/--
**[Definition — FiniteRange]**

The range of a map is finite relative to a chosen ambient domain.

Logical form:

```lean
def FiniteRange
    (map : TypedMap DomainElement CodomainElement)
    (ambientDomain : DomainSet) : Prop
```
-/
def FiniteRange
    (map : TypedMap DomainElement CodomainElement)
    (ambientDomain : DomainSet) : Prop :=
  FiniteImage map ambientDomain

/--
**[Abbreviation — FiniteRangeOn]**

Sources: Tao's measure-theory discussion of simple functions is phrased in
terms of finite image/range.

Logical form:

```lean
abbrev FiniteRangeOn
    (map : TypedMap DomainElement CodomainElement)
    (ambientDomain : DomainSet) : Prop
```
-/
abbrev FiniteRangeOn
    (map : TypedMap DomainElement CodomainElement)
    (ambientDomain : DomainSet) : Prop :=
  FiniteRange map ambientDomain

end FiniteImage

end LRA.Map.Image
