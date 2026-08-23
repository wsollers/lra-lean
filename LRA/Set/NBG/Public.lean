import LRA.Set.NBG.Definitions
import LRA.Set.NBG.Theorems

                                                              

namespace LRA.Set.NBG

                                                                 
theorem SetExtensionality
    (A B : LRA.Set.NBGSet)
    (sameMembers : forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B) :
    A = B := by
  sorry

                                                                   
theorem ClassExtensionalityTheorem
    (A B : LRA.Set.NBGClass)
    (sameMembers : forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B) :
    A = B := by
  sorry

end LRA.Set.NBG
