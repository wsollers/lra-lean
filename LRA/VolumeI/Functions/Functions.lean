import LRA.VolumeI.Relations.Basic.Relations
import LRA.VolumeI.Set.Products

namespace LRA.VolumeI.Functions

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

/-- The domain predicate of a graph relation. -/
def DomainOfGraph {Domain Codomain : Type u}
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Domain Codomain) :
    LRA.VolumeI.Set.LRASet Domain :=
  fun input => exists output, graph input output

/-- The codomain predicate hit by a graph relation. -/
def RangeOfGraph {Domain Codomain : Type u}
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Domain Codomain) :
    LRA.VolumeI.Set.LRASet Codomain :=
  fun output => exists input, graph input output

end LRA.VolumeI.Functions
