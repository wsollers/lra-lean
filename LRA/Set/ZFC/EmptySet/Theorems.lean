import LRA.Set.ZFC.Axioms.EmptySet
import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Extensionality.Theorems

/-!
Existence, uniqueness, and the chosen ZFC empty set.
-/

namespace LRA.Set.ZFC

/-- There exists an empty set. -/
theorem EmptySetExists :
    ∃ A : Set, IsEmptySet A := by
  sorry

/-- Any empty set is equal to any other empty set. -/
theorem EmptySetIsUnique
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    B = A := by
  sorry

/-- Any two empty sets are equal. -/
theorem EmptySetsAreEqual
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    A = B := by
  sorry

/-- TeX label: `thm:empty-set-exists-unique`.
There exists exactly one empty set. -/
theorem EmptySetExistsAndIsUnique :
    ExistsAndUnique IsEmptySet := by
  sorry

/-- The empty set chosen after its existence has been established. -/
noncomputable def TheEmptySet : Set :=
  Classical.choose EmptySetExists

/-- The chosen empty set has no members. -/
theorem TheEmptySetIsEmpty :
    IsEmptySet TheEmptySet := by
  sorry

/-- Every empty set is equal to the chosen empty set. -/
theorem EveryEmptySetEqualsTheEmptySet
    {A : Set}
    (AIsEmpty : IsEmptySet A) :
    A = TheEmptySet := by
  sorry

end LRA.Set.ZFC
