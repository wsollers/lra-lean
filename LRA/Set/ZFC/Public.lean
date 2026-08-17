import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Theorems

/-!
Canonical public names for the derived ZFC development.

Primitive predicates are owned directly by `LRA.Set.ZFC.Definitions`. The
underlying derived proofs are still being migrated from the historical
`LRA.Set.Enderton` namespace; this module exposes the canonical public theorem
and constructed-object surface during that transition.
-/

namespace LRA.Set.ZFC

/-- Canonical extensionality theorem for the ZFC set universe. -/
theorem SetExtensionality
    (A B : LRA.Set.ZFCSet)
    (sameMembers : ∀ x : LRA.Set.ZFCSet, x ∈ A ↔ x ∈ B) :
    A = B :=
  (LRA.Set.Enderton.SetEqualityIffSameMembers A B).2 sameMembers

/-- Textbook biconditional form of extensionality. -/
theorem SetEqualityIffSameMembers (A B : LRA.Set.ZFCSet) :
    A = B ↔ ∀ x : LRA.Set.ZFCSet, x ∈ A ↔ x ∈ B :=
  LRA.Set.Enderton.SetEqualityIffSameMembers A B

abbrev EmptySetExists := LRA.Set.Enderton.EmptySetExists

/-- Any two empty sets in the ZFC universe are equal. -/
theorem EmptySetIsUnique
    {A B : LRA.Set.ZFCSet}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    B = A :=
  LRA.Set.Enderton.EmptySetIsUnique AIsEmpty BIsEmpty

abbrev EmptySetExistsAndIsUnique := LRA.Set.Enderton.EmptySetExistsAndIsUnique
noncomputable abbrev TheEmptySet := LRA.Set.Enderton.TheEmptySet

/-- The chosen empty set satisfies the empty-set specification. -/
theorem TheEmptySetIsEmpty : IsEmptySet TheEmptySet :=
  LRA.Set.Enderton.TheEmptySetIsEmpty

/-- Compatibility spelling for the chosen-empty-set theorem. -/
theorem TheEmptySetIsEmptySet : IsEmptySet TheEmptySet :=
  TheEmptySetIsEmpty

noncomputable abbrev TheUnion := LRA.Set.Enderton.TheUnion
noncomputable abbrev TheIntersection := LRA.Set.Enderton.TheIntersection
noncomputable abbrev TheRelativeComplement := LRA.Set.Enderton.TheRelativeComplement
noncomputable abbrev TheSymmetricDifference := LRA.Set.Enderton.TheSymmetricDifference
noncomputable abbrev TheSeparatedSubset := LRA.Set.Enderton.TheSeparatedSubset
noncomputable abbrev ThePowerSet := LRA.Set.Enderton.ThePowerSet
noncomputable abbrev TheUnionOver := LRA.Set.Enderton.TheUnionOver
noncomputable abbrev TheIntersectionOver := LRA.Set.Enderton.TheIntersectionOver

end LRA.Set.ZFC
