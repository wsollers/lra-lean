import LRA.Identity.Axioms
import LRA.Set.TG.Axioms.Extensionality

namespace LRA.Set.TG

/-- Two sets are equal if and only if they have the same members. -/
theorem SetEqualityIffSameMembers (A B : LRA.Set.TGSet) :
    A = B <-> forall x : LRA.Set.TGSet, x ∈ A <-> x ∈ B := by
  sorry

end LRA.Set.TG
