import LRA.Identity.Axioms
import LRA.Set.TG.Axioms.Extensionality

namespace LRA.Set.TG

                                                                    
theorem SetEqualityIffSameMembers (A B : LRA.Set.TGSet) :
    A = B <-> forall x : LRA.Set.TGSet, x ∈ A <-> x ∈ B := by
  sorry

end LRA.Set.TG
