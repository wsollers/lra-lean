import LRA.Set.Constructions.ZFCSet.Axioms.IntersectionOver.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem TheIntersectionOverMembership (A x : Set)
    (collectionNonempty : ∃ B : Set, B ∈ A) :
    x ∈ TheIntersectionOver A ↔ ∀ B : Set, B ∈ A → x ∈ B := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
