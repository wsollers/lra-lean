import LRA.Identity.Constructions.Mathlib

namespace LRA.Identity.Interop.Providers.Default

universe u

/-- The project-default identity provider delegates to Lean's native equality. -/
scoped instance instIdentityRelation (Carrier : Type u) :
    LRA.Identity.IdentityRelation Carrier :=
  LRA.Identity.Constructions.Mathlib.instIdentityRelation Carrier

/--
`IdentityModel` is the project-default identity model, backed by Lean's native
equality.

Logical form:

```lean
def IdentityModel (Carrier : Type u) : LRA.Identity.IdentityModel :=
  LRA.Identity.Constructions.Mathlib.NativeIdentityModel Carrier
```
-/
def IdentityModel (Carrier : Type u) : LRA.Identity.IdentityModel :=
  LRA.Identity.Constructions.Mathlib.NativeIdentityModel Carrier

end LRA.Identity.Interop.Providers.Default
