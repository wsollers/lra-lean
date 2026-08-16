import LRA.VolumeI.Map.Graph.Definition

namespace LRA.Map.Graph

universe u v

/--
Sources: Enderton, Hamilton, and Sohrab describe a function as a
single-valued relation.
-/
abbrev SingleValuedRelation {Domain : Type u} {Codomain : Type v} :=
  SingleValued (Domain := Domain) (Codomain := Codomain)

/--
Sources: logic and computability texts contrast partial functions with total
functions; in the graph convention, totality is `TotalOverDomain`.
-/
abbrev TotalRelation {Domain : Type u} {Codomain : Type v} :=
  TotalOverDomain (Domain := Domain) (Codomain := Codomain)

/--
Sources: logic texts often call a relation functional when it determines at
most one output for each input.
-/
abbrev Functional {Domain : Type u} {Codomain : Type v} :=
  SingleValued (Domain := Domain) (Codomain := Codomain)

/--
Sources: set-theory texts identify the graph of a function with the function
itself in the relation convention.
-/
abbrev FunctionGraph {Domain : Type u} {Codomain : Type v}
    (map : LRA.Map.Typed.TypedMap Domain Codomain) :=
  Graph map

end LRA.Map.Graph
