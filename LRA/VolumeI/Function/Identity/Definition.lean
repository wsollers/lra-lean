import LRA.VolumeI.Function.Typed.Definition

namespace LRA.Function.Identity

open LRA.Function

universe u

/--
**[Definition — IdentityFunction]**

The identity map on a type.

Logical form:

```lean
def IdentityFunction (Domain : Type u) : Endofunction Domain
```
-/
def IdentityFunction (Domain : Type u) : Endofunction Domain :=
  fun input => input

end LRA.Function.Identity
