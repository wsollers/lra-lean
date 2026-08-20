import LRA.Set.TG.Axioms.Union
import LRA.Set.TG.Definitions
import LRA.Set.TG.Extensionality.Theorems
import LRA.Set.TG.Pairing.Theorems

namespace LRA.Set.TG

theorem UnionOverExists (A : Set) : exists U : Set, IsUnionOf A U := by
  sorry


theorem UnionOverIsUnique {A U V : Set}
    (UIsUnionOf : IsUnionOf A U) (VIsUnionOf : IsUnionOf A V) :
    V = U := by
  sorry

noncomputable def TheUnionOver (A : Set) : Set :=
  Classical.choose (UnionOverExists A)

theorem TheUnionOverIsUnionOf (A : Set) : IsUnionOf A (TheUnionOver A) := by
  sorry

noncomputable def TheUnion (A B : Set) : Set :=
  TheUnionOver (PairSet A B)

theorem TheUnionMembership (A B x : Set) :
    x ∈ TheUnion A B <-> x ∈ A \/ x ∈ B := by
  sorry

end LRA.Set.TG
