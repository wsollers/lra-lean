import LRA.Identity.Constructions.Axiomatic.Satisfies.SOLFull
import LRA.Identity.Laws.ModelTheory.Relationships

namespace LRA.Identity.Constructions.Axiomatic

universe u

/-- The axiomatic construction satisfies identity for every selected Henkin
predicate domain.

Logical form: `HenkinIdentityTheory domain Ax_IdentityRelation`.
-/
theorem SatisfiesSOLHenkinIdentity (Carrier : Type u)
    (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory domain
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop) := by
  sorry

/-- The axiomatic relation satisfies identity relative to the unary predicate
domain of the specified Henkin model.

Logical form:
```lean
HenkinIdentityTheory (UnaryPredicateDomain M) Ax_IdentityRelation
```
-/
theorem SatisfiesSOLHenkinModelIdentity
    {S : LRA.Logic.Signature}
    (M : LRA.ModelTheory.SecondOrder.HenkinModel S) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory
      (LRA.Identity.ModelTheory.SOL.UnaryPredicateDomain M)
      (Ax_IdentityRelation : M.Domain -> M.Domain -> Prop) := by
  sorry

end LRA.Identity.Constructions.Axiomatic
