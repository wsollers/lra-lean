import LRA.VolumeI.Map.Graph.Definition

namespace LRA.Map.Graph

universe u v

/--
**[Abbreviation — SingleValuedRelation]**

Sources: Enderton, Hamilton, and Sohrab describe a function as a
single-valued relation.

Logical form:

```lean
abbrev SingleValuedRelation {Domain : Type u} {Codomain : Type v}
```
-/
abbrev SingleValuedRelation {Domain : Type u} {Codomain : Type v} :=
  SingleValued (Domain := Domain) (Codomain := Codomain)

/--
**[Abbreviation — TotalRelation]**

Sources: logic and computability texts contrast partial functions with total
functions; in the graph convention, totality is `TotalOverDomain`.

Logical form:

```lean
abbrev TotalRelation {Domain : Type u} {Codomain : Type v}
```
-/
abbrev TotalRelation {Domain : Type u} {Codomain : Type v} :=
  TotalOverDomain (Domain := Domain) (Codomain := Codomain)

/--
**[Abbreviation — Functional]**

Sources: logic texts often call a relation functional when it determines at
most one output for each input.

Logical form:

```lean
abbrev Functional {Domain : Type u} {Codomain : Type v}
```
-/
abbrev Functional {Domain : Type u} {Codomain : Type v} :=
  SingleValued (Domain := Domain) (Codomain := Codomain)

/--
**[Abbreviation — FunctionGraph]**

Sources: set-theory texts identify the graph of a function with the function
itself in the relation convention.

Logical form:

```lean
abbrev FunctionGraph {Domain : Type u} {Codomain : Type v}
    (map : LRA.Map.Typed.TypedMap Domain Codomain)
```
-/
abbrev FunctionGraph {Domain : Type u} {Codomain : Type v}
    (map : LRA.Map.Typed.TypedMap Domain Codomain) :=
  Graph map

end LRA.Map.Graph
