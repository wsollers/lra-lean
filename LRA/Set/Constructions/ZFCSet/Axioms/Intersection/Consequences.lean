import LRA.Set.Constructions.ZFCSet.Axioms.Intersection.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem TheIntersectionMembership (A B x : Set) :
    x ∈ TheIntersection A B ↔ x ∈ A ∧ x ∈ B := by
  sorry

theorem EveryIntersectionEqualsTheIntersection
    {A B D : Set}
    (DIsIntersectionOf : IsIntersectionOf A B D) :
    D = TheIntersection A B := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
