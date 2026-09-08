import LRA.Identity.Constructions.Mathlib.Satisfies.SOLHenkin
import LRA.Identity.Constructions.Mathlib.Satisfies.SOLFull

namespace LRA.Identity.Constructions.Mathlib

universe u

/-- Native equality satisfies every Henkin second-order domain. -/
theorem SatisfiesSecondOrderHenkinIdentity (Carrier : Type u)
    (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory domain
      (NativeIdentity : Carrier -> Carrier -> Prop) := by
  sorry

/-- Native equality satisfies full second-order identity. -/
theorem SatisfiesSecondOrderFullIdentity (Carrier : Type u) :
    LRA.Identity.Logic.SOL.FullIdentityTheory
      (NativeIdentity : Carrier -> Carrier -> Prop) := by
  sorry

end LRA.Identity.Constructions.Mathlib
