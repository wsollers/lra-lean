import LRA.VolumeI.Map.Typed.Definition
import LRA.VolumeI.Set.Interface.Membership
import LRA.VolumeI.Set.Interface.Operations
import Mathlib.Data.Set.Finite.Basic

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
**[Definition — FiniteImage]**

The image of a source set is finite, stated independently of any particular
set-object backend.

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
  Set.Finite
    {output : CodomainElement |
      exists input : DomainElement, input ∈ source /\ map input = output}

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

/--
**[Definition — FiniteRange]**

The range of a map is finite, relative to the chosen ambient domain.

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

end WithSeparation

end Image

end LRA.Map.Image
