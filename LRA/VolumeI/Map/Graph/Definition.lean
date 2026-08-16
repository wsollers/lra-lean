import LRA.VolumeI.Map.Typed.Definition
import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.Map.Graph

open LRA.Map.Typed

universe u v

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

end LRA.Map.Graph
