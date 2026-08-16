import LRA.VolumeI.Map.Typed.Definition
import LRA.VolumeI.Relations.Basic.Relations
import LRA.VolumeI.Set.Interface.Operations

namespace LRA.Map.Graph

open LRA.Map.Typed
open LRA.Set

universe u v w

/--
The graph relation determined by a typed map.
-/
def Graph {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    LRA.Relation.HeterogeneousRelation Domain Codomain :=
  fun input output => map input = output

/--
A heterogeneous relation is single-valued when each input has at most one
related output.
-/
def SingleValued {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousRelation Domain Codomain) : Prop :=
  forall input firstOutput secondOutput,
    relation input firstOutput ->
    relation input secondOutput ->
    firstOutput = secondOutput

/--
A heterogeneous relation is total over its domain when every input has a
related output.
-/
def TotalOverDomain {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousRelation Domain Codomain) : Prop :=
  forall input, exists output, relation input output

/--
A relation presents a typed map when it is total and single-valued.
-/
def FunctionalRelation {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousRelation Domain Codomain) : Prop :=
  TotalOverDomain relation /\ SingleValued relation

/--
The domain of a graph relation, separated from an ambient backend set.
-/
def DomainOfGraph {Element : Type u} {Codomain : Type v}
    {SetObject : Type w}
    [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (graph : LRA.Relation.HeterogeneousRelation Element Codomain) :
    SetObject :=
  HasSeparation.separation ambientDomain
    (fun input => exists output, graph input output)

/--
The range of a graph relation, separated from an ambient backend set.
-/
def RangeOfGraph {Domain : Type u} {Element : Type v}
    {SetObject : Type w}
    [HasSeparation Element SetObject]
    (ambientCodomain : SetObject)
    (graph : LRA.Relation.HeterogeneousRelation Domain Element) :
    SetObject :=
  HasSeparation.separation ambientCodomain
    (fun output => exists input, graph input output)

end LRA.Map.Graph
