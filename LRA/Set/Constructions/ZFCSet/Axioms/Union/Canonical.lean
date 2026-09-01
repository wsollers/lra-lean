import LRA.Set.Constructions.ZFCSet.Axioms.Union.Uniqueness
import LRA.Set.Constructions.ZFCSet.Axioms.Pairing.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

noncomputable def TheUnionOver (A : Set) : Set :=
  Classical.choose (UnionOverExists A)

theorem TheUnionOverIsUnionOf (A : Set) :
    IsUnionOf A (TheUnionOver A) := by
  sorry

noncomputable def TheUnion (A B : Set) : Set :=
  TheUnionOver (PairSet A B)

end LRA.Set.Constructions.ZFCSet.Axioms
