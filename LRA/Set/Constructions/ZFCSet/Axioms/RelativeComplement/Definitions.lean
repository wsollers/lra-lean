import LRA.Set.Constructions.ZFCSet.Axioms.Common

namespace LRA.Set.Constructions.ZFCSet.Axioms

def Subset (A B : Set) : Prop :=
  ∀ x : Set, x ∈ A → x ∈ B

def IsRelativeComplementOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ x ∈ A ∧ x ∉ B

end LRA.Set.Constructions.ZFCSet.Axioms
