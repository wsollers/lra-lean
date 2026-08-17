import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Theorems

/-!
Canonical public names for the derived ZFC development.

Primitive predicates and migrated derived theory are owned directly by
`LRA.Set.ZFC`. Historical `LRA.Set.Enderton` names are compatibility aliases
inside the individual theorem modules rather than owners of canonical objects.
-/

namespace LRA.Set.ZFC

/-- Canonical extensionality theorem for the ZFC set universe. -/
theorem SetExtensionality
    (A B : LRA.Set.ZFCSet)
    (sameMembers : ∀ x : LRA.Set.ZFCSet, x ∈ A ↔ x ∈ B) :
    A = B := by
  sorry

/-- Compatibility spelling for the chosen-empty-set theorem. -/
theorem TheEmptySetIsEmptySet : IsEmptySet TheEmptySet := by
  sorry

end LRA.Set.ZFC
