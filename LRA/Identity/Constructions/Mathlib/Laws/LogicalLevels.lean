import LRA.Identity.Constructions.Mathlib.Laws.Identity
import LRA.Identity.Interface.Logic.FOL.Theory
import LRA.Identity.Interface.Logic.SOL.Theory

namespace LRA.Identity.Constructions.Mathlib.Laws

universe u

/-- Full second-order native identity restricts to any Henkin domain. -/
theorem FullToHenkin {Carrier : Type u}
    (domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier)
    (h : LRA.Identity.Logic.SOL.FullIdentityTheory
      (NativeIdentity : Carrier -> Carrier -> Prop)) :
    LRA.Identity.Logic.SOL.HenkinIdentityTheory domain NativeIdentity := by
  sorry

/-- Full second-order native identity restricts to any FOL-definability
policy. -/
theorem FullToFirstOrder {Carrier : Type u}
    (Expressible : (Carrier -> Prop) -> Prop)
    (h : LRA.Identity.Logic.SOL.FullIdentityTheory
      (NativeIdentity : Carrier -> Carrier -> Prop)) :
    LRA.Identity.Logic.FOL.IdentityTheoryFor Expressible NativeIdentity := by
  sorry

/-- A Henkin native-identity theory is full when every predicate is admitted. -/
theorem HenkinToFullOfAllPredicates {Carrier : Type u}
    {domain : LRA.Identity.Logic.SOL.HenkinPredicateDomain Carrier}
    (h : LRA.Identity.Logic.SOL.HenkinIdentityTheory domain
      (NativeIdentity : Carrier -> Carrier -> Prop))
    (hAll : forall P, domain.Admissible P) :
    LRA.Identity.Logic.SOL.FullIdentityTheory
      (NativeIdentity : Carrier -> Carrier -> Prop) := by
  sorry

end LRA.Identity.Constructions.Mathlib.Laws
