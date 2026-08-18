import LRA.VolumeI.Function.Typed.Definition
import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.Function.Partial

open LRA.Function

universe u v

/--
**[Structure — PartialFunction]**

A partial map is a domain-of-definition predicate with a value on every
defined input.

Logical form:

```lean
structure PartialFunction (Domain : Type u) (Codomain : Type v)
```
-/
structure PartialFunction (Domain : Type u) (Codomain : Type v) where
  DefinedAt : Domain -> Prop
  value : forall input, DefinedAt input -> Codomain

/--
**[Abbreviation — PartialEndofunction]**

A partial map from a carrier to itself.

Logical form:

```lean
abbrev PartialEndofunction (Carrier : Type u)
```
-/
abbrev PartialEndofunction (Carrier : Type u) :=
  PartialFunction Carrier Carrier

/--
**[Definition — Graph]**

The graph relation of a partial map.

Logical form:

```lean
def Graph {Domain : Type u} {Codomain : Type v}
    (map : PartialFunction Domain Codomain) :
    LRA.Relation.HeterogeneousBinaryRelation Domain Codomain
```
-/
def Graph {Domain : Type u} {Codomain : Type v}
    (map : PartialFunction Domain Codomain) :
    LRA.Relation.HeterogeneousBinaryRelation Domain Codomain :=
  fun input output => exists defined : map.DefinedAt input,
    map.value input defined = output

end LRA.Function.Partial
