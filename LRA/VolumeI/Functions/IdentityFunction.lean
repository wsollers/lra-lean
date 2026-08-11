import LRA.VolumeI.Functions.Composition

namespace LRA.VolumeI.Functions

universe u

/--
Identity function on a type.

Logical form:

```lean
def IdentityFunction (Carrier : Type u) : Carrier -> Carrier :=
  fun element => element
```
-/
def IdentityFunction (Carrier : Type u) : Carrier -> Carrier :=
  fun element => element

end LRA.VolumeI.Functions
