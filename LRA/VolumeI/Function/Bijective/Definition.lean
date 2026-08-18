import LRA.VolumeI.Function.Injective.Definition
import LRA.VolumeI.Function.Surjective.Definition

namespace LRA.Function.Bijective

open LRA.Function
open LRA.Function.Injective
open LRA.Function.Surjective

universe u v

/--
**[Definition — Bijective]**

A typed function is bijective when it is injective and surjective.

Logical form:

```lean
def Bijective {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) : Prop
```
-/
def Bijective {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) : Prop :=
  Injective map /\ Surjective map

end LRA.Function.Bijective
