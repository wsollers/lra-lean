import LRA.VolumeI.Map.Typed.Definition
import LRA.VolumeI.Set.Interface.Membership

namespace LRA.Map.Inverse

open LRA.Map.Typed
open LRA.Set

universe u v w₁ w₂

/--
`inverse` is a left inverse of `map` when it recovers every input after
applying `map`.
-/
def LeftInverse {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain) : Prop :=
  forall input, inverse (map input) = input

/--
`inverse` is a right inverse of `map` when `map` recovers every codomain value
after applying `inverse`.
-/
def RightInverse {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain) : Prop :=
  forall output, map (inverse output) = output

/--
`inverse` is a left inverse of `map` on a specified source set.
-/
def LeftInverseOn {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w₁} [Membership Domain DomainSet]
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain)
    (source : DomainSet) : Prop :=
  forall input, input ∈ source -> inverse (map input) = input

/--
`inverse` is a right inverse of `map` on a specified target set.
-/
def RightInverseOn {Domain : Type u} {Codomain : Type v}
    {CodomainSet : Type w₂} [Membership Codomain CodomainSet]
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain)
    (target : CodomainSet) : Prop :=
  forall output, output ∈ target -> map (inverse output) = output

/--
`inverse` is a two-sided inverse of `map`.
-/
def TwoSidedInverse {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain) : Prop :=
  LeftInverse map inverse /\ RightInverse map inverse

/--
`inverse` is the inverse function of `map` when it is a two-sided inverse.
This is deliberately a predicate: the preimage operation exists for every
map, while an inverse function exists only after bijectivity data.
-/
def IsInverseFunction {Domain : Type u} {Codomain : Type v}
    (inverse : TypedMap Codomain Domain)
    (map : TypedMap Domain Codomain) : Prop :=
  TwoSidedInverse map inverse

/--
`inverse` is a two-sided inverse between a source set and a target set.
When the target is the direct image of the source, this is the ordinary
"inverse on the image" convention.
-/
def TwoSidedInverseOn {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w₁} {CodomainSet : Type w₂}
    [Membership Domain DomainSet] [Membership Codomain CodomainSet]
    (map : TypedMap Domain Codomain)
    (inverse : TypedMap Codomain Domain)
    (source : DomainSet)
    (target : CodomainSet) : Prop :=
  LeftInverseOn map inverse source /\ RightInverseOn map inverse target

/--
A packaged inverse function: a map in the reverse direction together with the
two cancellation laws.
-/
structure InverseFunction {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) where
  inverse : TypedMap Codomain Domain
  isInverse : IsInverseFunction inverse map

end LRA.Map.Inverse
