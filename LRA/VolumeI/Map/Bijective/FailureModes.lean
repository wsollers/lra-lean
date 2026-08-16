import LRA.VolumeI.Map.Bijective.Definition
import LRA.VolumeI.Map.Injective.FailureModes
import LRA.VolumeI.Map.Surjective.FailureModes

namespace LRA.Map.Bijective

open LRA.Map.Typed

universe u v

/--
**[Definition — FailsBijective]**

A map fails to be bijective when it has either a collision or a missed value.

Logical form:

```lean
def FailsBijective
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Prop
```
-/
def FailsBijective
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) : Prop :=
  LRA.Map.Injective.HasCollision map \/
    LRA.Map.Surjective.MissesValue map

end LRA.Map.Bijective
