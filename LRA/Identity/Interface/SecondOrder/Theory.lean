import LRA.Identity.Interface.SecondOrder.Model

namespace LRA.Identity.Interface.SecondOrder

/-- Henkin second-order identity: reflexivity plus Leibniz substitution over
the model's admitted predicates. -/
abbrev HenkinTheory {L : LStructure} (M : HenkinModel L) : Prop :=
  LRA.Identity.Logic.SOL.HenkinIdentityTheory M.predicateDomain
    M.firstOrder.Identity

/-- Full second-order identity: reflexivity plus Leibniz substitution over
every predicate on the carrier. -/
abbrev FullTheory {L : LStructure} (M : FullModel L) : Prop :=
  LRA.Identity.Logic.SOL.FullIdentityTheory M.firstOrder.Identity

end LRA.Identity.Interface.SecondOrder
