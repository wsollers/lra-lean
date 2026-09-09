import LRA.Identity.Constructions.Mathlib.Primitives
import LRA.Identity.Interface.Model

namespace LRA.Identity.Constructions.Mathlib

universe u

/--
`NativeIdentityModel` packages Lean's native equality as the small identity
model consumed by ordinary laws.

Logical form:

```lean
def NativeIdentityModel (Carrier : Type u) : LRA.Identity.IdentityModel
```
-/
def NativeIdentityModel (Carrier : Type u) : LRA.Identity.IdentityModel where
  Carrier := Carrier
  Admissible := LRA.Identity.FullLeibniz Carrier
  Identity := NativeIdentity
  theory :=
    { reflexive := fun _ => rfl
      leibniz := by
        intro x y hxy Property _ hProperty
        exact hxy ▸ hProperty }
  fibers :=
    { left := fun _ => True.intro
      right := fun _ => True.intro }

end LRA.Identity.Constructions.Mathlib
