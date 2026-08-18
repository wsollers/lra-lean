import LRA.VolumeI.Function.Bijective.Definition
import LRA.VolumeI.Function.Injective.FailureModes
import LRA.VolumeI.Function.Surjective.FailureModes

namespace LRA.Function.Bijective

open LRA.Function

universe u v

/--
**[Definition — FailsBijective]**

A map fails to be bijective when it has either a collision or a missed value.

Logical form:

```lean
def FailsBijective
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) : Prop
```
-/
def FailsBijective
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) : Prop :=
  LRA.Function.Injective.HasCollision map \/
    LRA.Function.Surjective.MissesValue map

end LRA.Function.Bijective
