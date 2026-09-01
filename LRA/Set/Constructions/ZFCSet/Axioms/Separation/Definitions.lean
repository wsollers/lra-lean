import LRA.Set.Constructions.ZFCSet.Axioms.Common

namespace LRA.Set.Constructions.ZFCSet.Axioms

def IsSeparatedSubset (A : Set) (property : Set → Prop) (B : Set) : Prop :=
  ∀ x : Set, x ∈ B ↔ x ∈ A ∧ property x

end LRA.Set.Constructions.ZFCSet.Axioms
