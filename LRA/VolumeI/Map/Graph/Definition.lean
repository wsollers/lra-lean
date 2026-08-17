import LRA.VolumeI.Map.Typed.Definition
import LRA.VolumeI.Relations.Basic.Relations
import LRA.VolumeI.Set.Interface.Operations

namespace LRA.Map.Graph

open LRA.Map.Typed
open LRA.Set

universe u v w

/--
**[Definition — Graph]**

The graph relation determined by a typed map.

Logical form:

```lean
def Graph {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    LRA.Relation.HeterogeneousBinaryRelation Domain Codomain
```
-/
def Graph {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    LRA.Relation.HeterogeneousBinaryRelation Domain Codomain :=
  fun input output => map input = output

/--
**[Definition — SingleValued]**

A heterogeneous relation is single-valued when each input has at most one
related output.

Logical form:

```lean
def SingleValued {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousBinaryRelation Domain Codomain) : Prop
```
-/
def SingleValued {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  forall input firstOutput secondOutput,
    relation input firstOutput ->
    relation input secondOutput ->
    firstOutput = secondOutput

/--
**[Definition — TotalOverDomain]**

A heterogeneous relation is total over its domain when every input has a
related output.

Logical form:

```lean
def TotalOverDomain {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousBinaryRelation Domain Codomain) : Prop
```
-/
def TotalOverDomain {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  forall input, exists output, relation input output

/--
**[Definition — FunctionalRelation]**

A relation presents a typed map when it is total and single-valued.

Logical form:

```lean
def FunctionalRelation {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousBinaryRelation Domain Codomain) : Prop
```
-/
def FunctionalRelation {Domain : Type u} {Codomain : Type v}
    (relation : LRA.Relation.HeterogeneousBinaryRelation Domain Codomain) : Prop :=
  TotalOverDomain relation /\ SingleValued relation

/--
**[Definition — DomainOfGraph]**

The domain of a graph relation, separated from an ambient backend set.

Logical form:

```lean
def DomainOfGraph {Element : Type u} {Codomain : Type v}
    {SetObject : Type w}
    [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (graph : LRA.Relation.HeterogeneousBinaryRelation Element Codomain) :
    SetObject
```
-/
def DomainOfGraph {Element : Type u} {Codomain : Type v}
    {SetObject : Type w}
    [HasSeparation Element SetObject]
    (ambientDomain : SetObject)
    (graph : LRA.Relation.HeterogeneousBinaryRelation Element Codomain) :
    SetObject :=
  HasSeparation.separation ambientDomain
    (fun input => exists output, graph input output)

/--
**[Definition — RangeOfGraph]**

The range of a graph relation, separated from an ambient backend set.

Logical form:

```lean
def RangeOfGraph {Domain : Type u} {Element : Type v}
    {SetObject : Type w}
    [HasSeparation Element SetObject]
    (ambientCodomain : SetObject)
    (graph : LRA.Relation.HeterogeneousBinaryRelation Domain Element) :
    SetObject
```
-/
def RangeOfGraph {Domain : Type u} {Element : Type v}
    {SetObject : Type w}
    [HasSeparation Element SetObject]
    (ambientCodomain : SetObject)
    (graph : LRA.Relation.HeterogeneousBinaryRelation Domain Element) :
    SetObject :=
  HasSeparation.separation ambientCodomain
    (fun output => exists input, graph input output)

end LRA.Map.Graph
