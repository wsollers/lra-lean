import LRA.Set.Constructions.ZFCSet.Axioms.Union.Theorems
import LRA.Set.Constructions.ZFCSet.Axioms.Separation.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

noncomputable def TheIntersectionOver (A : Set) : Set :=
  TheSeparatedSubset (TheUnionOver A)
    (fun x => ∀ B : Set, B ∈ A → x ∈ B)

end LRA.Set.Constructions.ZFCSet.Axioms
