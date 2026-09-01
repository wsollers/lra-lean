import LRA.Set.Constructions.ZFCSet.Axioms.SymmetricDifference.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem TheSymmetricDifferenceMembership (A B x : Set) :
    x ∈ TheSymmetricDifference A B ↔
      (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A) := by
  sorry

theorem EverySymmetricDifferenceEqualsTheSymmetricDifference
    {A B D : Set}
    (DIsSymmetricDifferenceOf : IsSymmetricDifferenceOf A B D) :
    D = TheSymmetricDifference A B := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
