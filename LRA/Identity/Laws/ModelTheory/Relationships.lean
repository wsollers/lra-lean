import LRA.Identity.Laws.ModelTheory.SOLHenkin
import LRA.Identity.Laws.ModelTheory.SOLFull
import LRA.Identity.Interface.ModelTheory.SOL.Relationships

namespace LRA.Identity.Logic.SOL

universe u

/-- A full identity theory satisfies every Henkin restriction of its predicate
domain.

Logical form: `FullIdentityTheory R -> HenkinIdentityTheory domain R`.
-/
theorem FullIdentityTheory.ToHenkin {Carrier : Type u}
    {R : Carrier -> Carrier -> Prop}
    (domain : HenkinPredicateDomain Carrier)
    (h : FullIdentityTheory R) : HenkinIdentityTheory domain R := by
  sorry

/-- A Henkin identity theory becomes full when every predicate is admitted.

Logical form:
`HenkinIdentityTheory domain R -> (forall P, Admissible P) -> FullIdentityTheory R`.
-/
theorem HenkinIdentityTheory.ToFullOfAllPredicates {Carrier : Type u}
    {domain : HenkinPredicateDomain Carrier}
    {R : Carrier -> Carrier -> Prop}
    (h : HenkinIdentityTheory domain R)
    (hAll : forall P, domain.Admissible P) : FullIdentityTheory R := by
  sorry

/-- Forgetting a full model to a Henkin model retains a certificate that both
second-order domains are universal.

Logical form: `IsFull M.toHenkinModel`.
-/
theorem FullModelToHenkinIsFull {S : LRA.Logic.Signature}
    (M : LRA.ModelTheory.SecondOrder.FullModel S) :
    LRA.Identity.ModelTheory.SOL.IsFull M.toHenkinModel := by
  sorry

end LRA.Identity.Logic.SOL
