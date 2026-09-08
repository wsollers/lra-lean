import LRA.Identity.Constructions.Axiomatic.Laws.Identity
import LRA.Identity.Interface.Logic.FOL.Theory
import LRA.Identity.Interface.Logic.SOL.Theory

namespace LRA.Identity.Constructions.Axiomatic.Laws

universe u

/-- Full second-order axiomatic identity restricts to any Henkin domain. -/
theorem FullToHenkin {Carrier : Type u}
    (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier)
    (h : LRA.Identity.Logic.SOL.FullIdentityTheory
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop)) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory domain Ax_IdentityRelation := by
  sorry

/-- Full second-order axiomatic identity restricts to any FOL-definability
policy. -/
theorem FullToFirstOrder {Carrier : Type u}
    (Expressible : (Carrier -> Prop) -> Prop)
    (h : LRA.Identity.Logic.SOL.FullIdentityTheory
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop)) :
    LRA.Identity.Logic.FOL.IdentityTheoryFor Expressible Ax_IdentityRelation := by
  sorry

/-- A Henkin axiomatic theory is full when every predicate is admitted. -/
theorem HenkinToFullOfAllPredicates {Carrier : Type u}
    {domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier}
    (h : LRA.Identity.Logic.SOL.HenkinIdentityTheory domain
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop))
    (hAll : forall P, domain.Admissible P) :
    LRA.Identity.Logic.SOL.FullIdentityTheory
      (Ax_IdentityRelation : Carrier -> Carrier -> Prop) := by
  sorry

end LRA.Identity.Constructions.Axiomatic.Laws
