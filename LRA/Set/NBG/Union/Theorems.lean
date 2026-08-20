import LRA.Set.NBG.Axioms.Union
import LRA.Set.NBG.Definitions
import LRA.Set.NBG.Extensionality.Theorems
import LRA.Set.NBG.Pairing.Theorems

namespace LRA.Set.NBG

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

end LRA.Set.NBG
