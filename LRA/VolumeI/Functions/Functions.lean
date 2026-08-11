import LRA.VolumeI.Relations.Basic.Relations
import LRA.VolumeI.Set.Interface.Operations

namespace LRA.VolumeI.Functions

open LRA.VolumeI.Set

universe u v

/-- A function from one carrier to another.

Logical form:

```lean
abbrev Function (Domain Codomain : Type u) := Domain -> Codomain
```
-/
abbrev Function (Domain Codomain : Type u) := Domain -> Codomain

/-- The graph relation determined by a function.

Logical form:

```lean
def Graph {Domain Codomain : Type u}
    (map : Function Domain Codomain) :
    LRA.VolumeI.Relations.HeterogeneousRelation Domain Codomain :=
  fun input output => map input = output
```
-/
def Graph {Domain Codomain : Type u}
    (map : Function Domain Codomain) :
    LRA.VolumeI.Relations.HeterogeneousRelation Domain Codomain :=
  fun input output => map input = output

/-- A binary relation is single-valued as a graph.

Logical form:

```lean
def SingleValued {Domain Codomain : Type u}
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Domain Codomain) : Prop :=
  forall input firstOutput secondOutput,
    graph input firstOutput -> graph input secondOutput -> firstOutput = secondOutput
```
-/
def SingleValued {Domain Codomain : Type u}
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Domain Codomain) : Prop :=
  forall input firstOutput secondOutput,
    graph input firstOutput -> graph input secondOutput -> firstOutput = secondOutput

/-- A binary relation is total over its domain as a graph.

Logical form:

```lean
def TotalOverDomain {Domain Codomain : Type u}
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Domain Codomain) : Prop :=
  forall input, exists output, graph input output
```
-/
def TotalOverDomain {Domain Codomain : Type u}
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Domain Codomain) : Prop :=
  forall input, exists output, graph input output

/-- A relation presents a function exactly when it is total and single-valued.

Logical form:

```lean
def FunctionAsRelation {Domain Codomain : Type u}
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Domain Codomain) : Prop :=
  TotalOverDomain graph /\ SingleValued graph
```
-/
def FunctionAsRelation {Domain Codomain : Type u}
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Domain Codomain) : Prop :=
  TotalOverDomain graph /\ SingleValued graph

/-- The domain set of a graph relation: the members of the ambient domain
that the graph relates to at least one output.

Generic over any set backend with separation -- the backend is inferred
from `ambientDomain`'s type, so this works for Enderton sets and predicate
sets alike, with no interface record threaded through.

Logical form:

```lean
def DomainOfGraph {Element : Type u} {SetObject : Type v} {Codomain : Type u}
    [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Element Codomain) :
    SetObject :=
  HasSeparation.separation ambientDomain
    (fun input => exists output, graph input output)
```
-/
def DomainOfGraph {Element : Type u} {SetObject : Type v} {Codomain : Type u}
    [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Element Codomain) :
    SetObject :=
  HasSeparation.separation ambientDomain
    (fun input => exists output, graph input output)

/-- The codomain set hit by a graph relation: the members of the ambient
codomain that the graph reaches from at least one input.

Logical form:

```lean
def RangeOfGraph {Element : Type u} {SetObject : Type v} {Domain : Type u}
    [HasSeparation Element SetObject]
    (ambientCodomain : SetObject)
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Domain Element) :
    SetObject :=
  HasSeparation.separation ambientCodomain
    (fun output => exists input, graph input output)
```
-/
def RangeOfGraph {Element : Type u} {SetObject : Type v} {Domain : Type u}
    [HasSeparation Element SetObject]
    (ambientCodomain : SetObject)
    (graph : LRA.VolumeI.Relations.HeterogeneousRelation Domain Element) :
    SetObject :=
  HasSeparation.separation ambientCodomain
    (fun output => exists input, graph input output)

end LRA.VolumeI.Functions
