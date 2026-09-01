import LRA.Set.Constructions.ZFCSet.Axioms.RelativeComplement.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem TheRelativeComplementMembership (A B x : Set) :
    x ∈ TheRelativeComplement A B ↔ x ∈ A ∧ x ∉ B := by
  sorry

theorem EveryRelativeComplementEqualsTheRelativeComplement
    {A B D : Set}
    (DIsRelativeComplementOf : IsRelativeComplementOf A B D) :
    D = TheRelativeComplement A B := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
