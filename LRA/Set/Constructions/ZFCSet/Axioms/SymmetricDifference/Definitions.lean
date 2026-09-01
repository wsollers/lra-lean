import LRA.Set.Constructions.ZFCSet.Axioms.Common

namespace LRA.Set.Constructions.ZFCSet.Axioms

def IsSymmetricDifferenceOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)

end LRA.Set.Constructions.ZFCSet.Axioms
