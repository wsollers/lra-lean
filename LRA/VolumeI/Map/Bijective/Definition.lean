import LRA.VolumeI.Map.Injective.Definition
import LRA.VolumeI.Map.Surjective.Definition

namespace LRA.Map.Bijective

open LRA.Map.Typed
open LRA.Map.Injective
open LRA.Map.Surjective

universe u v

/--
**[Definition — Bijective]**

A typed map is bijective when it is injective and surjective.

Logical form:

```lean
def Bijective {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Prop
```
-/
def Bijective {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Prop :=
  Injective map /\ Surjective map

end LRA.Map.Bijective
