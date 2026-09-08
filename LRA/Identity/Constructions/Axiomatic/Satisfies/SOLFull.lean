import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Satisfies
import LRA.Identity.Interface.Logic.SOL.Theory

namespace LRA.Identity.Constructions.Axiomatic

universe u

/-- The axiomatic construction satisfies full second-order identity.

Logical form: `FullIdentityTheory Ax_IdentityRelation`.
-/
theorem SatisfiesSOLFullIdentity (Carrier : Type u) :
    LRA.Identity.Logic.SOL.FullIdentityTheory
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop) := by
  sorry

end LRA.Identity.Constructions.Axiomatic
