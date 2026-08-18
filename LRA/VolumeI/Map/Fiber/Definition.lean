import LRA.Function.Calculus.Classes.Definition
import LRA.Set.Interface.Membership
import LRA.Set.Interface.Operations
import LRA.Function.Definition

namespace LRA.Map.Fiber

open LRA.Set

universe u v w

/-- Historical typed-map spelling of the canonical function fiber class. -/
abbrev Fiber {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain)
    (output : Codomain) : Domain → Prop :=
  LRA.Function.FiberClass (map) output

/-- Historical set-backed spelling of canonical fiber characterization. -/
def IsFiberOf {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w}
    [Membership Domain DomainSet]
    (fiberSet : DomainSet)
    (map : LRA.Function Domain Codomain)
    (output : Codomain) : Prop :=
  LRA.Function.IsFiberClassOf
    (fun input => input ∈ fiberSet)
    (map)
    output

/-- Legacy backend realization of a fiber inside an explicit ambient domain. -/
def AmbientFiber {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w}
    [HasSeparation Domain DomainSet]
    (ambientDomain : DomainSet)
    (map : LRA.Function Domain Codomain)
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
    (map : LRA.Function Domain Codomain)
    (output : Codomain) : DomainSet :=
  HasSeparation.separation (𝒰 : DomainSet)
    (fun input : Domain => map input = output)

end WithSeparation

/-- Historical typed-map spelling of the canonical kernel relation. -/
abbrev KernelRelation {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) : Domain → Domain → Prop :=
  LRA.Function.KernelRelation (map)

/-- Historical set-backed spelling of saturation by function fibers. -/
def SaturatedBy {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w}
    [Membership Domain DomainSet]
    (subset : DomainSet)
    (map : LRA.Function Domain Codomain) : Prop :=
  LRA.Function.SaturatedBy
    (fun input => input ∈ subset)
    (map)

end LRA.Map.Fiber
