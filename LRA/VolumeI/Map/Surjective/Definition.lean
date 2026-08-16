import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Surjective

open LRA.Map.Typed

universe u v

/--
**[Definition — Surjective]**

A typed map is surjective when every codomain element is hit by some input.

Logical form:

```lean
def Surjective {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Prop
```
-/
def Surjective {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Prop :=
  forall output, exists input, map input = output

end LRA.Map.Surjective
