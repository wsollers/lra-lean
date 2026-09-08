import LRA.Identity.Constructions.Mathlib.Satisfies.SOLFull
import LRA.Identity.Laws.ModelTheory.Relationships

namespace LRA.Identity.Constructions.Mathlib

universe u

/-- Native equality satisfies identity for every selected Henkin predicate
domain.

Logical form: `HenkinIdentityTheory domain NativeIdentity`.
-/
theorem SatisfiesSOLHenkinIdentity (Carrier : Type u)
    (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory domain
      (NativeIdentity : Carrier -> Carrier -> Prop) := by
  sorry

/-- Native equality satisfies identity relative to the unary predicate domain
of the specified Henkin model.

Logical form:
```lean
HenkinIdentityTheory (UnaryPredicateDomain M) NativeIdentity
```
-/
theorem SatisfiesSOLHenkinModelIdentity
    {S : LRA.Logic.Signature}
    (M : LRA.ModelTheory.SecondOrder.HenkinModel S) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory
      (LRA.Identity.ModelTheory.SOL.UnaryPredicateDomain M)
      (NativeIdentity : M.Domain -> M.Domain -> Prop) := by
  sorry

end LRA.Identity.Constructions.Mathlib
