import LRA.Set.NBG.Definitions
import LRA.Set.NBG.Theorems

/-! Canonical public names for the derived NBG development. -/

namespace LRA.Set.NBG

/-- Canonical extensionality theorem for the NBG set universe. -/
theorem SetExtensionality
    (A B : LRA.Set.NBGSet)
    (sameMembers : forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B) :
    A = B := by
  sorry

/-- Canonical extensionality theorem for the NBG class universe. -/
theorem ClassExtensionalityTheorem
    (A B : LRA.Set.NBGClass)
    (sameMembers : forall x : LRA.Set.NBGSet, x ∈ A <-> x ∈ B) :
    A = B := by
  sorry

end LRA.Set.NBG
