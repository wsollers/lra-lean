import LRA.VolumeI.Relations.Basic.Relations
import LRA.VolumeI.Set.Interface.Operations

namespace LRA.VolumeI.Functions

open LRA.VolumeI.Set

universe u v

/-- A function from one carrier to another. -/
abbrev Function (Domain Codomain : Type u) := Domain -> Codomain

/-- The graph relation determined by a function. -/
def Graph {Domain Codomain : Type u}
    (map : Function Domain Codomain) :
    LRA.VolumeI.Relations.HeterogeneousRelation Domain Codomain :=
  fun input output => map input = output

/-- A binary relation is single-valued as a graph. -/
def SingleValued {Domain Codomain : Type u}
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Domain Codomain) : Prop :=
  forall input firstOutput secondOutput,
    graph input firstOutput -> graph input secondOutput -> firstOutput = secondOutput

/-- A binary relation is total over its domain as a graph. -/
def TotalOverDomain {Domain Codomain : Type u}
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Domain Codomain) : Prop :=
  forall input, exists output, graph input output

/-- A relation presents a function exactly when it is total and single-valued. -/
def FunctionAsRelation {Domain Codomain : Type u}
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Domain Codomain) : Prop :=
  TotalOverDomain graph /\ SingleValued graph

/-- The domain set of a graph relation: the members of the ambient domain
that the graph relates to at least one output.

Generic over any set backend with separation -- the backend is inferred
from `ambientDomain`'s type, so this works for Enderton sets and predicate
sets alike, with no interface record threaded through. -/
def DomainOfGraph {Element : Type u} {SetObject : Type v} {Codomain : Type u}
    [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Element Codomain) :
    SetObject :=
  HasSeparation.separation ambientDomain
    (fun input => exists output, graph input output)

/-- The codomain set hit by a graph relation: the members of the ambient
codomain that the graph reaches from at least one input. -/
def RangeOfGraph {Element : Type u} {SetObject : Type v} {Domain : Type u}
    [HasSeparation Element SetObject]
    (ambientCodomain : SetObject)
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Domain Element) :
    SetObject :=
  HasSeparation.separation ambientCodomain
    (fun output => exists input, graph input output)

end LRA.VolumeI.Functions
