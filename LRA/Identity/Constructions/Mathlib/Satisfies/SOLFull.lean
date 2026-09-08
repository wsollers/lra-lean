import LRA.Identity.Constructions.Mathlib.Primitives
import LRA.Identity.Interface.Logic.SOL.Theory

namespace LRA.Identity.Constructions.Mathlib

universe u

/-- Native equality satisfies full second-order identity.

Logical form: `FullIdentityTheory NativeIdentity`.
-/
theorem SatisfiesSOLFullIdentity (Carrier : Type u) :
    LRA.Identity.Logic.SOL.FullIdentityTheory
      (NativeIdentity : Carrier -> Carrier -> Prop) := by
  sorry

end LRA.Identity.Constructions.Mathlib
