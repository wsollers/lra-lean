import LRA.Function.Definition
import LRA.Set.Interface.Operations

namespace LRA.Map.Graph

open LRA.Set
universe u v w

/-- Historical spelling for the graph relation of a typed function. -/
abbrev Graph {Domain : Type u} {Codomain : Type v}
    (map : LRA.Function Domain Codomain) :
    LRA.Relation.HeterogeneousBinaryRelation Domain Codomain :=
  LRA.Function.Graph map

/-- Historical spelling for single-valuedness. -/
abbrev SingleValued {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  LRA.Function.SingleValued relation

/-- Historical spelling for totality over the source type. -/
abbrev TotalOverDomain {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  LRA.Function.Total relation

/-- Historical spelling for the defining function-relation condition. -/
abbrev FunctionalRelation {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  LRA.Function.IsFunctionRelation relation

/-!
The following two definitions are legacy backend adapters. Canonical Function
calculus uses backend-neutral `SetClass` domain/range classes inherited from
Relation calculus.
-/

def DomainOfGraph {Element : Type u} {Codomain : Type v}
    {SetObject : Type w}
    [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (graph : LRA.Relation.HeterogeneousBinaryRelation Element Codomain) :
    SetObject :=
  HasSeparation.separation ambientDomain
    (fun input => ∃ output, graph input output)

def RangeOfGraph {Domain : Type u} {Element : Type v}
    {SetObject : Type w}
    [HasSeparation Element SetObject]
    (ambientCodomain : SetObject)
    (graph : LRA.Relation.HeterogeneousBinaryRelation Domain Element) :
    SetObject :=
  HasSeparation.separation ambientCodomain
    (fun output => ∃ input, graph input output)

end LRA.Map.Graph
