import LRA.Function.Calculus.Definition
import LRA.VolumeI.Map.Typed.Definition
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Operations

namespace LRA.Map.Fiber

open LRA.Set
open LRA.Map.Typed

universe u v w

/-- Historical typed-map spelling of the canonical function fiber class. -/
abbrev Fiber {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain)
    (output : Codomain) : Domain → Prop :=
  LRA.Function.FiberClass (LRA.Function.OfTypedFunction map) output

/-- Historical set-backed spelling of canonical fiber characterization. -/
def IsFiberOf {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w}
    [Membership Domain DomainSet]
    (fiberSet : DomainSet)
    (map : TypedMap Domain Codomain)
    (output : Codomain) : Prop :=
  LRA.Function.IsFiberClassOf
    (fun input => input ∈ fiberSet)
    (LRA.Function.OfTypedFunction map)
    output

/-- Legacy backend realization of a fiber inside an explicit ambient domain. -/
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

/-- Legacy backend realization of a fiber by Separation from a universal set. -/
def FiberSet
    (map : TypedMap Domain Codomain)
    (output : Codomain) : DomainSet :=
  HasSeparation.separation (𝒰 : DomainSet)
    (fun input : Domain => map input = output)

end WithSeparation

/-- Historical typed-map spelling of the canonical kernel relation. -/
abbrev KernelRelation {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Domain → Domain → Prop :=
  LRA.Function.KernelRelation (LRA.Function.OfTypedFunction map)

/-- Historical set-backed spelling of saturation by function fibers. -/
def SaturatedBy {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w}
    [Membership Domain DomainSet]
    (subset : DomainSet)
    (map : TypedMap Domain Codomain) : Prop :=
  LRA.Function.SaturatedBy
    (fun input => input ∈ subset)
    (LRA.Function.OfTypedFunction map)

end LRA.Map.Fiber
