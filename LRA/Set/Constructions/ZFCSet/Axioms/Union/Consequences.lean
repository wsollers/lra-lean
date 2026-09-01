import LRA.Set.Constructions.ZFCSet.Axioms.Union.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem EveryUnionOverEqualsTheUnionOver
    {A U : Set}
    (UIsUnionOf : IsUnionOf A U) :
    U = TheUnionOver A := by
  sorry

theorem TheUnionMembership (A B x : Set) :
    x ∈ TheUnion A B ↔ x ∈ A ∨ x ∈ B := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
