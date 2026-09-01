import LRA.Set.Constructions.ZFCSet.Axioms.PowerSet.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem EveryPowerSetOfEqualsThePowerSet
    {A P : Set}
    (PIsPowerSetOf : IsPowerSetOf A P) :
    P = ThePowerSet A := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
