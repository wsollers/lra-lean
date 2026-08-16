import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Identity

open LRA.Map.Typed

universe u

/--
**[Definition — IdentityMap]**

The identity map on a type.

Logical form:

```lean
def IdentityMap (Domain : Type u) : Endomap Domain
```
-/
def IdentityMap (Domain : Type u) : Endomap Domain :=
  fun input => input

end LRA.Map.Identity
