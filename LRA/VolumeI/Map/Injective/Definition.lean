import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Injective

open LRA.Map.Typed

universe u v

/--
**[Definition — Injective]**

A typed map is injective when equal outputs imply equal inputs.

Logical form:

```lean
def Injective {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Prop
```
-/
def Injective {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Prop :=
  forall first second, map first = map second -> first = second

end LRA.Map.Injective
