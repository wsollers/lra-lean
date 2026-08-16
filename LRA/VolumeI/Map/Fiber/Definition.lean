import LRA.VolumeI.Map.Typed.Definition
import LRA.VolumeI.Set.Interface.Membership
import LRA.VolumeI.Set.Interface.Operations

namespace LRA.Map.Fiber

open LRA.Set
open LRA.Map.Typed

universe u v w

/--
The predicate fiber of a typed map over a codomain element.
-/
def Fiber {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (output : Codomain) : Domain -> Prop :=
  fun input => map input = output

/--
A backend set is the fiber of a typed map over an output when its members are
exactly the inputs mapped to that output.
-/
def IsFiberOf {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w}
    [Membership Domain DomainSet]
    (fiberSet : DomainSet)
    (map : TypedMap Domain Codomain)
    (output : Codomain) : Prop :=
  forall input : Domain, input ∈ fiberSet <-> map input = output

/--
The fiber over one codomain value, separated from an explicit ambient domain.
-/
def AmbientFiber {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w}
    [HasSeparation Domain DomainSet]
    (ambientDomain : DomainSet)
    (map : TypedMap Domain Codomain)
    (output : Codomain) : DomainSet :=
  HasSeparation.separation ambientDomain
    (fun input : Domain => map input = output)

section WithSeparation

variable {Domain : Type u} {Codomain : Type v} {DomainSet : Type w}
variable [Membership Domain DomainSet]
variable [HasSeparation Domain DomainSet]
variable [HasUniversal DomainSet]

/--
The backend set fiber of a typed map over an output.
-/
def FiberSet
    (map : TypedMap Domain Codomain)
    (output : Codomain) : DomainSet :=
  HasSeparation.separation (𝒰 : DomainSet)
    (fun input : Domain => map input = output)

end WithSeparation

/--
The kernel relation of a typed map: two inputs are related when the map sends
them to the same output.
-/
def KernelRelation {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Domain -> Domain -> Prop :=
  fun left right => map left = map right

/--
A backend set is saturated by a map when it contains every fiber-mate of each
of its members.
-/
def SaturatedBy {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w}
    [Membership Domain DomainSet]
    (subset : DomainSet)
    (map : TypedMap Domain Codomain) : Prop :=
  forall input fiberMate : Domain,
    input ∈ subset ->
    map input = map fiberMate ->
    fiberMate ∈ subset

end LRA.Map.Fiber
