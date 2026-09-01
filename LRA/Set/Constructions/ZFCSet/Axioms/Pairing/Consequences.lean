import LRA.Set.Constructions.ZFCSet.Axioms.Pairing.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem PairSetMembership (x1 x2 w : Set) :
    w ∈ PairSet x1 x2 ↔ w = x1 ∨ w = x2 := by
  sorry

theorem EveryPairSetEqualsPairSet
    {x1 x2 P : Set}
    (PIsPairSet : IsPairSet x1 x2 P) :
    P = PairSet x1 x2 := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
