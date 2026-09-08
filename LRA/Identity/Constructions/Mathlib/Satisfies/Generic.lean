import LRA.Identity.Constructions.Mathlib.Primitives
import LRA.Identity.Interface.Identity

namespace LRA.Identity.Constructions.Mathlib

universe u

/-- Native equality satisfies the construction-independent identity contract.

Logical form:
```lean
IsIdentityRelation (NativeIdentity : Carrier -> Carrier -> Prop)
```
-/
theorem SatisfiesGenericIdentity (Carrier : Type u) :
    LRA.Identity.IsIdentityRelation
      (NativeIdentity : Carrier -> Carrier -> Prop) := by
  sorry

end LRA.Identity.Constructions.Mathlib
