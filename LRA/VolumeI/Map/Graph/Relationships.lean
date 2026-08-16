import LRA.VolumeI.Map.Graph.Theorems
import LRA.VolumeI.Map.Graph.Definition

namespace LRA.Map.Graph

open LRA.Map.Typed

universe u v

/--
The graph relation of a typed map is single-valued.
-/
theorem GraphSingleValued
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    SingleValued (Graph map) := by
  intro input firstOutput secondOutput firstHit secondHit
  calc
    firstOutput = map input := firstHit.symm
    _ = secondOutput := secondHit

/--
The graph relation of a typed map is total over the map's domain.
-/
theorem GraphTotalOverDomain
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    TotalOverDomain (Graph map) := by
  intro input
  exact ⟨map input, rfl⟩

/--
The graph relation of a typed map is functional.
-/
theorem GraphFunctionalRelation
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    FunctionalRelation (Graph map) :=
  ⟨GraphTotalOverDomain map, GraphSingleValued map⟩

end LRA.Map.Graph
