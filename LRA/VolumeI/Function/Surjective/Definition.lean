import LRA.VolumeI.Function.Typed.Definition

namespace LRA.Function.Surjective

open LRA.Function

universe u v

/--
**[Definition — Surjective]**

A typed function is surjective when every codomain element is hit by some input.

Logical form:

```lean
def Surjective {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) : Prop
```
-/
def Surjective {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) : Prop :=
  forall output, exists input, map input = output

end LRA.Function.Surjective
