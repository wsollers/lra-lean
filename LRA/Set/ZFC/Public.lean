import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Theorems

/-!
Canonical public names for the derived ZFC development.

Primitive predicates and migrated derived theory are owned directly by
`LRA.Set.ZFC`. The remaining constructed-object aliases below are temporary
bridges while their theorem modules are moved out of the historical
`LRA.Set.Enderton` namespace.
-/

namespace LRA.Set.ZFC

/-- Canonical extensionality theorem for the ZFC set universe. -/
theorem SetExtensionality
    (A B : LRA.Set.ZFCSet)
    (sameMembers : ∀ x : LRA.Set.ZFCSet, x ∈ A ↔ x ∈ B) :
    A = B :=
  (SetEqualityIffSameMembers A B).2 sameMembers

/-- Compatibility spelling for the chosen-empty-set theorem. -/
theorem TheEmptySetIsEmptySet : IsEmptySet TheEmptySet :=
  TheEmptySetIsEmpty

noncomputable abbrev TheIntersection := LRA.Set.Enderton.TheIntersection
noncomputable abbrev TheRelativeComplement := LRA.Set.Enderton.TheRelativeComplement
noncomputable abbrev TheSymmetricDifference := LRA.Set.Enderton.TheSymmetricDifference
noncomputable abbrev TheSeparatedSubset := LRA.Set.Enderton.TheSeparatedSubset
noncomputable abbrev ThePowerSet := LRA.Set.Enderton.ThePowerSet
noncomputable abbrev TheIntersectionOver := LRA.Set.Enderton.TheIntersectionOver

end LRA.Set.ZFC
