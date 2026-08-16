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
`map` sends the source set into the target set. This is the set-containment
form used by neighborhood definitions of continuity and limit statements.
-/
def MapsInto
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet)
    (target : CodomainSet) : Prop :=
  forall input : DomainElement, input ∈ source -> map input ∈ target

/--
The image of a source set is finite, stated independently of any particular
set-object backend.
-/
def FiniteImage
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : Prop :=
  Set.Finite
    {output : CodomainElement |
      exists input : DomainElement, input ∈ source /\ map input = output}

/--
A set is the direct image of a source set under a typed map when its members
are exactly the codomain elements hit by members of the source.
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
The direct image of a source set under a typed map, formed by separating from
the codomain universe.
-/
def Image
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : CodomainSet :=
  HasSeparation.separation (𝒰 : CodomainSet)
    (fun output : CodomainElement =>
      exists input : DomainElement, input ∈ source /\ map input = output)

/--
Alias emphasizing the forward direction of image.
-/
def DirectImage
    (map : TypedMap DomainElement CodomainElement)
    (source : DomainSet) : CodomainSet :=
  Image map source

/--
The range of a typed map, represented as the image of an ambient domain set.
-/
def Range
    (map : TypedMap DomainElement CodomainElement)
    (ambientDomain : DomainSet) : CodomainSet :=
  Image map ambientDomain

/--
The range of a map is finite, relative to the chosen ambient domain.
-/
def FiniteRange
    (map : TypedMap DomainElement CodomainElement)
    (ambientDomain : DomainSet) : Prop :=
  FiniteImage map ambientDomain

end WithSeparation

end Image

end LRA.Map.Image
