import LRA.VolumeI.Map.Typed.Definition
import LRA.VolumeI.Relations.Basic.Relations

namespace LRA.Map.Partial

open LRA.Map.Typed

universe u v

/--
**[Structure — PartialMap]**

A partial map is a domain-of-definition predicate with a value on every
defined input.

Logical form:

```lean
structure PartialMap (Domain : Type u) (Codomain : Type v)
```
-/
structure PartialMap (Domain : Type u) (Codomain : Type v) where
  DefinedAt : Domain -> Prop
  value : forall input, DefinedAt input -> Codomain

/--
**[Abbreviation — PartialEndomap]**

A partial map from a carrier to itself.

Logical form:

```lean
abbrev PartialEndomap (Carrier : Type u)
```
-/
abbrev PartialEndomap (Carrier : Type u) :=
  PartialMap Carrier Carrier

/--
**[Definition — Graph]**

The graph relation of a partial map.

Logical form:

```lean
def Graph {Domain : Type u} {Codomain : Type v}
    (map : PartialMap Domain Codomain) :
    LRA.Relation.HeterogeneousRelation Domain Codomain
```
-/
def Graph {Domain : Type u} {Codomain : Type v}
    (map : PartialMap Domain Codomain) :
    LRA.Relation.HeterogeneousRelation Domain Codomain :=
  fun input output => exists defined : map.DefinedAt input,
    map.value input defined = output

end LRA.Map.Partial
