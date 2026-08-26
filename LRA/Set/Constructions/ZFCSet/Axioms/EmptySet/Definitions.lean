import LRA.Set.Constructions.ZFCSet.Axioms.Common

namespace LRA.Set.Constructions.ZFCSet.Axioms

def IsEmptySet (A : Set) : Prop :=
  ∀ x : Set, x ∉ A

end LRA.Set.Constructions.ZFCSet.Axioms
