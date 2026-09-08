import LRA.Identity.Constructions.Axiomatic.Satisfies.SOLHenkin
import LRA.Identity.Constructions.Axiomatic.Satisfies.SOLFull
import LRA.Identity.Interface.SecondOrder

namespace LRA.Identity.Constructions.Axiomatic

universe u

/-- The axiomatic construction satisfies every Henkin second-order domain. -/
theorem SatisfiesSecondOrderHenkinIdentity (Carrier : Type u)
    (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory domain
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop) := by
  sorry

/-- The axiomatic construction satisfies full second-order identity. -/
theorem SatisfiesSecondOrderFullIdentity (Carrier : Type u) :
    LRA.Identity.Logic.SOL.FullIdentityTheory
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop) := by
  sorry

end LRA.Identity.Constructions.Axiomatic
