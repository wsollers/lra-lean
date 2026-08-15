import LRA.VolumeI.Relations.Basic.Relations
import LRA.VolumeI.Set.Interface.Operations

namespace LRA

universe u v w

/-- A typed function with independent domain and codomain universes. -/
abbrev Function (Domain : Type u) (Codomain : Type v) := Domain → Codomain

namespace Function

open LRA.Set

/-- The graph relation determined by a typed function. -/
def Graph {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) :
    LRA.Relation.HeterogeneousRelation Domain Codomain :=
  fun input output => map input = output

/-- A binary relation is single-valued as a graph. -/
def SingleValued {Domain : Type u} {Codomain : Type v}
    (graph : LRA.Relation.HeterogeneousRelation Domain Codomain) : Prop :=
  ∀ input firstOutput secondOutput,
    graph input firstOutput → graph input secondOutput → firstOutput = secondOutput

/-- A binary relation is total over its domain. -/
def TotalOverDomain {Domain : Type u} {Codomain : Type v}
    (graph : LRA.Relation.HeterogeneousRelation Domain Codomain) : Prop :=
  ∀ input, ∃ output, graph input output

/-- A relation presents a typed function when it is total and single-valued. -/
def FunctionAsRelation {Domain : Type u} {Codomain : Type v}
    (graph : LRA.Relation.HeterogeneousRelation Domain Codomain) : Prop :=
  TotalOverDomain graph ∧ SingleValued graph

/-- The domain of a graph, separated from an ambient backend set. -/
def DomainOfGraph {Element : Type u} {Codomain : Type v}
    {SetObject : Type w} [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (graph : LRA.Relation.HeterogeneousRelation Element Codomain) : SetObject :=
  HasSeparation.separation ambientDomain
    (fun input => ∃ output, graph input output)

/-- The range of a graph, separated from an ambient backend set. -/
def RangeOfGraph {Domain : Type u} {Element : Type v}
    {SetObject : Type w} [HasSeparation Element SetObject]
    (ambientCodomain : SetObject)
    (graph : LRA.Relation.HeterogeneousRelation Domain Element) : SetObject :=
  HasSeparation.separation ambientCodomain
    (fun output => ∃ input, graph input output)

end Function
end LRA
