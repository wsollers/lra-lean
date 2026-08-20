import LRA.Identity.Axioms
import LRA.Set.NBG.Axioms.Extensionality

namespace LRA.Set.NBG

theorem SetEqualityIffSameMembers (A B : LRA.Set.NBGSet) :
    A = B <-> forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B := by
  sorry


theorem ClassEqualityIffSameMembers (A B : LRA.Set.NBGClass) :
    A = B <-> forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B := by
  sorry

end LRA.Set.NBG
