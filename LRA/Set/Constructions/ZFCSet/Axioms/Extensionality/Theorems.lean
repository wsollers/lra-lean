import LRA.Set.Constructions.ZFCSet.Axioms.Axioms.Extensionality

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem SetEqualityIffSameMembers (A B : LRA.Set.Constructions.ZFCSet) :
    A = B ↔
      ∀ x : LRA.Set.Constructions.ZFCSet, x ∈ A ↔ x ∈ B := by
  sorry

end LRA.Set.Constructions.ZFCSet.Axioms
