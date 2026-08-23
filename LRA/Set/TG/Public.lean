import LRA.Set.TG.Definitions
import LRA.Set.TG.Theorems

                                                             

namespace LRA.Set.TG

                                                                
theorem SetExtensionality
    (A B : LRA.Set.TGSet)
    (sameMembers : forall x : LRA.Set.TGSet, x ∈ A <-> x ∈ B) :
    A = B := by
  sorry

end LRA.Set.TG
