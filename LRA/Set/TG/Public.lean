import LRA.Set.TG.Definitions
import LRA.Set.TG.Theorems

/-! Canonical public names for the derived TG development. -/

namespace LRA.Set.TG

/-- Canonical extensionality theorem for the TG set universe. -/
theorem SetExtensionality
    (A B : LRA.Set.TGSet)
    (sameMembers : forall x : LRA.Set.TGSet, x ∈ A <-> x ∈ B) :
    A = B := by
  sorry

end LRA.Set.TG
