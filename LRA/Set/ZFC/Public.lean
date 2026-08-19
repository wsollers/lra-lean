import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Theorems

/-!
Canonical public names for the derived ZFC development.

Primitive predicates and derived theory are owned directly by `LRA.Set.ZFC`,
which is the single owner of every name below.
-/

namespace LRA.Set.ZFC

/-- Canonical extensionality theorem for the ZFC set universe. -/
theorem SetExtensionality
    (A B : LRA.Set.ZFCSet)
    (sameMembers : ∀ x : LRA.Set.ZFCSet, x ∈ A ↔ x ∈ B) :
    A = B := by
  sorry

end LRA.Set.ZFC
